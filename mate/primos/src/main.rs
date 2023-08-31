//!
//! ```
//! cargo add primes
//! cargo run
//! ```
use primes::{PrimeSet, Sieve};

fn main() {
    for p in Sieve::new().iter().take(20) {
        println!("{}", 2u128.pow(p as u32) - 1);
    }
}
