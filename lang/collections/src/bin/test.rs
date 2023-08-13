use collections::*;

fn main() {
    #[cfg(feature = "dhat")]
    let _profiler = dhat::Profiler::new_heap();

    let a = [2, 3, 1];
    let b = [4, 5, 1];

    println!("{:?}", union(&a, &b));
    println!("{:?}", inter(&a, &b));

    println!("{}", test());
}
