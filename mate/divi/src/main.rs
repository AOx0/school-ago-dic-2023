fn div(a: i64, b: i64) -> (i64, i64) {
    let (mut q, mut r) = (0, a.abs());

    if a == 0 {
        return (0, 0);
    }

    while r >= b {
        r -= b;
        q += 1
    }

    if a > 0 {
        // Cuando son positivos no hacemos nada
    } else if r == 0 {
        // Si el residuo es 0 existe la posibilidad
        // de que podamos tener un cociente negativo0
        q = -q;
    } else {
        // Si no, un residuo
        q = -q - 1;
        r = b - r;
    }

    (q, r)
}

fn divide(n: i64, d: i64) -> (i64, i64) {
    match (n, d) {
        (_, 0) => panic!(),
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
        (_, _) => divide_unsigned(n, d),
    }
}

fn divide_unsigned(n: i64, d: i64) -> (i64, i64) {
    let (mut q, mut r) = (0, n);
    while r >= d {
        q += 1;
        r -= d;
    }
    (q, r)
}

fn main() {
    println!("{:?}", div(11, 3));
    println!("{:?}", div(0, 3));
    println!("{:?}", div(0, 0));
    println!("{:?}", div(10, 3));
    println!("{:?}", div(-11, 3));
    println!("{:?}", div(-11, 3));
    println!("{:?}", divide(0, 3));
    println!("{:?}", divide(-11, 3));
    println!("{:?}", divide(-11, -3));
    println!("{:?}", divide(-20, 7));
    println!("{:?}", divide(-21, 4));
}
