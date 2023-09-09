use std::{fs::OpenOptions, io::Read};

use flex_rust::*;

use logos::Logos;

#[derive(Logos, Debug, PartialEq)]
enum Tokens {
    #[regex("([-+]?[1-9][0-9]*)|0", priority = 1)]
    Digit,
}

fn main() {
    #[cfg(feature = "dhat")]
    let _profiler = dhat::Profiler::new_heap();

    let file = std::env::args().skip(1).next();
    let mut buff = String::new();

    let mut input: Box<dyn Read> = if let Some(file) = file {
        Box::new(OpenOptions::new().read(true).open(file).unwrap())
    } else {
        Box::new(std::io::stdin())
    };

    input.read_to_string(&mut buff).unwrap();

    let mut lexer = Tokens::lexer(&buff);
    let mut res: i128 = 0;

    while let Some(c) = lexer.next() {
        match c {
            Ok(Tokens::Digit) => {
                res += i128::from_str_radix(lexer.slice(), 10).unwrap();
            }
            _ => {
                print!("{}", lexer.slice());
            }
        }
    }

    println!("Suma total: {res}");
}
