fn main() {
    let n = std::env::args().skip(1).next().unwrap();
    let (res, total) = nece(n.parse().unwrap());
    println!(
        "/{}: 255.255.255.{} (hosts: {})",
        res,
        flip(res - 24),
        total
    );
}

fn flip(n: u8) -> u8 {
    let res: u8 = !((0b1 << (8 - n)) - 1);
    return res as u8;
}

fn nece(n: u16) -> (u8, u16) {
    for i in 1..=8 {
        let max_hosts = 2u16.pow(i) - 2;
        if n <= max_hosts {
            return (32 - i as u8, max_hosts);
        }
    }
    unreachable!()
}
