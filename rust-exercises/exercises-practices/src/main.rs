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

//
// fn main(){
//     if let Some(result) = divide(10.0, 0.0){
//         println!("{}", result);
//     }
//     else{
//         println!("You can't divide by zero!");
//     }
//
//     // Other form
//     // let result = divide(10.0, 0.0);
//     // match result {
//     //     Some(result) => println!("{}", result),
//     //     None => println!("You can't divide by zero")
//     // }
// }
//
// fn divide(a: f64, b: f64) -> Option<f64> {
//     if b == 0.0 { None } else { Some(a/b) }
// }


// fn main() {
//     // {
//     //     let mut n = 100;      // n is mutable
//     //     {
//     //         let pn = &mut n;  // pn contains the mutable reference to n
//     //
//     //         println!("pn = {pn}");
//     //
//     //         *pn = 1000;    // Here I'm modifying n through the reference
//     //         // '*' must be explicit
//     //         println!("pn = {pn}");
//     //     }
//     //     println!("n = {n}")
//     // }
//     //
//     // let mut x = 10;
//     //
//     // let dom = &mut x;
//     // *dom += 1;
//     //
//     // println!("x is {}", x);
//     //
//     // let mut spaces = "";
//     // println!("{}", spaces.len());
//
//
//     // Esto funciona
//     // struct Point {
//     //     x: i32,
//     //     y: i32,
//     // }
//     //
//     // fn main() {
//     //     let p = Point { x: 10, y: 20 };
//     //
//     //     let px = p.x;
//     //     println!("{}", p.y);
//     // }
//
//     // fn length2(s: &String) -> usize {
//     //     s.len()
//     // }
//     //
//     // let s1 = String::from("hello");
//     //
//     // let len = length2(&s1); // <-- Here
//     //
//     // println!("The length of '{s1}' is {len}.");
//
//     // fn first_word2(s: &str) -> &str {
//     //     let bytes = s.as_bytes();
//     //     for (i, &item) in bytes.iter().enumerate() {
//     //         if item == b' ' { return &s[0..i]; }
//     //     }
//     //     &s[..]
//     // }
//     //
//     // let hw = "Hello World".to_string();
//     // println!("{}", first_word2(&hw));
//     //
//     // println!("{}", first_word2("Bye World"));
//
//     // let mut v = vec![0; 5];
//     // let mut n = 0;
//     // for i in &mut v {
//     //     *i = n * n;
//     //     n += 1;
//     // }
//     // println!("{v:?}");
//
//
//     // let mut vx = vec![1, 2, 3, 4];
//     // println!("{:?}", vx.iter_mut().for_each(|x| *x += 100));
//     //
//     // let mut vx = vec![1, 2, 3, 4];
//     // let map = vx.iter_mut().map(|x| *x += 100);
//     // println!("{:?}", map)
//
//
//     // struct Person { name: String }
//     //
//     // struct Account {
//     //     number: i32, owner: Person
//     // }
//     //
//     // {
//     //     let p = Person{name: "John".to_string()};
//     //     let ac1 = Account{number:1 , owner: p.clone()}; // TODO: Aclaracion de Mati!
//     //     let ac2 = Account{number:2 , owner: p.clone()};
//     //     println!("{} & {}", ac1.owner.name, ac2.owner.name)
//     // // }
//     //
//     // fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {
//     //     if x.len() > y.len() { x } else { y }
//     // }
//     //
//     // let string1 = String::from("abcd");
//     // let string2 = "xyz"; // Como no esta especificado el String::from ... Rust lo toma como un &str que es un bloque de memoria que contiene "xyz" (Slice Type).
//     //
//     // let result = longest(&string1, string2);
//     // println!("The longest string is '{}''", result);
//     //
//     // let r;
//     // let x = 5;
//     // r = &x;
//     // println!("r is {}", r);
//     //
//     // let x = 5;
//     // let r = &x;
//     // println!("r is {}", r);
//     //
//     // let x = 5;
//     // let r = x.clone();
//     // println!("r is {}", r);
//     //
//     // let x = Box::new(5);
//     // let y = &x; // let y = x.clone();
//     // println!("{}, {}", x, y);
//     //
//     //
//     // let s = String::from("hello");
//     // let mut s1 = s;
//     // s1.push_str(" world!");
//     // println!("{s1}");
//     // println!("Success!");
//
//     let x = Box::new(5);
//     let mut y = x.clone();
//     *y = 4;
//     assert_eq!(*x, 5);
//     println!("Success!");
//
//
//     // let mut x = Box::new(5);
//     // let y = &mut x;
//     // *y = Box::new(4);
//     // assert_eq!(*x, 4);
//     //
//     // println!("Success!");
//
//     let string1 = String::from("abcd");
//
//     {
//         let string2 = String::from("xyz");
//         let result = longest(string1.as_str(), string2.as_str());
//         println!("The longest string is {}", result);
//     }
//
//     fn longest<'a>(x: &'a str, y: &'a str) -> &'a str{
//         if x.len() > y.len() {x} else {y}
//     }
//
// }

// // Don't modify code in main!
// fn main() {
//     let s1 = String::from("Hello world");
//     let s2 = take_ownership(s1);
//
//     println!("{}", s2);
// }
//
// // Only modify the code below!
// fn take_ownership(s: String) -> String {
//     // println!("{}", s); podria estar. Pero no es necesario!
//     s
// }

//

//
//
// fn main() {
//     let s = give_ownership();
//     println!("{}", s);
// }
//
// // Only modify the code below!
// fn give_ownership() -> String {
//     let s = String::from("Hello world");
//     // Convert String to Vec
//     let _s = s.as_bytes();
//     s
// }
//
// // Fix the error without removing any code
// fn main() {
//     let s = String::from("Hello World");
//
//     print_str(&s);
//
//     println!("{}", s);
// }
//
// fn print_str(s: &String)  {
//     println!("{}",s)
// }
//
// Don't use clone ,use copy instead
// fn main() {
//     let x = (1, 2, (), "hello".to_string());
//     let y = &x;
//     println!("{:?}, {:?}", x, y);
// }
//
//
// // Mutability
//
// // make the necessary variable mutable
// fn main() {
//     let s = String::from("Hello ");
//
//     let s1 = s;
//
//     s1.push_str("World!");
//
//     println!("Success!");
// }
//
//
//
fn main() {
    let x = Box::new(5);

    let mut y = x.clone();      // update this line, don't change other lines!

    *y = 4;

    assert_eq!(*x, 5);

    println!("Success!");
}