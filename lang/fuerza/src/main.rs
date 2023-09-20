struct HistElement<'a> {
    symb: &'a str,
    nt: u8,
}

fn main() {
    let NT = ["E", "E'", "T", "T'", "F"];

    let LHS = [(2, 1), (2, 3), (2, 5), (2, 7), (2, 9)];
    let RHS = ["TE'", "+T", "+TE'", "F", "FT'", "*F", "*ET'", "(E)", "a"];

    let hist: Vec<HistElement<'_>> = Vec::with_capacity(5 * 2);

    println!("Hello, world!");
}
