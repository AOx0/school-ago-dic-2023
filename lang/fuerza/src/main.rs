//! Equipo_8:
//! - 0237328@up.edu.mx Jorge Barba Pérez
//! - 0244685@up.edu.mx Daniel Alejandro Osornio López
//!
//! Archivos:
//! - En src/grammar.rs tiene la definicion de Grammar
//! - En este archivo tiene la definicion de Acceptor, primero ponemos lo que
//! mas nos interesa que revise porque es lo que se toca en el libro
//! (p. ej. el algoritmo en si).
//!
//! Para las partes mas bajas del archivo estan las funciones que son mas de _papeleo_,
//! detalles muy especificos que no son vitales para entender el funcionamiento
//! general del programa (p. ej. solicitud de valores al usuario, lectura de archivos).
//!
//! No se incluye ningun caracter especial (p. ej. acentos)
//!
//! Ejecuciones sugeridas:
//! ```
//! cargo run --release -- gramatica.txt (b+b)+(b+b)
//! ```
//!
//! ```
//! cargo run --release -- gramatica2.txt ccc
//! ```

#![deny(clippy::all)]
#![deny(clippy::pedantic)]
#![deny(rust_2018_idioms)]

/// La definicion de gramatica esta en grammar.rs
mod grammar;
use grammar::{Grammar, NonTerminalID};

use std::process::ExitCode;

/// La funcion main simplemente ejecuta la aplicacion de la linea de comandos.
///
/// Se puede invocar el programa de las formas:
/// - Sin argumentos:
///   ```
///   cargo run --release
///   ```
/// - Pasando el archivo con la definicion de la gramatica:
///   ```
///   cargo run --release -- gramatica.txt
///   ```
/// - Directamente pasando tanto el archivo de la gramatica y la entrada a verificar:
///   ```
///   cargo run --release -- gramatica.txt b+b
///   ```
fn main() -> ExitCode {
    // La funcion app contiene los detalles de la logica de la aplicacion
    if let Err(err) = app() {
        eprintln!("ERROR:: {err}");
        ExitCode::FAILURE
    } else {
        ExitCode::SUCCESS
    }
}

/// Para representar las producciones y facilitar su parseo se usa este
/// enumerador.
///
/// - Terminales: En caso de ser un terminal se trata, por definicion, de un caracter.
///   Para arreglos de terminales se obtiene el mismo resultado porque se parsearan
///   uno por uno como caracteres individuales.
/// - No termianales: No es necesario almacenar toda la cadena, con un apuntador
///   al string original basta, por eso `NonTermianal` incluye un ID (es un indice).
#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord)]
enum Element {
    NonTerminal(NonTerminalID),
    Terminal(char),
}

/// Como se menciona en el libro, el algoritmo tiene tres estados posibles,
/// este enumerador se encarga de nombrar cada uno de ellos
#[derive(Debug, Default, Clone, Copy, PartialEq, Eq, PartialOrd, Ord)]
enum State {
    /// Continua, es el estado inicial por defecto
    #[default]
    Q,
    /// Backtracking
    B,
    /// Terminado
    T,
}

/// La estructura encargada de aceptar o rechazar un valor de entrada, dada
/// una gramatica [`Grammar`].
#[derive(Debug, Default)]
struct Acceptor<'inp> {
    /// La estructura tiene acceso a una referencia a la gramatica que usara para
    /// evaluar la cadena de entrada.
    grammar: &'inp Grammar<'inp>,
    /// Pila que contiene la relacion (Elemento, numero de variante actual)
    /// Con `hist` sabemos que producciones se han aplicado.
    hist: Vec<(Element, usize)>,
    sent: Vec<Element>,
    /// El estado actual del aceptor
    state: State,
    /// Referencia a la cadena de entrada que se esta verificando
    input: &'inp str,
    /// String que contiene el ultimo tipo de caso, asi puedo imprimir mensajes
    /// que indiquen exactamente el caso que resulto
    caso: &'static str,
    /// El numero de caracteres que se han reconocido de la cadena de entrada
    matched: usize,
}

impl<'inp> Acceptor<'inp> {
    /// Realiza una iteracion y devuelve el estado resultante de la misma.
    ///
    /// Usamos el _pattern matching_ de Rust para describir de forma clara las
    /// ramas en las que podemod terminar en base al estado actual,
    /// variantes restantes, etc.
    pub fn next(&mut self) -> State {
        assert!(!self.input.is_empty());

        // Analizamos el estado actual
        match self.state {
            // Si estamos en Q, hicimos match de todos los caracteres,
            // y solo queda el caracter de terminacion en `sent`...
            State::Q
                if self.matched == self.input.len() - 1
                    && self.sent == [Element::Terminal('#')] =>
            {
                // ...entonces terminamos de parsear exitosamente
                self.caso = "3";
                self.state = State::T;
                self.sent.clear();
            }
            // En cualquier otro caso de Q, dependiendo de lo que sea el siguiente
            // caracter(s) de `sent`
            State::Q => match self.sent.last().copied().unwrap() {
                // Si es un no terminal entonces lo expandimos por su primera
                // produccion
                Element::NonTerminal(id) if self.grammar.number_rules[id] > 1 => {
                    self.caso = "1";
                    self.pop_with(self.grammar.non_terminal[id]);
                    self.extend_with(self.grammar.rhs[self.grammar.starting_ptr[id] + 1]);
                    self.hist.push((Element::NonTerminal(id), 1));
                }
                Element::NonTerminal(_) => {}
                // Si es un terminal y esta presente en la entrada entonces lo
                // contamos como _match_
                Element::Terminal(next) if self.rem_str().starts_with(next) => {
                    self.caso = "2";
                    self.hist.push((Element::Terminal(next), 0));
                    self.sent.pop();
                    self.matched += 1;
                }
                // Para un terminal en cualquier otro caso (que no hizo _match_
                // con la cadena de entrada), comenzamos el backtracking
                Element::Terminal(_) => {
                    self.caso = "4";
                    self.state = State::B;
                }
            },
            // Si estamos en backtracking y lo unico que queda en `sent` es el
            // no terminal inicial y el caracter de terminacion...
            State::B
                if self.matched == 0
                    && self.sent == [Element::Terminal('#'), Element::NonTerminal(0)] =>
            {
                // ...entonces podemos decir que terminamos el parseo, la entrada no
                // fue aceptada
                self.caso = "6b";
                self.state = State::T;
            }
            // Para cualquier otro caso de backtraking, dependiendo del elemento en
            // la cima de la pila hist
            State::B => match self.hist.last().copied().unwrap() {
                // Si es un terminal, entonces lo movemos a sent y marcamos que
                // es un terminal menos que hizo _match_ de la cadena de entrada
                (Element::Terminal(e), _) => {
                    self.caso = "5";
                    self.matched -= 1;
                    self.sent.push(Element::Terminal(e));
                    self.hist.pop();
                }
                // Si es un no terminal pero aun quedan variantes por explorar
                (Element::NonTerminal(id), _) if self.rem_variants(id) > 1 => {
                    self.caso = "6a";
                    self.state = State::Q;

                    let n = unsafe { self.increase_last_hist_counter() };
                    let start = self.grammar.starting_ptr[id];

                    // Entonces sustituimos la variante en sent por la nueva
                    // variante a probar
                    self.pop_with(self.grammar.rhs[start + n - 2]);
                    self.extend_with(self.grammar.rhs[start + n]);
                }
                // Para cualquier otro no terminal, es decir, que no le quedan
                // variantes por explorar
                (Element::NonTerminal(id), n) => {
                    // Lo eliminamos de la pila de hist y agregamos el no terminal
                    // a sent para que se continue el backtrack
                    self.caso = "6c";
                    self.pop_with(self.grammar.rhs[self.grammar.starting_ptr[id] + n]);
                    self.extend_with(self.grammar.non_terminal[id]);
                    self.hist.pop();
                }
            },
            // Si ya terminamos, no hacemos nada
            State::T => {}
        }

        self.state
    }
}

//
//
//  De aqui en adelante se trata mas de funciones de _papeleo_
//
//

/// Implementación de Display para Acceptor, asi podemos mostrar en la
/// pantalla de forma amigable al usuario
impl<'inp> std::fmt::Display for Acceptor<'inp> {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "({:?}, {}, ", self.state, self.matched + 1)?;
        if self.hist.is_empty() {
            write!(f, "\u{03B5}")?;
        }
        for (ref symb, n) in &self.hist {
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

impl<'inp> Acceptor<'inp> {
    /// Crea un aceptor usando una gramatica y un texto de entrada determinado
    #[must_use]
    fn new(g: &'inp Grammar<'inp>, t: &'inp str) -> Self {
        Acceptor {
            grammar: g,
            input: t,
            sent: vec![Element::Terminal('#'), Element::NonTerminal(0)],
            ..Default::default()
        }
    }

    /// Obtiene en numero de variantes restantes para el no terminal en `hist`
    /// que se encuentre primero.
    ///
    /// Si no se encontro ningun no terminal con dicho id en la pila `hist`,
    /// entonces devolvemos que quedan por probar todas las alternativas
    fn rem_variants(&self, for_id: NonTerminalID) -> usize {
        assert!(for_id < self.grammar.non_terminal.len());

        let current = self
            .hist
            .iter()
            .rev()
            .find_map(|(id, rem)| {
                matches!(id, Element::NonTerminal(id) if *id == for_id).then(|| rem)
            })
            .unwrap_or(&0);

        self.grammar.number_rules[for_id] - current - 1
    }

    /// Obtiene el primer terminal o no terminal que se detecte en la cadena de
    /// entrada `from`.
    ///
    /// Por la naturaleza de las pilas que uso en el algoritmo, la funcion busca
    /// desde el final de la cadena por _matches_
    fn next_rev<'a>(&self, from: &'a str) -> (Element, &'a str) {
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

    /// Extiende sent con los terminales y no terminales que contenga la cadena
    /// de entrada `from`
    ///
    /// Porque sent es una pila LIFO, agreamos los terminales y no terminales
    /// comenzando desde el final de la cadena
    fn extend_with(&mut self, from: &str) {
        let mut from = from;
        while !from.is_empty() {
            let (next, f) = self.next_rev(from);
            self.sent.push(next);
            from = f;
        }
    }

    /// Elimina el numero de elementos terminales y no terminales que contenga
    /// la cadena de entrada `from` de la pila LIFO `sent`
    fn pop_with(&mut self, from: &str) {
        let mut from = from;
        while !from.is_empty() {
            let (_, f) = self.next_rev(from);
            self.sent.pop();
            from = f;
        }
    }

    /// Devuelve el texto que queda por acpetar de la cadena de entrada
    fn rem_str(&self) -> &str {
        &self.input[self.matched..]
    }

    /// Incrementa la variante actual para el elemento en la cima de `hist`
    /// y devuelve el valor resultante del contador.
    /// Se usa por ejemplo, para indicar que pasamos de la variante 2 a 3 para
    /// las variantes de un no terminal cualquiera
    ///
    /// # Seguridad
    ///
    /// El _caller_ debe garantizar que existe un valor en la parte superior de la
    /// pila de `hist` y que es un [`Element::NonTerminal`].
    ///
    /// Este método nunca debe usarse con un valor [`Element::Terminal`] en la
    /// cima de la pila `hist`
    unsafe fn increase_last_hist_counter(&mut self) -> usize {
        self.hist
            .last_mut()
            .map(|(_, n)| {
                *n += 2;
                *n
            })
            .unwrap_unchecked()
    }
}

/// Solicita un valor en la consola al usuario. Espera el valor a renglon
/// seguido del mensaje de solicitud.
fn ask_val(msg: &str) -> std::io::Result<String> {
    use std::io::Write;

    print!("{msg}");
    std::io::stdout().lock().flush()?;
    let mut value = String::with_capacity(20);
    std::io::stdin().read_line(&mut value)?;

    while value.ends_with(['\n', '\r']) {
        value.pop();
    }

    Ok(value)
}

fn app() -> Result<(), Box<dyn std::error::Error>> {
    // Nos saltamos el primer argumento, que es siempre la ruta del ejecutable
    let mut args = std::env::args().skip(1);

    // Si no se ingreso una ruta a un archivo de gramatica como argumento lo
    // solicitamos al usuario
    let path = if let Some(path) = args.next() {
        path
    } else {
        ask_val("Ingresa la ruta del archivo con la gramatica: ")?
    };

    println!("INFO:: Leyendo gramatica de la ruta {path:?}");
    let file = std::fs::read_to_string(&path)?;
    let g = Grammar::from_str(file.as_str());
    println!("INFO:: Gramatica con representacion {g:?}");

    // Si no se ingreso un texto de entrada para verificar como argumento al
    // ejecutar el programa, entonces la pedimos al usuario que lo ingresse
    let mut inp = if let Some(inp) = args.next() {
        inp
    } else {
        ask_val("Ingresa la cadena a verificar (sin incluir #): ")?
    };
    // Agregamos el caracter de terminacion al final del texto a evaluar
    inp.push('#');
    println!("INFO:: Evaluando {inp:?}");

    println!("INFO:: {g}");

    // Creamos el aceptor, evaluara el texto de entrada `inp` usando la
    // gramatica `g`
    let mut acceptor = Acceptor::new(&g, &inp);
    println!("{acceptor}");

    // Iteramos mientras no obtengamos un estado de terminacion
    loop {
        let state = acceptor.next();
        println!("  (Caso {: <2})  |- {acceptor}", acceptor.caso);
        if state == State::T {
            break;
        }
    }

    // Dependiendo del ultimo caso sabemos si se acepto o no el texto a evaluar
    println!(
        "La gramatica {}acepto la entrada {inp:?}",
        if acceptor.caso == "3" { "" } else { "no " }
    );

    Ok(())
}
