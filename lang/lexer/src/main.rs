#![deny(clippy::all)]
#![warn(clippy::pedantic)]
#![deny(rust_2018_idioms, unsafe_code)]

use logos::{Lexer, Logos};

#[derive(Copy, Clone, Debug, Eq, PartialEq, Hash)]
enum Palabra {
    Inicio,
    Fin,
    O,
    Y,
    No,
    Leer,
    Escribir,
    Si,
    Entonces,
    SiNo,
    FinSi,
    Mientras,
    Hacer,
    FinMientras,
    Repetir,
    HastaQue,
    Para,
    Desde,
    Hasta,
    Paso,
    FinPara,
}

#[derive(Copy, Clone, Debug, Eq, PartialEq, Hash)]
enum Arithmetic {
    Suma,
    Resta,
    Times,
    Div,
    Mod,
    Pow,
}

#[derive(Copy, Clone, Debug, Eq, PartialEq, Hash)]
enum Relacional {
    Menor,
    MenorQue,
    Mayor,
    MayorQue,
    Igual,
    Dist,
}

#[derive(Copy, Clone, Debug, Eq, PartialEq, Hash, Logos)]
#[logos(skip r"[ \t\n\f]+")]
enum Token {
    #[token("+", |_| Arithmetic::Suma)]
    #[token("-", |_| Arithmetic::Resta)]
    #[token("*", |_| Arithmetic::Times)]
    #[token("/", |_| Arithmetic::Div)]
    #[token("**", |_| Arithmetic::Pow)]
    #[token("mod", |_| Arithmetic::Mod, ignore(ascii_case))]
    Arithmetic(Arithmetic),

    #[token("<", |_| Relacional::Menor)]
    #[token("<=", |_| Relacional::MenorQue)]
    #[token(">", |_| Relacional::Mayor)]
    #[token(">=", |_| Relacional::MayorQue)]
    #[token("==", |_| Relacional::Igual)]
    #[token("<>", |_| Relacional::Dist)]
    Relacional(Relacional),

    #[token("inicio", |_| Palabra::Inicio, ignore(ascii_case))]
    #[token("fin", |_| Palabra::Fin, ignore(ascii_case))]
    #[token("o", |_| Palabra::O, ignore(ascii_case))]
    #[token("y", |_| Palabra::Y, ignore(ascii_case))]
    #[token("no", |_| Palabra::No, ignore(ascii_case))]
    #[token("leer", |_| Palabra::Leer, ignore(ascii_case))]
    #[token("escribir", |_| Palabra::Escribir, ignore(ascii_case))]
    #[token("si", |_| Palabra::Si, ignore(ascii_case))]
    #[token("entonces", |_| Palabra::Entonces, ignore(ascii_case))]
    #[token("si_no", |_| Palabra::SiNo, ignore(ascii_case))]
    #[token("fin_si", |_| Palabra::FinSi, ignore(ascii_case))]
    #[token("mientras", |_| Palabra::Mientras, ignore(ascii_case))]
    #[token("hacer", |_| Palabra::Hacer, ignore(ascii_case))]
    #[token("fin_mientras", |_| Palabra::FinMientras, ignore(ascii_case))]
    #[token("repetir", |_| Palabra::Repetir, ignore(ascii_case))]
    #[token("hasta_que", |_| Palabra::HastaQue, ignore(ascii_case))]
    #[token("para", |_| Palabra::Para, ignore(ascii_case))]
    #[token("desde", |_| Palabra::Desde, ignore(ascii_case))]
    #[token("hasta", |_| Palabra::Hasta, ignore(ascii_case))]
    #[token("paso", |_| Palabra::Paso, ignore(ascii_case))]
    #[token("fin_para", |_| Palabra::FinPara, ignore(ascii_case))]
    Palabra(Palabra),

    #[regex(r"(?i:[a-z0-9_]+)", priority = 0)]
    Ident,

    #[regex(r"[+-]?[1-9][0-9]*|0", priority = 12)]
    #[regex(r"[+-]?[0-9]+.[0-9]+")]
    #[regex(r"[+-]?[1-9][0-9]E[+-][0-9]+")]
    #[regex(r"[0-9E.+-]+", priority = 1, callback = |lex| {
        println!("Error numero: {}", lex.slice());
        logos::Skip
    })]
    Numero,

    #[regex(r"'(\\'|[^'])*'")]
    Cadena,

    #[regex(r"#.*")]
    ComentarioSimple,

    // #[regex(r"\(\*([^*]|\n|\*[^)])*\*\)")]
    #[token("(*")]
    ComentarioLargo
}

#[derive(Copy, Clone, Debug, Eq, PartialEq, Hash, Logos)]
enum CommentContents {
    #[token("*)")]
    End,

    #[regex(".")]
    Otro,

    #[regex("[\r]*\n")]
    Linea
}

fn main() {
    let arg = std::env::args()
        .nth(1)
        .map(|a| std::fs::read_to_string(a).unwrap())
        .unwrap();

    let mut lex = Token::lexer(&arg);

    #[allow(clippy::while_let_on_iterator)]
    while let Some(res) = lex.next() {
        if let Ok(token) = res {
            match token {
                Token::ComentarioLargo => {
                    print!("Comentario: \"");
                    let mut inner = lex.morph();
                    while let Some(token) = inner.next() {
                        match token.unwrap() {
                            CommentContents::End => { break }
                            CommentContents::Otro => {
                                print!("{}", inner.slice());
                            }
                            CommentContents::Linea => {
                                print!("\\n");
                            }
                        }
                    }
                    println!("\"");
                    lex = inner.morph();
                }
                Token::Ident => {
                    let ident = lex.slice();
                    if ident.starts_with(['_', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'])
                        || ident.ends_with('_')
                        || ident.contains("__")
                    {
                        println!("Error: Identificador invalido '{ident}'");
                    } else {
                        println!("{:?}: {}", token, lex.slice());
                    }
                }

                _ => {
                    println!("{:?}: {}", token, lex.slice());
                }
            }
        }
    }
}
