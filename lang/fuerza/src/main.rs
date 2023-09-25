#![feature(let_chains)]
#![deny(clippy::all)]
#![warn(clippy::pedantic)]
#![deny(rust_2018_idioms, unsafe_code)]

fn main() {
    // let t = "T+T";
    // let NT = ["E", "E'", "T", "T'", "F"];

    // let LHS: [(usize, usize); 5] = [(2, 1), (2, 3), (2, 5), (2, 7), (2, 9)];
    // let RHS = ["TE'", "+T", "+TE'", "F", "FT'", "*F", "*ET'", "(E)", "a"];

    let mut acceptor = AcceptorBuilder::new()
        .with_rule("E", ["foo", "bar"])
        .matching("foo");

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

#[derive(Debug, Default)]
struct Acceptor {
    lhs: Vec<(NumberOfRules, StartingPtr)>,
    rhs: Vec<String>,
    nt: Vec<String>,
    nt_sorted: Vec<NonTerminalID>,
    sent: String,
    matching: String,
    matched: usize,
    symb: Vec<(Element, NonTerminalVariant)>,
    state: State,
}

#[derive(Debug, Default)]
struct AcceptorBuilder {
    lhs: Vec<(NumberOfRules, StartingPtr)>,
    rhs: Vec<String>,
    nt: Vec<String>,
    nt_sorted: Vec<NonTerminalID>,
}

impl AcceptorBuilder {
    pub fn new() -> AcceptorBuilder {
        Self::default()
    }

    fn add_rule<T: AsRef<str>>(&mut self, name: &str, produces: impl AsRef<[T]>) {
        fn add_rule(s: &mut AcceptorBuilder, name: &str, produces: &[impl AsRef<str>]) {
            let existing = s.nt.iter().position(|a| a == name);

            if let Some(existing_position) = existing {
                panic!("Productions rules for the non-terminal {name} already exist (at idx {existing_position})");
            } else {
                s.lhs.push((produces.len(), s.rhs.len()));
                s.rhs
                    .extend(produces.iter().map(|a| a.as_ref().to_string()));
                s.nt.push(name.to_string());

                s.nt_sorted.push(s.nt.len() - 1);
                s.nt_sorted
                    .sort_unstable_by(|&a, &b| s.nt[b].len().cmp(&s.nt[a].len()));
            }
        }

        add_rule(self, name, produces.as_ref());
    }

    pub fn with_rule<T: AsRef<str>>(mut self, name: &str, produces: impl AsRef<[T]>) -> Self {
        self.add_rule(name, produces);
        self
    }

    pub fn build(mut self) -> Acceptor {
        let mut result = Acceptor::default();
        std::mem::swap(&mut result.lhs, &mut self.lhs);
        std::mem::swap(&mut result.rhs, &mut self.rhs);
        std::mem::swap(&mut result.nt, &mut self.nt);
        std::mem::swap(&mut result.nt_sorted, &mut self.nt_sorted);

        result
    }

    pub fn matching(self, inp: &str) -> Acceptor {
        let mut res = self.build();
        res.set_match(inp);
        res
    }
}

#[derive(Debug, Clone, Copy)]
enum Element {
    NonTerminal(NonTerminalID),
    Terminal(char),
}

impl Acceptor {
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

            match dbg!(next) {
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
                        dbg!(lit) == next
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
                (Element::NonTerminal(id), _) if self.remaining_for_id(id) == 0 => {
                    /* Caso 7 */
                    println!(
                            "INFO:: Caso 7 (6c) porque {id} ({}) no tiene más reglas de producción ({})",
                            self.nt[id],
                            self.remaining_for_id(id)
                        );
                    let (max, start) = self.get_info(id).unwrap();
                    self.sent = format!(
                        "{}{}",
                        self.nt[id],
                        self.sent.strip_prefix(&self.rhs[start + max - 1]).unwrap()
                    );
                }
                _ => {
                    unreachable!()
                }
            }
        }

        self.state
    }
}
