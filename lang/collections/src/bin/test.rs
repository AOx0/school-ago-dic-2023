use collections::*;

fn main() {
    #[cfg(feature = "dhat")]
    let _profiler = dhat::Profiler::new_heap();

    let a: &[char] = &['a', 'b', 'c', 'd', 'f', 'n', 'i'];
    let b: &[char] = &['a', 'b', 'g'];
    let c: &[char] = &['h', 'h', 'n'];
    let d: &[char] = &['h', 'g'];

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
    println!("f {:?}", fam_times(&[a, a, a]));

    println!();
    println!("f {:?}", fam_times(&[d]));
}
