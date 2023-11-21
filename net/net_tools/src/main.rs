fn main() {
    let args: Vec<String> = std::env::args().skip(1).collect::<Vec<_>>();


    if let [n] = &args[..] {
        let (res, total) = nece(n.parse().unwrap());
        println!(
            "/{}: 255.255.255.{} (hosts: {})",
            res,
            flip(res - 24),
            total
        );
    } else {
        let network_address = parse_network_address(&args[0]);
        let requirements: Vec<usize> = args.into_iter().skip(1).map(|e| e.parse().unwrap() ).collect::<Vec<_>>();
        calculate_subnets_table(network_address, &requirements);
    }
    
}

fn parse_network_address(network_address: &str) -> (u8, u8, u8, u8) {
    let mut octets = network_address.split(".").map(|e| e.parse().unwrap() ).collect::<Vec<_>>();
    (octets[0], octets[1], octets[2], octets[3])
}

/// Each element in requirements is the number of hosts required in that subnet
/// The method prints a table with the starting address, the subnet mask, max number of hosts and the broadcast address
/// The method also prints the total number of hosts
fn calculate_subnets_table(network_address: (u8, u8, u8, u8), requirements: &[usize]) {
    let mut network_address = network_address;
    let mut total_hosts = 0;
    for (i, &requirement) in requirements.iter().enumerate() {
        let (res, total) = nece(requirement as u16);
        let subnet_mask = flip(res - 24);
        let broadcast_address = (network_address.0, network_address.1, network_address.2, network_address.3 + (total as u8) + 1);
        println!(
            "Subnet {}: {}.{}.{}.{} /{}: {} (hosts: {})",
            i + 1,
            network_address.0,
            network_address.1,
            network_address.2,
            network_address.3,
            res,
            subnet_mask,
            total
        );
        println!(
            "Subnet mask: 255.255.255.{}",
            subnet_mask
        );
        println!(
            "Starting address: {}.{}.{}.{}",
            network_address.0,
            network_address.1,
            network_address.2,
            network_address.3 + 1
        );
        println!(
            "Ending address: {}.{}.{}.{}",
            broadcast_address.0,
            broadcast_address.1,
            broadcast_address.2,
            broadcast_address.3 - 1
        );
        println!(
            "Broadcast address: {}.{}.{}.{}",
            broadcast_address.0,
            broadcast_address.1,
            broadcast_address.2,
            broadcast_address.3
        );
        println!();
        network_address = broadcast_address;
        network_address.3 += 1;
        total_hosts += total + 2;
    }
    println!("Total hosts: {}", total_hosts);
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
