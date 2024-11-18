// fn main() {
//     // let x = Box::new(10);
//     // let y = x.clone();
//     // println!("x:{}, y:{}", *x, *y);
//
//     // Wrong! El error entiendo que fue presentado debido a que tenemos una referencia inmutable first que apunta al primer elemento de nuestro v
//     // Ese vec v, luego se le pushea un valor. Pudiendo hacer esto, ya que v es mutable. Lo que esta mal, es que la referencia first, es inmutable.
//     // Debido a esto, se rompe ya que luego quiere utilizarse ese valor.
//     let mut v = vec![1, 2, 3];
//     v.push(4);
//     let first = &v[0];
//     println!("{first}");
//     // println!("{:?}", v)
// }


fn main(){
    if let Some(result) = divide(10.0, 0.0){
        println!("{}", result);
    }
    else{
        println!("You can't divide by zero!");
    }

    // Other form
    // let result = divide(10.0, 0.0);
    // match result {
    //     Some(result) => println!("{}", result),
    //     None => println!("You can't divide by zero")
    // }
}

fn divide(a: f64, b: f64) -> Option<f64> {
    if b == 0.0 { None } else { Some(a/b) }
}

