pub type NonTerminalID = usize;

#[derive(Debug, Default)]
pub struct Grammar<'inp> {
    pub nt_sorted: Vec<NonTerminalID>,
    pub non_terminal: Vec<&'inp str>,
    pub number_rules: Vec<usize>,
    pub starting_ptr: Vec<usize>,
    pub rhs: Vec<&'inp str>,
}

impl<'inp> Grammar<'inp> {
    pub fn new() -> Self {
        Self::default()
    }

    pub fn from_str(contenido: &'inp str) -> Self {
        let mut grammar = Grammar::new();
        let mut buf = Vec::new();

        for line in contenido.lines() {
            if let Some((rule_name, rem)) = line.split_once([':', ' ']) {
                let rules = rem.split('|');
                for rule in rules {
                    buf.push(rule.trim());
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

impl<'a> std::fmt::Display for Grammar<'a> {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        let nt_len = self.nt_sorted[0];

        writeln!(f, "Grammar {{")?;
        for (id, nt) in self.non_terminal.iter().enumerate() {
            write!(f, "    {nt: >nt_len$} -> ")?;
            let starts_at = self.starting_ptr[id];
            let has = self.number_rules[id];

            for idx in starts_at..starts_at + has {
                if self.rhs[idx].is_empty() {
                    write!(f, "\u{03B5}")?;
                } else {
                    write!(f, "{}", self.rhs[idx])?;
                }
                if idx != starts_at + has - 1 {
                    write!(f, "|")?;
                }
            }
            writeln!(f)?;
        }

        writeln!(f, "}}")
    }
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
