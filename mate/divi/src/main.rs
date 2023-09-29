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

macro_rules! view {
    ($v:expr => $($arg:tt)*) => {{
        print!($($arg)*);
        println!(": {}", $v);
        $v
    }};
}

fn mcd(a: i64, b: i64) -> i64 {
    assert!(b != 0);

    let (mut d, mut c) = (b.abs(), a.abs());

    while d != 0 {
        let (t, r) = divide(c, d);
        println!("{c: >2} = ({t}) {d: >2} + {r}");
        c = d;
        d = r;
    }

    view!(c => "mcd({a}, {b})")
}

fn main() {
    mcd(-56, -42);
    mcd(56, 42);
    mcd(106, 46);
    mcd(78, 32);
}
