fn divide(n: i64, d: i64) -> (i64, i64) {
    assert!(d != 0);

    match (n, d) {
        (_, d) if d < 0 => {
            let (q, r) = divide(n, -d);
            (-q, r)
        }
        (n, _) if n < 0 => {
            let (q, r) = divide(-n, d);
            if r == 0 {
                (-q, 0)
            } else {
                (-q - 1, d - r)
            }
        }
        (_, _) => {
            let (mut q, mut r) = (0, n);
            while r >= d {
                q += 1;
                r -= d;
            }
            (q, r)
        }
    }
}

fn mcd(a: i64, b: i64) -> i64 {
    assert!(b != 0);

    let (mut d, mut c) = (b.abs(), a.abs());

    while d != 0 {
        let (t, r) = divide(c, d);
        println!("{c: >3} = ({t}) {d: >2} + {r}");
        c = d;
        d = r;
    }

    println!("mcd({a: >3}, {b: >3}): {c}\n");
    c
}

fn main() {
    mcd(-56, -42);
    mcd(56, 42);
    mcd(106, 46);
    mcd(78, 32);
}
