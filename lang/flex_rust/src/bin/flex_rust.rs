use std::{fs::OpenOptions, io::Read};

// use flex_rust::*;

use logos::{Lexer, Logos};

fn currency<'a>(slice: &'a str, name: &'a str) -> Option<f64> {
    let neg = slice.starts_with("-");

    let slice = slice
        .trim_start_matches('+')
        .trim_start_matches('-')
        .trim_start_matches('$')
        .trim_end_matches(name)
        .trim();

    let n: f64 = slice.parse().ok()?; // skip 'k'
    Some(if neg { -n } else { n })
}

fn dolar(lex: &mut Lexer<Token>) -> Option<f64> {
    currency(std::str::from_utf8(lex.slice()).unwrap(), "USD").map(|v| v)
}

fn peso(lex: &mut Lexer<Token>) -> Option<f64> {
    currency(std::str::from_utf8(lex.slice()).unwrap(), "MXN").map(|v| v * 0.057)
}

#[derive(Logos, Debug, PartialEq)]
#[logos(subpattern numb = r#"[1-9][0-9]*"#)]
#[logos(subpattern curr = r#"([-+]?\$? *(?&numb)|\$? *0)(\.[0-9]*)?"#)]
enum Token {
    #[regex(b"(?&curr) +USD", dolar)]
    #[regex(b"(?&curr) +MXN", peso)]
    Digit(f64),
}

fn main() {
    // #[cfg(feature = "dhat")]
    // let _profiler = dhat::Profiler::new_heap();

    let mut buff = Vec::new();
    let mut res: f64 = 0.;

    if let Some(file) = std::env::args().skip(1).next() {
        Box::new(OpenOptions::new().read(true).open(file).unwrap())
    } else {
        Box::new(std::io::stdin()) as Box<dyn Read>
    }
    .read_to_end(&mut buff)
    .unwrap();

    for c in Token::lexer(buff.as_slice()) {
        if let Ok(Token::Digit(d)) = c {
            res += d;
        }
    }

    println!("Suma final (dolares): {res:.2}");
    println!("  Suma final (pesos): {:.2}", res + 17.60);
}
