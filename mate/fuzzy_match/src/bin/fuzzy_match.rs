use fuzzy_match::*;

fn main() {
    #[cfg(feature = "dhat")]
    let _profiler = dhat::Profiler::new_heap();

    println!("{}", test());
}



fn fuzzy_set_mapping(x: f32, a: f32, b: f32, c: f32) -> f32 {
    if x < a {
        0.
    } else if x > b {
        1.
    } else {
        (x - a) / (b - a)
    }
}