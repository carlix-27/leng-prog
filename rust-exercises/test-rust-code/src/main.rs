

fn main() {
    // let s: &str = "hello";
    // let mut s1: String = s.to_string(); // String::from(s)
    //
    // s1.push_str(", world!");
    // let mut s_mod = s.to_string();
    // s_mod.push_str(", Sophia");
    // println!("s = {s}");
    // println!("s1 = {s1}");
    // println!("s_mod = {s_mod}");
    let s = String::from("hello");
    // let len = calculate_length(&mut s); -> No sirve, s para esto, debe ser mutable.
    let len = calculate_length(&s);
    println!("The length of {} is {}", s, len);
    let s1 = s.as_str();
    let len1 = s1.len();
    println!("The length of {} is {}", s1, len1);
}

// pub fn calculate_length(s: &mut String) -> usize{
//     s.len()
// }
// Para poder ejecutar la funcion esta. s deberia ser mutable. Para poder llamarlo:
// calculate_length(&mut s);


pub fn calculate_length(s: &String) -> usize{
    s.len()
}