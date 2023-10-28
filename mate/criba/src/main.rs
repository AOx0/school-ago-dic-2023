//! 0244685 - Daniel Alejandro Osornio López
//! Playground en linea: https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=d4ffd42a9eb00ea3090eb99e48192546

fn es_primo(num: u128) -> bool {
    match num {
        0..=1 => false,
        2..=3 => true,
        _ if num.rem_euclid(2) == 0 => false,
        _ if num.rem_euclid(3) == 0 => false,
        _ => {
            let mut i: u128 = 5;
            while i.pow(2) <= num {
                if num.rem_euclid(i) == 0 || num.rem_euclid(i + 2) == 0 {
                    return false;
                }
                i += 6;
            }

            true
        }
    }
}

fn criba(n: usize) -> Vec<u128> {
    let mut es_primo = vec![true; (n - 3) / 2];

    let mut i: usize = 0;
    while (2 * i + 3).pow(2) <= n {
        let mut k = i + 1;

        // Esta parte confunde en el pseudocodigo por que usa la notación esPrimo(i),
        // cuando en el resto del codigo se usa esPrimo[i]
        if es_primo[i] {
            while (2 * k + 1) * (2 * i + 3) <= n {
                // El pseudocodigo trabaja con indices comenzando en 1,
                // por eso aqui tengo que restar una unidad al indice
                es_primo[(((2 * k + 1) * (2 * i + 3) - 3) / 2) - 1] = false;
                k += 1;
            }
        }
        i += 1;
    }

    let mut res = vec![2, 3];
    res.extend(es_primo.iter().enumerate().filter_map(|(n, primo)| {
        // Lo mismo, los indices en este lenguaje comienzan en 0, por eso a n
        // le sumo 1
        primo.then_some::<u128>((2 * (n + 1) + 3).try_into().unwrap())
    }));

    res
}

fn main() {
    // Algunas pruebas de es_primo, si algun valor es invalido el programa
    // termina con estado de error
    assert!(es_primo(3));
    assert!(!es_primo(4));
    assert!(es_primo(5));
    assert!(es_primo(7));
    assert!(!es_primo(21));
    assert!(!es_primo(38));

    // Obtenemos exitosamente los primos hasta 40
    println!("{:?}", criba(40));
}
