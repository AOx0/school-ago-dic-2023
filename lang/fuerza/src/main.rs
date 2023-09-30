#![deny(clippy::all)]
#![warn(clippy::pedantic)]
#![deny(rust_2018_idioms)]

// #[global_allocator]
// static ALLOC: dhat::Alloc = dhat::Alloc;

use std::process::ExitCode;

fn main() -> ExitCode {
    // let _profile = dhat::Profiler::new_heap();

    let file = std::fs::read_to_string("gramatica.txt").unwrap();

    let g = Grammar::from_str(file.as_str());

    println!("{g:?}");

    let mut acceptor = Acceptor::new(&g, "b#");

    println!("{acceptor}");
    loop {
        let state = acceptor.next();
        println!("(Caso {: <2})  |- {acceptor}", acceptor.caso);
        if state == State::T {
            break;
        }
    }

    ExitCode::SUCCESS
}

type NonTerminalID = usize;

#[derive(Debug, Default)]
struct Grammar<'inp> {
    nt_sorted: Vec<NonTerminalID>,
    non_terminal: Vec<&'inp str>,
    number_rules: Vec<usize>,
    starting_ptr: Vec<usize>,
    rhs: Vec<&'inp str>,
}

static DEFAULT_GRAMMAR: Grammar<'static> = Grammar {
    nt_sorted: Vec::new(),
    non_terminal: Vec::new(),
    number_rules: Vec::new(),
    starting_ptr: Vec::new(),
    rhs: Vec::new(),
};

impl<'a> Default for &'a Grammar<'static> {
    fn default() -> Self {
        &DEFAULT_GRAMMAR
    }
}

impl<'inp> Grammar<'inp> {
    pub fn new() -> Self {
        Self::default()
    }

    pub fn from_str(contenido: &'inp str) -> Self {
        let mut grammar = Grammar::new();
        let mut buf = Vec::new();

        for line in contenido.lines() {
            let mut word_iter = line.split(' ');

            if let Some(rule_name) = word_iter.next() {
                for p in word_iter {
                    buf.push(p);
                }

                grammar.add_rule(rule_name, buf.as_ref());
                buf.clear();
            }
        }

        grammar
    }

    fn add_rule(&mut self, name: &'inp str, produces: &[&'inp str]) {
        let existing = self.non_terminal.iter().position(|&a| a == name);

        if let Some(existing_position) = existing {
            panic!("Productions rules for the non-terminal {name} already exist (at idx {existing_position})");
        } else {
            self.number_rules.push(produces.len());
            self.starting_ptr.push(self.rhs.len());
            self.rhs.extend(produces.iter());
            self.non_terminal.push(name);

            self.nt_sorted.push(self.non_terminal.len() - 1);
            self.nt_sorted.sort_unstable_by(|&a, &b| {
                self.non_terminal[b].len().cmp(&self.non_terminal[a].len())
            });
        }
    }

    #[allow(dead_code)]
    pub fn with_rule(mut self, name: &'inp str, produces: &[&'inp str]) -> Self {
        self.add_rule(name, produces);
        self
    }
}

#[derive(Debug, Default, Clone, Copy, PartialEq, Eq, PartialOrd, Ord)]
enum State {
    #[default]
    Q,
    B,
    T,
}

#[derive(Debug, Default)]
struct Acceptor<'inp> {
    grammar: &'inp Grammar<'inp>,
    symb: Vec<(Element, usize)>,
    sent: Vec<Element>,
    state: State,
    input: &'inp str,
    caso: &'static str,
    matched: usize,
}

impl<'inp> std::fmt::Display for Acceptor<'inp> {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "({:?}, {}, ", self.state, self.matched + 1)?;
        if self.symb.is_empty() {
            write!(f, "\u{03B5}")?;
        }
        for (ref symb, n) in &self.symb {
            let n = n + 1;
            match symb {
                Element::NonTerminal(id) => {
                    write!(f, "{{{}{n}}}", self.grammar.non_terminal[*id])?;
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
                        write!(f, "{}", self.grammar.non_terminal[*id])?;
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

#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord)]
enum Element {
    NonTerminal(NonTerminalID),
    Terminal(char),
}

impl<'inp> Acceptor<'inp> {
    /// Creates a new [`Acceptor`].
    #[must_use]
    fn new(g: &'inp Grammar<'inp>, t: &'inp str) -> Self {
        Acceptor {
            grammar: g,
            input: t,
            sent: vec![Element::Terminal('#'), Element::NonTerminal(0)],
            ..Default::default()
        }
    }

    fn remaining_for_id(&self, for_id: NonTerminalID) -> usize {
        assert!(for_id < self.grammar.non_terminal.len());

        let current = self
            .symb
            .iter()
            .rev()
            .find_map(|(id, rem)| {
                matches!(id, Element::NonTerminal(id) if *id == for_id).then(|| rem)
            })
            .unwrap_or(&0);

        self.grammar.number_rules[for_id] - current - 1
    }

    fn get_next_elem_rev<'a>(&self, from: &'a str) -> (Element, &'a str) {
        for (id, nt) in self
            .grammar
            .nt_sorted
            .iter()
            .copied()
            .map(|id| (id, self.grammar.non_terminal[id]))
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

    fn remaining(&self) -> &str {
        &self.input[self.matched..]
    }

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
        assert!(!self.input.is_empty());

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
                    self.pop_with_elements(self.grammar.non_terminal[id]);
                    self.extend_with_elements(self.grammar.rhs[self.grammar.starting_ptr[id]]);
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
                    let start = self.grammar.starting_ptr[id];

                    self.pop_with_elements(self.grammar.rhs[start + n - 1]);
                    self.extend_with_elements(self.grammar.rhs[start + n]);
                }
                (Element::NonTerminal(id), n) => {
                    self.caso = "6c";
                    self.pop_with_elements(self.grammar.rhs[self.grammar.starting_ptr[id] + n]);
                    self.extend_with_elements(self.grammar.non_terminal[id]);
                    self.symb.pop();
                }
            },
            State::T => {}
        }

        self.state
    }
}
