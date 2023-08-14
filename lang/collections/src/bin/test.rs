use collections::*;

fn main() {
    #[cfg(feature = "dhat")]
    let _profiler = dhat::Profiler::new_heap();

    let a: &[u8] = &[2, 3, 1];
    let b: &[u8] = &[4, 5, 1];
    let c: &[u8] = &[2, 2];
    let d: &[u8] = &[2, 3];

    println!("{:?}", a);
    println!("{:?}", b);
    println!("{:?}", c);
    println!("{:?}", d);

    println!();

    println!("u {:?}", union(&a, &b));
    println!("s {:?}", inter(&a, &b));
    println!("x {:?}", times(&a, &b).collect::<Vec<_>>());
    println!("x {:?}", times(&a, &c).collect::<Vec<_>>());
    println!("f {:?}", fam_times(&[a, b, c]));

    println!();

    println!("x {:?}", times(&d, &d).collect::<Vec<_>>());
    println!("f {:?}", fam_times(&[d, d, d]));

    println!();
    println!("f {:?}", fam_times(&[d]));
}
