// use fuzzy_match::*;

type F = fraction::BigFraction;

fn main() {
    #[cfg(feature = "dhat")]
    let _profiler = dhat::Profiler::new_heap();

    let mut p = F::from(100);
    let sr = SR::new(
        &|x: F| x.clone() * x - F::new(2u64, 1u64),
        &|x| F::new(2u64, 1u64) * x,
        p.clone(),
    )
    .with_iter(15);

    const P: usize = 200;

    let mut p = format!("{:.P$}", p);
    for (i, s) in sr.into_iter().enumerate() {
        let res = format!("{:.P$}", s);
        if res == p {
            println!("Equal sol iter {i}, val:\n{}", res);
            break;
        }
        println!("{res}");
        p = res;
    }
}

struct SR<'a> {
    f: &'a dyn Fn(F) -> F,
    fp: &'a dyn Fn(F) -> F,
    sol: F,
    iter: Option<usize>,
}

impl<'a> SR<'a> {
    #[must_use]
    fn new(f: &'a dyn Fn(F) -> F, fp: &'a dyn Fn(F) -> F, guess: F) -> Self {
        Self {
            f,
            fp,
            sol: guess,
            iter: None,
        }
    }

    #[must_use]
    fn with_iter(mut self, iter: usize) -> Self {
        self.iter = Some(iter);
        self
    }
}

impl<'a> Iterator for SR<'a> {
    type Item = F;
    fn next(&mut self) -> Option<Self::Item> {
        matches!(self.iter, Some(x) if x > 0).then(|| {
            *self.iter.as_mut().unwrap() -= 1;
            self.sol =
                self.sol.clone() - ((self.f)(self.sol.clone()) / (self.fp)(self.sol.clone()));
            self.sol.clone()
        })
    }
}
