#![deny(clippy::all)]
#![warn(clippy::pedantic)]
#![deny(rust_2018_idioms)]

fn main() {
    let mut acceptor: Acceptor<'_, 6> = AcceptorBuilder::new()
        .with_rule("S", &["E"])
        .with_rule("E", &["TE'"])
        .with_rule("E'", &["+TE'", ""])
        .with_rule("T", &["FT'"])
        .with_rule("T'", &["*FT'", ""])
        .with_rule("F", &["b", "(E)"])
        .matching("b#");

    println!("{acceptor}");
    loop {
        let state = acceptor.next();
        println!("(Caso {: <2})  |- {acceptor}", acceptor.caso);
        if state == State::T {
            break;
        }
    }
}

#[derive(Debug, Default, Clone, Copy, PartialEq, Eq, PartialOrd, Ord)]
enum State {
    #[default]
    Q,
    B,
    T,
}

type NonTerminalID = usize;

#[derive(Debug)]
struct Acceptor<'inp, const R: usize> {
    nt_sorted: [NonTerminalID; R],
    non_terminal: [&'inp str; R],
    number_rules: [usize; R],
    starting_ptr: [usize; R],
    rhs: Vec<&'inp str>,
    symb: Vec<(Element, usize)>,
    sent: Vec<Element>,
    state: State,
    input: &'inp str,
    caso: &'static str,
    matched: usize,
}

impl<'inp, const R: usize> std::fmt::Display for Acceptor<'inp, R> {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "({:?}, {}, ", self.state, self.matched + 1)?;
        if self.symb.is_empty() {
            write!(f, "\u{03B5}")?;
        }
        for (ref symb, n) in &self.symb {
            let n = n + 1;
            match symb {
                Element::NonTerminal(id) => {
                    write!(f, "{{{}{n}}}", self.non_terminal[*id])?;
                }
                Element::Terminal(c) => {
                    write!(f, "{c}")?;
                }
            }
        }

        if self.sent.is_empty() {
            write!(f, ", \u{03B5})")
        } else {
            write!(f, ", ")?;
            for element in self.sent.iter().rev() {
                match element {
                    Element::NonTerminal(id) => {
                        write!(f, "{}", self.non_terminal[*id])?;
                    }
                    Element::Terminal(c) => {
                        write!(f, "{c}")?;
                    }
                }
            }
            write!(f, ")")
        }
    }
}

struct AcceptorBuilder<'inp, const R: usize> {
    nt_sorted: [NonTerminalID; R],
    non_terminal: [&'inp str; R],
    number_rules: [usize; R],
    starting_ptr: [usize; R],
    rhs: Vec<&'inp str>,
    pushed: usize,
}

impl<'inp, const R: usize> AcceptorBuilder<'inp, R> {
    pub fn new() -> Self {
        Self {
            number_rules: [0; R],
            starting_ptr: [0; R],
            rhs: Vec::with_capacity(R * 3),
            non_terminal: [""; R],
            nt_sorted: [0; R],
            pushed: 0,
        }
    }

    fn add_rule(&mut self, name: &'inp str, produces: &[&'inp str]) {
        let existing = self.non_terminal.iter().position(|&a| a == name);

        if let Some(existing_position) = existing {
            panic!("Productions rules for the non-terminal {name} already exist (at idx {existing_position})");
        } else {
            assert!(
                self.pushed < R,
                "Can't push production {:?} to Accpetor, \
                there are more productions than spaces in the stack (expected productions: {}). \
                    Try and bump up the number of productions: Accpetor<{}>",
                name,
                R,
                R + 1
            );

            self.number_rules[self.pushed] = produces.len();
            self.starting_ptr[self.pushed] = self.rhs.len();
            self.rhs.extend(produces.iter());
            self.non_terminal[self.pushed] = name;
            self.nt_sorted[self.pushed] = self.pushed;
            self.pushed += 1;
        }
    }

    pub fn with_rule(mut self, name: &'inp str, produces: &[&'inp str]) -> Self {
        self.add_rule(name, produces);
        self
    }

    pub fn build(mut self) -> Acceptor<'inp, R> {
        assert!(
            self.pushed == R,
            "Missing productions. \
            Expected production number is {R} but only {} productions were provided",
            { self.pushed }
        );

        self.nt_sorted
            .sort_unstable_by(|&a, &b| self.non_terminal[b].len().cmp(&self.non_terminal[a].len()));
        Acceptor {
            number_rules: self.number_rules,
            starting_ptr: self.starting_ptr,
            rhs: self.rhs,
            non_terminal: self.non_terminal,
            nt_sorted: self.nt_sorted,
            sent: Vec::with_capacity(self.pushed * 2),
            input: "",
            matched: 0,
            symb: Vec::with_capacity(self.pushed * 2),
            state: State::Q,
            caso: "",
        }
    }

    pub fn matching(self, inp: &'inp str) -> Acceptor<'inp, R> {
        let mut res = self.build();
        res.set_match(inp);
        res.symb.reserve(inp.len());
        res
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord)]
enum Element {
    NonTerminal(NonTerminalID),
    Terminal(char),
}

impl<'inp, const R: usize> Acceptor<'inp, R> {
    fn set_match(&mut self, t: &'inp str) {
        self.input = t;

        self.matched = 0;
        self.state = State::Q;
        self.symb.clear();
        self.sent.clear();

        self.sent.push(Element::Terminal('#'));
        self.sent.push(Element::NonTerminal(0));
    }

    fn remaining_for_id(&self, for_id: NonTerminalID) -> usize {
        assert!(for_id < R);

        let current = self
            .symb
            .iter()
            .rev()
            .find_map(|(id, rem)| {
                matches!(id, Element::NonTerminal(id) if *id == for_id).then(|| rem)
            })
            .unwrap_or(&0);

        self.number_rules[for_id] - current - 1
    }

    fn get_next_elem_rev<'a>(&self, from: &'a str) -> (Element, &'a str) {
        for (id, nt) in self
            .nt_sorted
            .iter()
            .copied()
            .map(|id| (id, self.non_terminal[id]))
        {
            if let Some(s) = from.strip_suffix(nt) {
                return (Element::NonTerminal(id), s);
            }
        }

        (
            Element::Terminal(from.chars().last().unwrap()),
            &from[..from.len() - 1],
        )
    }

    fn extend_with_elements(&mut self, from: &str) {
        let mut from = from;
        while !from.is_empty() {
            let (next, f) = self.get_next_elem_rev(from);
            self.sent.push(next);
            from = f;
        }
    }

    fn pop_with_elements(&mut self, from: &str) {
        let mut from = from;
        while !from.is_empty() {
            let (_, f) = self.get_next_elem_rev(from);
            self.sent.pop();
            from = f;
        }
    }

    /// Returns a reference to the remaining input string to analyze.
    fn remaining(&self) -> &str {
        &self.input[self.matched..]
    }

    /// Increases and returns the counter of the latest symb of the [`Acceptor<R>`].
    ///
    /// # Safety
    ///
    /// The caller must garantee that there exists a value at the top of the
    /// symb stack and that it is an [`Element::NonTerminal`].
    ///
    /// This method is never intended to be used with a value [`Element::Terminal`]
    /// at the top of the symb stack
    unsafe fn increase_last_symb_counter(&mut self) -> usize {
        self.symb
            .last_mut()
            .map(|(_, n)| {
                *n += 1;
                *n
            })
            .unwrap_unchecked()
    }

    pub fn next(&mut self) -> State {
        match self.state {
            State::Q
                if self.matched == self.input.len() - 1
                    && self.sent == [Element::Terminal('#')] =>
            {
                self.caso = "3";
                self.state = State::T;
                self.sent.clear();
            }
            State::Q => match self.sent.last().copied().unwrap() {
                Element::NonTerminal(id) => {
                    self.caso = "1";
                    self.pop_with_elements(self.non_terminal[id]);
                    self.extend_with_elements(self.rhs[self.starting_ptr[id]]);
                    self.symb.push((Element::NonTerminal(id), 0));
                }
                Element::Terminal(next) if self.remaining().starts_with(next) => {
                    self.caso = "2";
                    self.symb.push((Element::Terminal(next), 0));
                    self.sent.pop();
                    self.matched += 1;
                }
                Element::Terminal(_) => {
                    self.caso = "4";
                    self.state = State::B;
                }
            },
            State::B
                if self.matched == 0
                    && self.sent == [Element::Terminal('#'), Element::NonTerminal(0)] =>
            {
                self.caso = "6b";
                self.state = State::T;
            }
            State::B => match self.symb.last().copied().unwrap() {
                (Element::Terminal(e), _) => {
                    self.caso = "5";
                    self.matched -= 1;
                    self.sent.push(Element::Terminal(e));
                    self.symb.pop();
                }
                (Element::NonTerminal(id), _) if self.remaining_for_id(id) > 0 => {
                    self.caso = "6a";
                    self.state = State::Q;

                    let n = unsafe { self.increase_last_symb_counter() };
                    let start = self.starting_ptr[id];

                    self.pop_with_elements(self.rhs[start + n - 1]);
                    self.extend_with_elements(self.rhs[start + n]);
                }
                (Element::NonTerminal(id), n) => {
                    self.caso = "6c";
                    self.pop_with_elements(self.rhs[self.starting_ptr[id] + n]);
                    self.extend_with_elements(self.non_terminal[id]);
                    self.symb.pop();
                }
            },
            State::T => {}
        }

        self.state
    }
}
