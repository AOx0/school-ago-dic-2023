#![feature(let_chains)]

use std::borrow::Cow;

fn main() {
    // let t = "T+T";
    // let NT = ["E", "E'", "T", "T'", "F"];

    // let LHS: [(usize, usize); 5] = [(2, 1), (2, 3), (2, 5), (2, 7), (2, 9)];
    // let RHS = ["TE'", "+T", "+TE'", "F", "FT'", "*F", "*ET'", "(E)", "a"];

    let mut acceptor = Acceptor::new()
        .with_rule("E", ["TE'"])
        .with_rule("E'", ["+TE'", ""])
        .with_rule("T", ["FT'"])
        .with_rule("T'", ["*FT'", ""])
        .with_rule("F", ["b", "(E)"])
        .matching("b");

    while acceptor.next() != State::T {
        println!("{:?}", acceptor);
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
struct Acceptor<'a> {
    lhs: Vec<(NumberOfRules, StartingPtr)>,
    rhs: Vec<String>,
    nt: Vec<String>,
    nt_sorted: Vec<NonTerminalID>,
    sent: String,
    matching: String,
    matched: usize,
    symb: Vec<(Element<'a>, NonTerminalVariant)>,
    state: State,
}

#[derive(Debug, Clone)]
enum Element<'a> {
    NonTerminal(NonTerminalID),
    Terminal(Cow<'a, str>),
}

impl Acceptor<'_> {
    pub fn new() -> Self {
        Self::default()
    }

    pub fn with_rule<T: AsRef<str>>(mut self, name: &str, produces: impl AsRef<[T]>) -> Self {
        self.add_rule(name, produces);
        self
    }

    pub fn matching(mut self, t: &str) -> Self {
        self.set_match(t);
        self.sent = format!(
            "{}#",
            self.nt.first().expect("There are no production rules")
        );
        self
    }

    fn set_match(&mut self, t: &str) {
        self.matching = format!("{t}#");
        self.matched = 0;
        self.state = State::Q;
        self.symb.clear();
        self.sent = String::new();
    }

    fn add_rule<'a, T: AsRef<str>>(&mut self, name: &str, produces: impl AsRef<[T]>) {
        fn add_rule(s: &mut Acceptor, name: &str, produces: &[impl AsRef<str>]) {
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

    fn get_elem<'a>(&'a self, from: &'a str) -> Option<(Element, &'a str)> {
        if from.is_empty() {
            return None;
        }

        for (id, nt) in self
            .nt_sorted
            .iter()
            .copied()
            .map(|id| (id, self.nt[id].as_str()))
        {
            if from.starts_with(nt) {
                return Some((Element::NonTerminal(id), &from[nt.len()..]));
            }
        }

        Some((Element::Terminal(Cow::Borrowed(&from[0..1])), &from[1..]))
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
            && dbg!(self.matched == self.matching.len())
            && matches!(self.symb.last().unwrap().0, Element::Terminal(ref lit) if lit == "#")
        {
            /* Caso 3 */
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
                    if let Element::Terminal(lit) = self.get_elem(self.remaining()).unwrap().0 {
                        if lit.as_ref() == next.as_ref() {
                            println!(
                                "INFO:: Caso 2 porque {lit} está presente en {}",
                                self.remaining()
                            );
                            /* Caso 2 */
                            let lit = lit.into_owned();
                            self.sent = self.sent.trim_start_matches(lit.as_str()).to_string();
                            self.symb.push((Element::Terminal(lit.into()), 1));
                            self.matched += 1;
                        } else {
                            println!(
                                "INFO:: Caso 3 porque {next} no está presente en {}",
                                self.remaining()
                            );
                            /* Caso 4 */
                            self.state = State::B;
                        }
                    } else {
                        unreachable!()
                    }
                }
            }
        } else {
            if let Element::Terminal(_) = &self.symb.last().unwrap().0 {
                /* Caso 5 */
                println!(
                    "INFO:: Caso 5 porque {:?} es un literal",
                    self.symb.last()
                );
                self.matched -= 1;
                let (e, _) = self.symb.pop().unwrap();

                let e = match e {
                    Element::Terminal(ref c) => c,
                    Element::NonTerminal(id) => self.nt[id].as_str(),
                };

                self.sent = format!("{e}{}", self.sent);
            } else if let Element::NonTerminal(id) = self.symb.last().unwrap().0 && self.remaining_for_id(id) > 0 {
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
                    self.sent.trim_start_matches(&self.rhs[start + n - 2])
                );
                println!("Removing {} resulted in {}", &self.rhs[start + n - 2], self.sent);
            } else if self.matched == 0 && self.matching.starts_with(&self.nt[0]) {
                /* Caso 6b */
                self.state = State::T;
            } else if let (Element::NonTerminal(id), n) = self.symb.pop().unwrap() && self.get_info(id).unwrap().0 - n == 0 {
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
                    self.sent.trim_start_matches(&self.rhs[start + max - 1])
                );
            } else {
                unreachable!()
            }
        }

        self.state
    }
}
