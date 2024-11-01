// use std::collections::HashMap;
//
// fn main() {
//     let mut scores = HashMap::new();
//     scores.insert("Sunface", 98);
//     scores.insert("Daniel", 95);
//     scores.insert("Ashley", 69); // Debe ser del mismo tipo.
//     scores.insert("Katie", 58);
//
//     if let Some(score) = scores.get("Sunface"){
//         println!("{score}");
//     }
//     match scores.get("Sunface") {
//         Some(score) => println!("{score}"),
//         None => println!("Not found")
//     }
//
//     if scores.contains_key("Daniel"){
//         let score = scores["Daniel"];
//         assert_eq!(score, 95);
//         scores.remove("Daniel");
//     }
//
//     assert_eq!(scores.len(), 3);
//
//     for (name, score) in scores{
//         println!("The score of {} is {}", name, score);
//     }
// }

fn main() {
    struct Canvas{
        width: f64,
        height: f64
    }

    struct Point {
        x: f64,
        y: f64
    }

    struct Circle {
        radius: f64
    }

    struct Rectangle {
        width: f64,
        height: f64
    }

    // Implements shape for Shapes. (circle, rectangle)

    impl Shape for Circle {
        fn area(&self) -> f64 {
            3.14 * self.radius * self.radius
        }

        fn container_box(&self, center: &Point) -> (Point, Point) {
            (Point{x: center.x + self.radius, y: center.y + self.radius},
             Point{x: center.x - self.radius, y: center.y - self.radius})
        }
    }

    impl Shape for Rectangle {
        fn area(&self) -> f64 {
            self.width * self.height
        }

        fn container_box(&self, center: &Point) -> (Point, Point) {
            (Point{x: center.x + self.width/2.0, y: center.y + self.height/2.0},
             Point{x: center.x - self.width/2.0, y: center.y + self.height/2.0})
        }
    }


    let mut canvas_shapes: Vec<Box<dyn Shape>> = vec![Box::new(Circle{radius}), Box::new(Rectangle{width, height})];

    impl Canvas {
        pub fn new(width: f64, height:f64) -> Self{
            Canvas {
                width,
                height
            }
        }


        // En este metodo hay que validar que shape no se salga del canvas

        pub fn add(&mut self, place: Point, shape: Box<dyn Shape>){
            if(shape.area() < self.width * self.height) {
                shape.container_box(&place);
                canvas_shapes.push(shape);
            }
        }


        pub fn sum_areas(&self) -> f64{
            canvas_shapes.iter_mut().map(|x| x.area()).sum()
        }


        // Cambia la posicion de los Shapes dentro del canvas
        // Se debe validar que no se mueva ningun Shape fuera (tambien parcialmente) del area del canvas
        // En cuyo caso se retorna 'false' y se invalida toda la operacion

        pub fn shift_all(&mut self, shift_x: f64, shift_y: f64) -> bool {
            todo!()
        }
    }

    pub trait Shape {
        fn area(&self) -> f64;

        // Dada una posicion para el centro, retornar los puntos inferior izquierdo
        // y superior derecho de un box que contenga el shape.
        fn container_box(&self, center: &Point) -> (Point, Point);
    }

}



