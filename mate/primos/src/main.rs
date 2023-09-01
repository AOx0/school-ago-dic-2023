//!
//! ```
//! cargo add primes
//! cargo run
//! ```
use primes::{PrimeSet, Sieve};

fn main() {
    for p in Sieve::new().iter().take(7) {
        let m = 2u128.pow(p as u32) - 1;
        if Sieve::new().is_prime(m as u64) {
            println!("* {p}: {m} => {}", 2u128.pow((p - 1) as u32) * m)
        } else {
            println!("x {p}: {m} => {}", 2u128.pow((p - 1) as u32) * m)
        }
    }
}
