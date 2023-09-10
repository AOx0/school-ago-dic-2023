fn div(a: i64, b: i64) -> (i64, i64) {
    let mut res = (0, 0);
    let (ref mut q, ref mut r) = res;

    if a == 0 {
        return res;
    }

    *r = a.abs();

    while *r >= b {
        *r -= b;
        *q += 1
    }

    if a > 0 {
        // Cuando son positivos no hacemos nada
    } else if *r == 0 {
        // Si el residuo es 0 existe la posibilidad
        // de que podamos tener un cociente negativo
        *q = -*q;
    } else {
        // Si no, un residuo
        *q = -*q - 1;
        *r = b - *r;
    }

    res
}

fn main() {
    println!("{:?}", div(11, 3));
    println!("{:?}", div(10, 3));
    println!("{:?}", div(-11, 3));
}
