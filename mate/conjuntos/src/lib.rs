//! # `conjuntos`
//!

#![deny(clippy::all)]
#![warn(clippy::pedantic)]
#![deny(rust_2018_idioms, unsafe_code)]

#[cfg(feature = "dhat")]
#[global_allocator]
pub static ALLOC: dhat::Alloc = dhat::Alloc;

use std::ops::Not;

#[inline(never)]
pub fn union<'a, T: Clone + PartialEq + 'a + Copy>(
    x1: &'a [T],
    x2: &'a [T],
) -> impl Iterator<Item = &'a T> + 'a + Clone {
    x1.iter().chain(x2.iter().filter(|x| x1.contains(x).not()))
}

#[inline(never)]
pub fn union_vec<T: PartialEq + Copy>(x1: &[T], x2: &[T]) -> Vec<T> {
    let mut a = Vec::with_capacity(x1.len() + x2.len() / 2);

    for i in x1.iter().chain(x2.iter().filter(|x| x1.contains(x).not())) {
        a.push(*i);
    }

    a
}

#[inline(never)]
pub fn union_iter<'a, T: PartialEq + 'a>(
    x1: impl Iterator<Item = &'a T> + 'a + Clone,
    x2: impl Iterator<Item = &'a T> + 'a + Clone,
) -> impl Iterator<Item = &'a T> + 'a + Clone {
    x1.clone()
        .chain(x2.filter(move |x| x1.clone().find(|x1| x1 == x).is_none()))
}

#[must_use]
pub fn test() -> &'static str {
    "Hello World"
}
