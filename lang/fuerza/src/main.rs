struct HistElement<'a> {
    symb: &'a str,
    nt: u8,
}

enum State {
    Normal,
    Backtrack,
    Terminate,
}

fn main() {
    let t = "T+T";
    let NT = ["E", "E'", "T", "T'", "F"];

    let LHS = [(2, 1), (2, 3), (2, 5), (2, 7), (2, 9)];
    let RHS = ["TE'", "+T", "+TE'", "F", "FT'", "*F", "*ET'", "(E)", "a"];

    let mut hist: Vec<HistElement<'_>> = Vec::with_capacity(5 * 2);
    let mut sent: Vec<String> = Vec::new();

    let n = t.len();
    let t = format!("{t}#");
    let state = State::Normal;
    let i = 1;

    hist.push(HistElement { symb: "", nt: 1 });
    sent.push(format!("{}#", NT[0]));

    loop {}
}
