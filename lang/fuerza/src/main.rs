#![feature(let_chains)]

use std::borrow::Cow;

fn main() {
    // let t = "T+T";
    // let NT = ["E", "E'", "T", "T'", "F"];

    // let LHS: [(usize, usize); 5] = [(2, 1), (2, 3), (2, 5), (2, 7), (2, 9)];
    // let RHS = ["TE'", "+T", "+TE'", "F", "FT'", "*F", "*ET'", "(E)", "a"];

    let mut acceptor = Acceptor::new()
        .with_rule("E", ["TE'", "T"])
        .with_rule("E'", ["+TE'", "+T"])
        .with_rule("T", ["FT'", "F"])
        .with_rule("T'", ["*F'", "FT'"])
        .with_rule("F", ["(E)", "a"])
        .matching("a");

    println!("{:?}", acceptor);

    for i in 0..50 {
        acceptor.next();
        println!("{:?}", acceptor);
    }
}

#[derive(Debug, Default, Clone, Copy)]
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

#[derive(Debug)]
enum Element<'a> {
    NTID(NonTerminalID),
    Literal(Cow<'a, str>),
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

    /// Returns the number of productions rules that have not been tested
    ///
    /// Returns `None` if the input is not a non-terminal
    ///
    /// # Panics
    ///
    /// Panics if the non-terminal is not present in the history stack
    fn remaining_for(&self, rule: &str) -> Option<usize> {
        Some(self.remaining_for_id(self.get_id(rule)?))
    }

    fn get_id(&self, rule: &str) -> Option<NonTerminalID> {
        self.nt.iter().position(|a| a == rule)
    }

    fn get_info(&self, for_id: NonTerminalID) -> Option<(usize, usize)> {
        self.lhs.get(for_id).copied()
    }

    fn remaining_for_element(&self, elem: &Element) -> Option<usize> {
        match elem {
            Element::NTID(id) => Some(self.remaining_for_id(*id)),
            Element::Literal(_) => None,
        }
    }

    fn available_for_element(&self, elem: &Element) -> usize {
        match elem {
            Element::NTID(id) => self.lhs[*id].0,
            Element::Literal(_) => 0,
        }
    }

    fn remaining_for_id(&self, for_id: NonTerminalID) -> usize {
        let current = self
            .symb
            .iter()
            .rev()
            .find_map(|(id, rem)| matches!(id, Element::NTID(id) if id == &for_id).then(|| rem))
            .unwrap_or(&0);

        self.lhs[for_id].0 - current
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
                return Some((Element::NTID(id), &from[nt.len()..]));
            }
        }

        Some((Element::Literal(Cow::Borrowed(&from[0..1])), &from[1..]))
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

    pub fn next(&mut self) -> Option<State> {
        if matches!(self.state, State::Q)
            && self.matched == self.matching.len()
            && self.sent.chars().nth(0).is_some_and(|a| a == '#')
        {
            /* Caso 3 */
            self.state = State::T;
            self.sent.clear();
        } else if matches!(self.state, State::Q) {
            let (next, rem) = self.get_elem(&self.sent)?;

            match next {
                Element::NTID(id) => {
                    if self.remaining_for_id(id) > 0 {
                        /* Caso 1 */
                        self.sent = format!("{}{rem}", self.rhs[self.lhs[id].1]);
                        self.symb.push((Element::NTID(id), 1));
                    }
                }
                Element::Literal(next) => {
                    if let Element::Literal(lit) = self.get_elem(self.remaining())?.0 {
                        if lit == next {
                            /* Caso 2 */
                            self.symb
                                .push((Element::Literal(lit.to_string().into()), 1));
                            self.matched += 1;
                        } else {
                            /* Caso 3 */
                            self.state = State::B;
                        }
                    } else {
                        unreachable!()
                    }
                }
            }
        } else {
            if self.available_for_element(&self.symb.last().unwrap().0) == 0 {
                /* Caso 5 */
                self.matched -= 1;
                let (e, _) = self.symb.pop().unwrap();

                let e = match e {
                    Element::Literal(ref c) => c,
                    Element::NTID(id) => self.nt[id].as_str(),
                };

                self.sent = format!("{e}{}", self.sent);
            } else if let Element::NTID(id) = self.symb.last()?.0 && self.remaining_for_id(id) > 0 {
                /* Caso 6a */
                self.state = State::Q;

                // Incrementar el contador
                let n = self.increase_counter().unwrap();

                let (_, start) = self.get_info(id).unwrap();

                self.sent = format!(
                    "{}{}",
                    self.rhs[start + n - 1],
                    self.sent.trim_start_matches(&self.rhs[start + n - 2])
                );
                println!("Removing {} resulted in {}", &self.rhs[start + n - 2], self.sent);
            } else if self.matched == 1 && self.matching.starts_with(&self.nt[0]) {
                /* Caso 6b */
                self.state = State::T;
            } else if let Element::NTID(id) = self.symb.pop().unwrap().0 {
                /* Caso 7 */
                let (max, start) = self.get_info(id).unwrap();
                self.sent = format!(
                    "{}{}",
                    self.nt[id],
                    self.sent.trim_start_matches(&self.rhs[start + max - 1])
                );
            }
        }

        Some(self.state)
    }
}
