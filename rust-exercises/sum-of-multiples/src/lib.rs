
// Tip: ver las funciones de listas que van a ayudar bastante para este ejercicio.

pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    let vec = 0.. limit;
    let total: u32 = vec.filter(|i| take_multiplies(&i, factors)).sum(); // Me trae un vector nuevo porque es inmutable.
    total
}

pub fn take_multiplies(i: &u32, factors: &[u32]) -> bool {
    // check multiplies with factors elements. Me quedo con los elementos que cumplan. filter, si cumple se queda.
    factors.iter().any(|&v| v != 0 && i % v == 0) // v es cada valor del factors porque hace la iteracion ahi.
    // Primero chequea la primer condicion, y luego la condicion de i
    // Recordemos que por como funciona and, con que uno no pase, ya es suficiente.
}

// factors.iter().any(|&v| i % v == 0 && v != 0 ) // v es cada valor del factors porque hace la iteracion ahi.
// Asi rompe porque en primer instancia hace la division con v, y no puedo hacer eso porque tu v es 0.

// analizando los tests, vemos que si pasamos como factor 0, i esta valiendo 0 tambien, por como hace el chequeo
// devuelve false mi any, y por tanto solo tipo el valor que quedo de i, que es 0.

// Al tener una lista vacia, el any devuelve false.


// Aclaraciones
// borrowing evita problemas de ownership.
// En el caso del Rc podes tener multiples referencias, sin la necesidad de perder ownership debido al uso del reference counted.