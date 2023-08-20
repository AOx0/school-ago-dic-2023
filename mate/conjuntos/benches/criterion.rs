//! See:
//! - https://github.com/bheisler/criterion.rs
//! - https://bheisler.github.io/criterion.rs/book/index.html

use conjuntos::*;
use criterion::BenchmarkId;
#[allow(unused_imports)]
use criterion::{black_box, criterion_group, criterion_main, Criterion};

fn criterion_benchmark(c: &mut Criterion) {
    c.bench_function("test", |b| b.iter(test));
}

fn test_iter(a: &[i32], b: &[i32]) {
    let mut sum = 0;
    for y in union_iter(union_iter(a.iter(), b.iter()), [666, 234, 24].iter()) {
        sum += y;
    }
}

fn test_vec(a: &[i32], b: &[i32]) {
    let mut sum = 0;
    for y in union(union_vec(a, b).as_slice(), &[666, 234, 24]) {
        sum += y;
    }
}

fn test_slice(a: &[i32], b: &[i32]) {
    let mut sum = 0;
    for y in union(
        union(a, b).copied().collect::<Vec<_>>().as_slice(),
        &[666, 234, 24],
    ) {
        sum += y;
    }
}

fn bench_cmp(c: &mut Criterion) {
    let mut group = c.benchmark_group("Union");
    for (a, c) in [
        ([1, 2, 4, 5].as_slice(), [4, 1, 5, 7].as_slice()),
        (
            [1, 2, 4, 645, 2342, 23, 123, 345, 23, 234, 65, 34].as_slice(),
            [6, 3, 8, 2, 1, 10, 22, 45, 87].as_slice(),
        ),
        (
            [
                1, 2, 4, 3, 0, 54, 85, 33, 44, 22, 11, 90, 94, 645, 2342, 23, 123, 345, 23, 234,
                65, 34,
            ]
            .as_slice(),
            [
                6, 3, 8, 2, 1, 10, 22, 45, 87, 0, 54, 98, 88, 77, 55, 44, 33, 22, 11, 92, 78,
            ]
            .as_slice(),
        ),
        (
            (1..100).into_iter().collect::<Vec<_>>().as_slice(),
            (80..200).into_iter().collect::<Vec<_>>().as_slice(),
        ),
        (
            (1..500).into_iter().collect::<Vec<_>>().as_slice(),
            (400..999).into_iter().collect::<Vec<_>>().as_slice(),
        ),
        (
            (1..2500).into_iter().collect::<Vec<_>>().as_slice(),
            (2000..4999).into_iter().collect::<Vec<_>>().as_slice(),
        ),
        (
            (1..4500).into_iter().collect::<Vec<_>>().as_slice(),
            (4000..7999).into_iter().collect::<Vec<_>>().as_slice(),
        ),
        (
            (1..5000).into_iter().collect::<Vec<_>>().as_slice(),
            (4000..9999).into_iter().collect::<Vec<_>>().as_slice(),
        ),
    ]
    .iter()
    {
        group.bench_with_input(
            BenchmarkId::new("Slices", a.len() + c.len()),
            &(a, c),
            |b, (a, c)| b.iter(|| test_slice(a, c)),
        );
        group.bench_with_input(
            BenchmarkId::new("Iter", a.len() + c.len()),
            &(a, c),
            |b, (a, c)| b.iter(|| test_iter(a, c)),
        );
        group.bench_with_input(
            BenchmarkId::new("Vec", a.len() + c.len()),
            &(a, c),
            |b, (a, c)| b.iter(|| test_vec(a, c)),
        );
    }
    group.finish();
}

criterion_group!(benches, criterion_benchmark, bench_cmp);
criterion_main!(benches);
