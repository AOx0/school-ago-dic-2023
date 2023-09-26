#![deny(clippy::all)]
#![warn(clippy::pedantic)]
#![deny(rust_2018_idioms)]

fn main() {
    let mut acceptor: Acceptor<'_, 5> = AcceptorBuilder::new()
        .with_rule("E", &["TE'"])
        .with_rule("E'", &["+TE'", ""])
        .with_rule("T", &["FT'"])
        .with_rule("T'", &["*FT'", ""])
        .with_rule("F", &["b", "(E)"])
        .matching("b");

    println!("{acceptor} |-");
    while acceptor.next() != State::T {
        println!("              |- {acceptor}");
    }
    println!("              |- {acceptor}");
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
    sent: String,
    state: State,
    input: String,
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
            write!(f, ", {})", self.sent)
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
            rhs: Vec::new(),
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
            sent: String::default(),
            input: String::default(),
            matched: 0,
            symb: Vec::with_capacity(self.pushed * 2),
            state: State::Q,
        }
    }

    pub fn matching(self, inp: &str) -> Acceptor<'inp, R> {
        let mut res = self.build();
        res.set_match(inp);
        res.symb.reserve(inp.len());
        res
    }
}

#[derive(Debug, Clone, Copy)]
enum Element {
    NonTerminal(NonTerminalID),
    Terminal(char),
}

impl<'inp, const R: usize> Acceptor<'inp, R> {
    fn set_match(&mut self, t: &str) {
        use std::fmt::Write;
        self.input.clear();
        write!(self.input, "{t}#").unwrap();

        self.matched = 0;
        self.state = State::Q;
        self.symb.clear();
        self.sent.clear();
        write!(
            &mut self.sent,
            "{}#",
            self.non_terminal
                .first()
                .expect("There are no production rules")
        )
        .unwrap();
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

        self.number_rules[for_id] - current
    }

    fn get_elem<'a>(&self, from: &'a str) -> Option<(Element, &'a str)> {
        if from.is_empty() {
            return None;
        }

        for (id, nt) in self
            .nt_sorted
            .iter()
            .copied()
            .map(|id| (id, self.non_terminal[id]))
        {
            if let Some(s) = from.strip_prefix(nt) {
                return Some((Element::NonTerminal(id), s));
            }
        }

        Some((Element::Terminal(from.chars().nth(0).unwrap()), &from[1..]))
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
            State::Q if self.matched == self.input.len() - 1 && self.sent == "#" => {
                /* Caso 3 */
                self.state = State::T;
                self.sent.clear();
            }
            State::Q => {
                match self.get_elem(&self.sent).unwrap() {
                    (Element::NonTerminal(id), rem) => {
                        /* Caso 1 */
                        self.sent = format!("{}{rem}", self.rhs[self.starting_ptr[id]]);
                        self.symb.push((Element::NonTerminal(id), 0));
                    }
                    (Element::Terminal(next), _)
                        if self.remaining().chars().nth(0).unwrap() == next =>
                    {
                        /* Caso 2 */
                        self.symb.push((Element::Terminal(next), 0));
                        self.sent = self.sent.strip_prefix(next).unwrap().to_string();
                        self.matched += 1;
                    }
                    (Element::Terminal(_), _) => {
                        /* Caso 4 */
                        self.state = State::B;
                    }
                }
            }
            State::B
                if self.matched == 0
                    && self
                        .sent
                        .strip_prefix(self.non_terminal[0])
                        .is_some_and(|a| a == "#") =>
            {
                /* Caso 6b */
                self.state = State::T;
            }
            State::B => {
                match self.symb.last().copied().unwrap() {
                    (Element::Terminal(e), _) => {
                        /* Caso 5 */
                        self.matched -= 1;
                        self.sent = format!("{e}{}", self.sent);
                        self.symb.pop();
                    }
                    (Element::NonTerminal(id), _) if self.remaining_for_id(id) > 0 => {
                        /* Caso 6a */
                        self.state = State::Q;

                        let n = unsafe { self.increase_last_symb_counter() };
                        let start = self.starting_ptr[id];

                        self.sent = format!(
                            "{}{}",
                            self.rhs[start + n],
                            self.sent.strip_prefix(self.rhs[start + n - 1]).unwrap()
                        );
                    }
                    (Element::NonTerminal(id), n) => {
                        /* Caso 6c (7) */
                        self.sent = format!(
                            "{}{}",
                            self.non_terminal[id],
                            self.sent
                                .strip_prefix(self.rhs[self.starting_ptr[id] + n])
                                .unwrap()
                        );
                        self.symb.pop();
                    }
                }
            }
            State::T => {}
        }

        self.state
    }
}
