use nalgebra::Vector3;

/// Si el valor _x_ es mayor al máximo del rango _r_ devuelve 1., en caso de ser menor devuelve 0., si se encuentra en el rango
/// entonces se devuelve un valor del 0. al 1. indicando qué tanto pertenece al rango si se toma como una escala, donde pertenecer
/// en la parte baja de la escala lo hace menos candidato a pertenecer que estár en la parte alta de la escala
#[inline]
fn vdif(x: f64, r: std::ops::Range<f64>) -> f64 {
    1. * f64::from(x > r.end) + (x - r.start) / (r.end - r.start) * f64::from(r.contains(&x))
}

fn control_difuso(t: f64, h: f64) -> f64 {
    let k_temperaturas: Vector3<_> = [0.0..15., 15.0..25., 25.0..30.].map(|r| vdif(t, r)).into();
    let reglas_difusas: Vector3<_> = [0.0..40., 40.0..60., 60.0..100.].map(|r| vdif(h, r)).into();

    println!("{:?}", k_temperaturas);
    println!("{:?}", reglas_difusas);

    reglas_difusas.dot(&k_temperaturas)
}

fn main() {
    println!("{}", control_difuso(100., 10.));
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn less() {
        assert_eq!(vdif(-1., 0.0..10.), 0.);
    }

    #[test]
    fn more() {
        assert_eq!(vdif(11., 0.0..10.), 1.);
    }

    #[test]
    fn midl() {
        let res = vdif(5., 0.0..10.);
        assert!(res > 0. && res < 1.);
    }
}
