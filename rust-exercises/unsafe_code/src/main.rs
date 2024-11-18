use std::mem;
fn main() {
    let mut x = 42;
    let old_value = mem::replace(&mut x, 99);

    println!("Old value: {}", old_value);
    println!("New value: {}", x);
}
