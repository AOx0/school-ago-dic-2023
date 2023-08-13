//! # `collections`
//!

#![deny(clippy::all)]
#![warn(clippy::pedantic)]
#![deny(rust_2018_idioms, unsafe_code)]

#[cfg(feature = "dhat")]
#[global_allocator]
pub static ALLOC: dhat::Alloc = dhat::Alloc;

pub fn inter<T: Clone + PartialEq>(a: &[T], b: &[T]) -> Vec<T> {
    use std::ops::Not;

    let mut res = Vec::new();

    a.iter().for_each(|val| {
        if b.contains(val) && res.contains(val).not() {
            res.push(val.clone());
        }
    });

    res
}

pub fn union<T: Clone + PartialEq>(a: &[T], b: &[T]) -> Vec<T> {
    use std::ops::Not;
    let mut res = a.to_vec();

    b.iter().for_each(|val| {
        res.contains(val).not().then(|| {
            res.push(val.clone());
        });
    });

    res
}

#[must_use]
pub fn test() -> &'static str {
    "Hello World"
}
