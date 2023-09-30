//! Daniel Alejandro Osornio Lopez
//! 0244685@up.edu.mx
//!
//! No le voy a mentir, ya habia programado el algorimto de fuerza bruta en mis
//! ratos libres. En este codigo solo le incluyo lo que pidio, modifique lo
//! que ya habia hecho para leer gramaticas de archivos de texto, porque yo
//! lo habia programado para que fueran conocidas en tiempo de compilacion.
//!
//! El codigo esta en ingles porque asi me gusta programar, no porque haya
//! investigado nada en internet. Los comentarios están en español.
//!
//! No incluyo ningún acento ni caracter especial para no dificultar la lectrua.
//!
//! Solo es una demostracion al estilo de libreria, no esta programado para
//! funcionar como una aplicacion de cli final.

#![deny(clippy::all)]
#![warn(clippy::pedantic)]
#![deny(rust_2018_idioms)]

use std::{fs::OpenOptions, io::Read, process::ExitCode};

fn main() -> ExitCode {
    // Podemos construirlo desde el codigo
    let g = Grammar::new()
        .with_rule("S", &["E"])
        .with_rule("E", &["TE'"])
        .with_rule("E'", &["+TE'", ""])
        .with_rule("T", &["FT'"])
        .with_rule("T'", &["*FT'", ""])
        .with_rule("F", &["b", "(E)"]);

    println!("{g:?}");

    // O leerlo de un archivo de la forma:
    //
    // gramatica.txt:
    // ```
    // S E
    // E TE'
    // E' +TE'
    // T FT'
    // T' *FT'
    // F b (E)
    // ```

    // Leyendolo de los argumentos del programa, si es que se pasa uno
    // de la forma:
    //     cargo run --release -- gramatica.txt
    // o en general de la forma:
    //     ./bin gramatica.txt
    if let Some(file) = std::env::args().nth(1) {
        // En este ejemplo solo nos interesa el camino feliz
        // e ignoramos errores [`Result::Err`]
        if let Ok(g) = Grammar::from_file(&file) {
            println!("{g:?}");
        }
    }

    // O en general pasando el archivo como str
    match Grammar::from_file("./gramatica.txt") {
        Ok(g) => {
            // Si pudimos leer corectamente la gramatica del archivo
            println!("{g:?}");
            ExitCode::SUCCESS
        }
        Err(err) => {
            // Si ocurrio algun error
            eprintln!("{err}");
            ExitCode::FAILURE
        }
    }
}

type NonTerminalID = usize;

/// Nota:
/// - La combinacion de `number_rules` y `starting_ptr` forman conceptualmente `LHS`
/// - `non_terminal` es `NT`
/// - `rhs` es `RHS`
#[derive(Debug, Default)]
struct Grammar {
    /// Uso nt_sorted porque asi se cuales son los no terminales mas largos
    /// P. ej `E'''` es mas largo que `E'` y por lo tanto en la implemntacion
    /// final siempre tengo que buscar un match primero de `E'''` y si no se
    /// encuentra ninguno entonces buscare `E'`
    ///
    /// La lista contiene, ordenado de mayor a menor por tamño del string de
    /// el no terminal original, el indice de cada no terminal
    /// en el vector `non_tereminal`
    nt_sorted: Vec<NonTerminalID>,

    /// Vector con las cadenas de los no terminales
    non_terminal: Vec<String>,

    /// Vector donde la posicion es significativa, el elemento en la posicion 0
    /// corresponde al no terminal en el vector `non_terminal` en la posicion 0
    ///
    /// Indica el número de variantes que tiene el no terminal
    number_rules: Vec<usize>,

    /// Vector donde la posicion es significativa, el elemento en la posicion 0
    /// corresponde al no terminal en el vector `non_terminal` en la posicion 0
    ///
    /// Contiene el indice donde comienzan las variantes para el no terminal
    /// correspondiente de acuerdo a la posicion en el vector.
    starting_ptr: Vec<usize>,

    /// Contiene las variantes de los no terminales, es decir las producciones
    /// en las que deriva.
    ///
    /// Podemos saber que variantes son de que terminales ya que sabemos en que
    /// punto comienzan las variaciones de cada no terminal y cuantas variaciones
    /// tiene.
    rhs: Vec<String>,
}

impl Grammar {
    pub fn new() -> Self {
        Self::default()
    }

    /// .
    ///
    /// # Errors
    ///
    /// Devolvera un error si se falla al abrir un archivo (p. ej. porque
    /// la ruta no existe), o si no se pueden leer los contenidos del mismo
    /// (p. ej. porque no es utf-8 valido)
    pub fn from_file(path: &str) -> std::io::Result<Self> {
        let mut file = OpenOptions::new().read(true).open(path)?;
        let mut contenido = String::new();
        let mut grammar = Grammar::new();

        file.read_to_string(&mut contenido)?;

        let mut buf = Vec::new();

        // Para cada linea del archivo
        for line in contenido.lines() {
            let mut word_iter = line.split(' ');

            // Obtenemos primero el nombre
            if let Some(rule_name) = word_iter.next() {
                // Despues las reglas
                for p in word_iter {
                    buf.push(p);
                }

                // Y lo agregamos a la gramatica
                grammar.add_rule(rule_name, buf.as_ref());
                buf.clear();
            }
        }

        Ok(grammar)
    }

    /// .
    ///
    /// # Panics
    ///
    /// El programa para la ejecucion si se ingresa un no terminal dos veces,
    /// cada no terminal debe aparecer 1 vez, como si de una llave se tratara.
    fn add_rule(&mut self, name: &str, produces: &[&str]) {
        let existing = self.non_terminal.iter().position(|a| a == name);

        if let Some(existing_position) = existing {
            panic!("Productions rules for the non-terminal {name} already exist (at idx {existing_position})");
        } else {
            self.number_rules.push(produces.len());
            self.starting_ptr.push(self.rhs.len());
            self.rhs.extend(produces.iter().map(|a| a.to_string()));
            self.non_terminal.push(name.to_string());

            self.nt_sorted.push(self.non_terminal.len() - 1);
            self.nt_sorted.sort_unstable_by(|&a, &b| {
                self.non_terminal[b].len().cmp(&self.non_terminal[a].len())
            });
        }
    }

    pub fn with_rule(mut self, name: &str, produces: &[&str]) -> Self {
        self.add_rule(name, produces);
        self
    }
}
