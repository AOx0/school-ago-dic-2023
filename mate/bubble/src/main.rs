fn sort<T: Ord>(arr: &mut [T]) {
    for i in 0..arr.len() - 1 {
        for j in 0..arr.len() - i - 1 {
            if arr[j] > arr[j + 1] {
                // Si el valor es efectivamente, mayor, los intercambiamos
                // de forma que se vayan acomodando poco a poco
                arr.swap(j, j + 1);
            }
        }
    }
}

fn main() {
    let mut arr = [2, 3, 4, 0, 1];

    sort(&mut arr);

    println!("{arr:?}");
}
