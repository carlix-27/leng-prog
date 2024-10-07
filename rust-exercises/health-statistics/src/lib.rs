pub struct User {
    name: String,
    age: u32,
    weight: f32,
}

impl User {

    // Returns a new instance of User
    pub fn new(name: &str, age: u32, weight: f32) -> Self {
        User{
            name: String::from(name),
            age,
            weight
        }
    }

    pub fn name(&self) -> &str {
        self.name.as_str() // Throw a &str from String. In doc: 'Extracts a string slice containing the entire String'.
    }

    pub fn age(&self) -> u32 {
        self.age
    }

    pub fn weight(&self) -> f32 {
        self.weight
    }

    pub fn set_age(&mut self, new_age: u32) { // Self is mutable -> (age -> new_age) with the same instance of User. Bob now, be 33 years old.
        self.age = new_age
    }

    pub fn set_weight(&mut self, new_weight: f32) {
        self.weight = new_weight
    }
}
