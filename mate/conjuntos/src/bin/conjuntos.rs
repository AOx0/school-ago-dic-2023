use conjuntos::*;

fn main() {
    #[cfg(feature = "dhat")]
    let _profiler = dhat::Profiler::new_heap();

    let a = &[1, 2, 4, 5];
    let b = &[4, 1, 5, 7];

    for y in union_iter(union_iter(a.iter(), b.iter()), [666, 234, 24].iter()) {
        print!("{} ", y);
    }

    for y in union(
        union(a, b).copied().collect::<Vec<_>>().as_slice(),
        &[666, 234, 24],
    ) {
        print!("{} ", y);
    }

    println!()
}
