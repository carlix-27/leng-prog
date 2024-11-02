fn main() {
    let s: &str = "hello";
    let mut s1: String = s.to_string(); // String::from(s)

    s1.push_str(", world!");
    let mut s_mod = s.to_string();
    s_mod.push_str(", Sophia");
    println!("s = {s}");
    println!("s1 = {s1}");
    println!("s_mod = {s_mod}");
}
