pub type NonTerminalID = usize;

/// Nota:
/// - La combinacion de `number_rules` y `starting_ptr` forman conceptualmente `LHS`
/// - `non_terminal` es `NT`
/// - `rhs` es `RHS`
#[derive(Debug, Default)]
pub struct Grammar<'inp> {
    /// Uso nt_sorted porque asi se cuales son los no terminales mas largos
    /// P. ej `E'''` es mas largo que `E'` y por lo tanto en la implemntacion
    /// final siempre tengo que buscar un match primero de `E'''` y si no se
    /// encuentra ninguno entonces buscare `E'`
    ///
    /// La lista contiene, ordenado de mayor a menor por tamño del string de
    /// el no terminal original, el indice de cada no terminal
    /// en el vector `non_tereminal`
    pub nt_sorted: Vec<NonTerminalID>,
    /// Vector con las cadenas de los no terminales
    pub non_terminal: Vec<&'inp str>,
    /// Vector donde la posicion es significativa, el elemento en la posicion 0
    /// corresponde al no terminal en el vector `non_terminal` en la posicion 0
    ///
    /// Indica el número de variantes que tiene el no terminal
    pub number_rules: Vec<usize>,
    /// Vector donde la posicion es significativa, el elemento en la posicion 0
    /// corresponde al no terminal en el vector `non_terminal` en la posicion 0
    ///
    /// Contiene el indice donde comienzan las variantes para el no terminal
    /// correspondiente de acuerdo a la posicion en el vector.
    pub starting_ptr: Vec<usize>,
    /// Contiene las variantes de los no terminales, es decir las producciones
    /// en las que deriva.
    ///
    /// Podemos saber que variantes son de que terminales ya que sabemos en que
    /// punto comienzan las variaciones de cada no terminal y cuantas variaciones
    /// tiene.
    pub rhs: Vec<&'inp str>,
}

impl<'inp> Grammar<'inp> {
    pub fn new() -> Self {
        Self::default()
    }

    /// Contruye una gramática a partir de la cadena de entrada dada, que debe tener el
    /// formato correcto para poder ser parseada.
    pub fn from_str(contenido: &'inp str) -> Self {
        let mut grammar = Grammar::new();
        let mut buf = Vec::new();

        // Para cada linea
        for line in contenido.lines() {
            // Obtenemos primero el nombre
            if let Some((rule_name, rem)) = line.split_once([':', ' ']) {
                // Despues las reglas
                let rules = rem.split('|');
                for rule in rules {
                    buf.push(rule.trim());
                }

                // Y lo agregamos a la gramatica
                grammar.add_rule(rule_name, buf.as_ref());
                buf.clear();
            }
        }

        grammar
    }

    /// Agrega una regla a la gramatica
    ///
    /// # Panics
    ///
    /// El programa para la ejecucion si se ingresa un no terminal dos veces,
    /// cada no terminal debe aparecer 1 vez, como si de una llave se tratara.
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

/// Implementacion de la caacteristica Display para la gramtica, para poder
/// imprimirla
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

/// Truco para tener un valor por defecto estatico, asi podemos
/// derivar Default en otros contextos
///
/// En Rust los vectores no reservan memoria hasta que se haga un push,
/// por lo que es una operacion gratis
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
