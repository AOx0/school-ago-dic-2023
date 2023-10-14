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

fn sgn(n: i64) -> i64 {
    if n < 0 {
        -1
    } else if n > 0 {
        1
    } else {
        n
    }
}

fn mcd(a: i64, b: i64) -> (i64, i64, i64) {
    assert!(b != 0);

    let (mut c, mut d) = (a.abs(), b.abs());
    let (mut c1, mut d1) = (1, 0);
    let (mut c2, mut d2) = (0, 1);

    while d != 0 {
        let (q, r) = divide(c, d);
        let r1 = c1 - q * d1;
        let r2 = c2 - q * d2;

        c = d;
        d = r;

        c1 = d1;
        d1 = r1;

        c2 = d2;
        d2 = r2;
    }

    let (s, _) = divide(c1, sgn(a) * sgn(c));
    let (t, _) = divide(c2, sgn(b) * sgn(c));
    (c, s, t)
}

fn main() {
    let (mcd, s, t) = mcd(141, 96);

    // mcd de 141 y 96 es 3
    assert_eq!(mcd, 3);

    // s a + t b = mcd
    assert_eq!(s * 141 + t * 96, mcd);

    println!("(mcd: {mcd}, s: {s}, t: {t})");
}
