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

pub fn times<'a, U, V>(a: &'a [U], b: &'a [V]) -> impl Iterator<Item = (U, V)> + 'a
where
    U: Clone,
    V: Clone,
{
    a.iter()
        .map(|a| b.iter().map(|b| (a.clone(), b.clone())))
        .flatten()
}

pub fn fam_times<T: Clone>(a: &[&[T]]) -> Vec<Vec<T>> {
    let mut res = Vec::new();

    for i in 1..a.len() {
        res = match i {
            1 => times(a[0], a[1]).map(|e| vec![e.0, e.1]).collect(),
            2.. => times(&res, a[i])
                .map(|(mut vec, val)| {
                    vec.push(val);
                    vec
                })
                .collect(),
            _ => unreachable!("Range is 0..n"),
        };
    }

    res
}

#[must_use]
pub fn test() -> &'static str {
    "Hello World"
}
