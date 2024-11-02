fn main() {
    test(2)
}

// Consigna
// Dibuja un esquema simple del Stack y el Heap para el siguiente código.

fn test(a: i32) {
    if a == 0 { return }
    let b = a - 1;
    let c = &b;
    let d = Box::new(*c + 10);

    test(b);
    println!("{a} {b} {c} {d}")
}

// Cuando se invoca con test(2)

// Analisis
/*

a -> Stack
b -> Stack
c -> Stack. Su referencia a b tambien.
d -> D como tal, va al Stack, pero a lo que referencia, va al Heap.

Si analizamos, con test(2), tenemos lo siguiente:
let b = 1;
let c = &b; // Tiene una referencia a una porcion de memoria que contiene el nro 1.
let d = Box::new(*c + 10); // *c -> voy a modificar el valor 1 que referencia c. Pero al ser referencia, no altero el valor de b.
// el box guarda en el heap el valor 11.

Una vez termine la ejecucion del programa, se elimina la referencia en el stack de d. Y por tanto, al ocurrir esto,
tambien se borra la referencia que habia en el heap.

*/
