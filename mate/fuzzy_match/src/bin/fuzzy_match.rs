// use fuzzy_match::*;

use num::BigRational;

fn main() {
    #[cfg(feature = "dhat")]
    let _profiler = dhat::Profiler::new_heap();

    let mut p = BigRational::from_float(10.).unwrap();
    let sr = SR::new(
        &|x| x.pow(2) - BigRational::from_float(612.).unwrap(),
        &|x| BigRational::from_float(2.).unwrap() * x,
        p.clone(),
    )
    .with_iter(5000);

    for (i, s) in sr.into_iter().enumerate() {
        if p == s {
            println!("Equal sol iter {i}, val: {s:.60}");
            break;
        }
        p = s.clone();
        println!("{:.500}", s);
    }
}

struct SR<'a> {
    f: &'a dyn Fn(BigRational) -> BigRational,
    fp: &'a dyn Fn(BigRational) -> BigRational,
    sol: BigRational,
    iter: Option<usize>,
}

impl<'a> SR<'a> {
    #[must_use]
    fn new(
        f: &'a dyn Fn(BigRational) -> BigRational,
        fp: &'a dyn Fn(BigRational) -> BigRational,
        guess: BigRational,
    ) -> Self {
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
    type Item = BigRational;
    fn next(&mut self) -> Option<Self::Item> {
        matches!(self.iter, Some(x) if x > 0).then(|| {
            *self.iter.as_mut().unwrap() -= 1;
            self.sol =
                self.sol.clone() - ((self.f)(self.sol.clone()) / (self.fp)(self.sol.clone()));
            self.sol.clone()
        })
    }
}
