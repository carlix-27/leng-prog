fn main() {
    println!("Hello, world!");
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
