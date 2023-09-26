#![deny(clippy::all)]
#![warn(clippy::pedantic)]
#![deny(rust_2018_idioms, unsafe_code)]

fn main() {
    let mut acceptor: Acceptor<4> = AcceptorBuilder::new()
        .with_rule("E", ["let VAREQVAL;"])
        .with_rule("EQ", ["=", " =", " =", " = "])
        .with_rule("VAR", ["foo", "bar"])
        .with_rule("VAL", ["0", "1", "2", "3", "4"])
        .matching("let foo = 0;");

    while acceptor.next() != State::T {
        println!("{acceptor:?}");
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
struct Acceptor<const R: usize> {
    nt_sorted: [NonTerminalID; R],
    non_terminal: [String; R],
    number_rules: [usize; R],
    starting_ptr: [usize; R],
    rhs: Vec<String>,
    symb: Vec<(Element, usize)>,
    matching: String,
    matched: usize,
    sent: String,
    state: State,
}

#[derive(Debug)]
struct AcceptorBuilder<const R: usize> {
    nt_sorted: [NonTerminalID; R],
    non_terminal: [String; R],
    number_rules: [usize; R],
    starting_ptr: [usize; R],
    rhs: Vec<String>,
    pushed: usize,
}

impl<const R: usize> AcceptorBuilder<R> {
    pub fn new() -> Self {
        const VAL: String = String::new();
        Self {
            number_rules: [0; R],
            starting_ptr: [0; R],
            rhs: Vec::new(),
            non_terminal: [VAL; R],
            nt_sorted: [0; R],
            pushed: 0,
        }
    }

    fn add_rule<T: AsRef<str>>(&mut self, name: &str, produces: impl AsRef<[T]>) {
        fn add_rule<const R: usize>(
            s: &mut AcceptorBuilder<R>,
            name: &str,
            produces: &[impl AsRef<str>],
        ) {
            let existing = s.non_terminal.iter().position(|a| a == name);

            if let Some(existing_position) = existing {
                panic!("Productions rules for the non-terminal {name} already exist (at idx {existing_position})");
            } else if s.pushed >= R {
                panic!("Can't push production {:?} to Accpetor, there are more productions than spaces in the stack (expected productions: {}). \
                    Try and bump up the number of productions: Accpetor<{}>", name, R, R + 1);
            } else {
                s.number_rules[s.pushed] = produces.len();
                s.starting_ptr[s.pushed] = s.rhs.len();
                s.rhs
                    .extend(produces.iter().map(|a| a.as_ref().to_string()));
                s.non_terminal[s.pushed] = name.to_string();

                s.nt_sorted[s.pushed] = s.non_terminal.len() - 1;
                s.nt_sorted.sort_unstable_by(|&a, &b| {
                    s.non_terminal[b].len().cmp(&s.non_terminal[a].len())
                });

                s.pushed += 1;
            }
        }

        add_rule(self, name, produces.as_ref());
    }

    pub fn with_rule<T: AsRef<str>>(mut self, name: &str, produces: impl AsRef<[T]>) -> Self {
        self.add_rule(name, produces);
        self
    }

    pub fn build(self) -> Acceptor<R> {
        if self.pushed < R {
            panic!("Missing productions. Expected production number is {R} but only {} productions were provided", {self.pushed})
        }
        Acceptor {
            number_rules: self.number_rules,
            starting_ptr: self.starting_ptr,
            rhs: self.rhs,
            non_terminal: self.non_terminal,
            nt_sorted: self.nt_sorted,
            sent: Default::default(),
            matching: Default::default(),
            matched: Default::default(),
            symb: Default::default(),
            state: Default::default(),
        }
    }

    pub fn matching(self, inp: &str) -> Acceptor<R> {
        let mut res = self.build();
        res.set_match(inp);
        res.symb = Vec::with_capacity(inp.len() * 2);
        res
    }
}

#[derive(Debug, Clone, Copy)]
enum Element {
    NonTerminal(NonTerminalID),
    Terminal(char),
}

impl<const R: usize> Acceptor<R> {
    fn set_match(&mut self, t: &str) {
        use std::fmt::Write;
        self.matching.clear();
        write!(self.matching, "{t}#").unwrap();

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
            .map(|id| (id, self.non_terminal[id].as_str()))
        {
            if let Some(s) = from.strip_prefix(nt) {
                return Some((Element::NonTerminal(id), s));
            }
        }

        Some((Element::Terminal(from.chars().nth(0).unwrap()), &from[1..]))
    }

    fn remaining(&self) -> &str {
        &self.matching[self.matched..]
    }

    fn increase_counter(&mut self) -> Option<usize> {
        self.symb.last_mut().map(|(_, n)| {
            *n += 1;
            *n
        })
    }

    pub fn next(&mut self) -> State {
        if matches!(self.state, State::Q)
            && self.matched == self.matching.len() - 1
            && self.sent.chars().nth(0).is_some_and(|a| a == '#')
        {
            /* Caso 3 */
            println!("INFO:: Caso 3 porque solo queda '#' en sent");
            self.state = State::T;
            self.sent.clear();
        } else if matches!(self.state, State::Q) {
            let (next, rem) = self.get_elem(&self.sent).unwrap();

            match next {
                Element::NonTerminal(id) => {
                    println!(
                        "INFO:: Caso 1 porque a {id} ({}) le quedan reglas por expandir ({})",
                        self.non_terminal[id],
                        self.remaining_for_id(id)
                    );
                    self.sent = format!("{}{rem}", self.rhs[self.starting_ptr[id]]);
                    self.symb.push((Element::NonTerminal(id), 1));
                }
                Element::Terminal(next) => {
                    let matches = if let Element::Terminal(lit) =
                        self.get_elem(self.remaining()).unwrap().0
                    {
                        lit == next
                    } else {
                        unreachable!("Por definición, no debería existir no terminales en el texto de entrada")
                    };

                    if matches {
                        println!(
                            "INFO:: Caso 2 porque {next} está presente en {}",
                            self.remaining()
                        );
                        /* Caso 2 */
                        self.symb.push((Element::Terminal(next), 0));
                        self.sent = self.sent.strip_prefix(next).unwrap().to_string();
                        self.matched += 1;
                    } else {
                        println!(
                            "INFO:: Caso 4 porque {next} no está presente en {}",
                            self.remaining()
                        );
                        /* Caso 4 */
                        self.state = State::B;
                    }
                }
            }
        } else if self.matched == 0 && self.sent.starts_with(&self.non_terminal[0]) {
            println!(
                "INFO:: Caso 6b porque sent está en el símbolo inicial ({})",
                &self.non_terminal[0],
            );
            /* Caso 6b */
            self.state = State::T;
        } else {
            match self.symb.last().copied().unwrap() {
                (Element::Terminal(e), _) => {
                    /* Caso 5 */
                    println!("INFO:: Caso 5 porque {:?} es un terminal", self.symb.last());
                    self.matched -= 1;
                    self.sent = format!("{e}{}", self.sent);
                    self.symb.pop().unwrap();
                }
                (Element::NonTerminal(id), _) if self.remaining_for_id(id) > 0 => {
                    /* Caso 6a */
                    println!(
                        "INFO:: Caso 6a porque {id} ({}) aún tiene más reglas de producción ({})",
                        self.non_terminal[id],
                        self.remaining_for_id(id)
                    );
                    self.state = State::Q;

                    let n = self.increase_counter().unwrap();
                    let start = self.starting_ptr[id];

                    self.sent = format!(
                        "{}{}",
                        self.rhs[start + n - 1],
                        self.sent.strip_prefix(&self.rhs[start + n - 2]).unwrap()
                    );
                }
                (Element::NonTerminal(id), n) if self.remaining_for_id(id) == 0 => {
                    /* Caso 7 */
                    println!(
                            "INFO:: Caso 7 (6c) porque {id} ({}) no tiene más reglas de producción ({})",
                            self.non_terminal[id],
                            self.remaining_for_id(id)
                        );
                    self.sent = format!(
                        "{}{}",
                        self.non_terminal[id],
                        self.sent
                            .strip_prefix(&self.rhs[self.starting_ptr[id] + n - 1])
                            .unwrap()
                    );
                    self.symb.pop();
                }
                _ => {
                    unreachable!()
                }
            }
        }

        self.state
    }
}
