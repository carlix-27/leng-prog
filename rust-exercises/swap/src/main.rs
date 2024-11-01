// Escribir la funcion swap, que intercambia los valores entre dos variables, Por ejemplo:


fn main() {
    let mut x = 100;
    let mut y = 200;
    swap(&mut x, &mut y);
    println!("x= {x}, y= {y}")
}

// Deberia imprimir
// x= 200, y= 100

pub fn swap(x: &mut i32, y: &mut i32){
    let tmp = *x; // Guardo x
    *x = *y;           // Cambia x a y.
    *y = tmp           // Cambia y a x.
}