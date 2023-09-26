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

type NumberOfRules = usize;
type StartingPtr = usize;
type NonTerminalID = usize;
type NonTerminalVariant = usize;

#[derive(Debug)]
struct Acceptor<const R: usize> {
    lhs: [(NumberOfRules, StartingPtr); R],
    rhs: Vec<String>,
    nt: [String; R],
    nt_sorted: [NonTerminalID; R],
    sent: String,
    matching: String,
    matched: usize,
    symb: Vec<(Element, NonTerminalVariant)>,
    state: State,
}

#[derive(Debug)]
struct AcceptorBuilder<const R: usize> {
    lhs: [(NumberOfRules, StartingPtr); R],
    rhs: Vec<String>,
    nt: [String; R],
    nt_sorted: [NonTerminalID; R],
    pushed: usize,
}

impl<const R: usize> AcceptorBuilder<R> {
    pub fn new() -> Self {
        const VAL: String = String::new();
        Self {
            lhs: [(0, 0); R],
            rhs: Vec::new(),
            nt: [VAL; R],
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
            let existing = s.nt.iter().position(|a| a == name);

            if let Some(existing_position) = existing {
                panic!("Productions rules for the non-terminal {name} already exist (at idx {existing_position})");
            } else if s.pushed >= R {
                panic!("Can't push production {:?} to Accpetor, there are more productions than spaces in the stack (expected productions: {}). \
                    Try and bump up the number of productions: Accpetor<{}>", name, R, R + 1);
            } else {
                s.lhs[s.pushed] = (produces.len(), s.rhs.len());
                s.rhs
                    .extend(produces.iter().map(|a| a.as_ref().to_string()));
                s.nt[s.pushed] = name.to_string();

                s.nt_sorted[s.pushed] = s.nt.len() - 1;
                s.nt_sorted
                    .sort_unstable_by(|&a, &b| s.nt[b].len().cmp(&s.nt[a].len()));

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
            lhs: self.lhs,
            rhs: self.rhs,
            nt: self.nt,
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
            self.nt.first().expect("There are no production rules")
        )
        .unwrap();
    }

    fn get_info(&self, for_id: NonTerminalID) -> Option<(usize, usize)> {
        self.lhs.get(for_id).copied()
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

        self.get_info(for_id).unwrap().0 - current
    }

    fn get_elem<'a>(&self, from: &'a str) -> Option<(Element, &'a str)> {
        if from.is_empty() {
            return None;
        }

        for (id, nt) in self
            .nt_sorted
            .iter()
            .copied()
            .map(|id| (id, self.nt[id].as_str()))
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
                        self.nt[id],
                        self.remaining_for_id(id)
                    );
                    self.sent = format!("{}{rem}", self.rhs[self.lhs[id].1]);
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
        } else if self.matched == 0 && self.sent.starts_with(&self.nt[0]) {
            println!(
                "INFO:: Caso 6b porque sent está en el símbolo inicial ({})",
                &self.nt[0],
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
                        self.nt[id],
                        self.remaining_for_id(id)
                    );
                    self.state = State::Q;

                    let n = self.increase_counter().unwrap();
                    let (_, start) = self.get_info(id).unwrap();

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
                            self.nt[id],
                            self.remaining_for_id(id)
                        );
                    let (_, start) = self.get_info(id).unwrap();
                    self.sent = format!(
                        "{}{}",
                        self.nt[id],
                        self.sent.strip_prefix(&self.rhs[start + n - 1]).unwrap()
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
