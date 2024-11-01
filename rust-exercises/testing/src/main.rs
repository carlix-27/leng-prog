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
        height: f64,
        canvas_shapes: Vec<(Point, Box<dyn Shape>)> // Puedo poner esto extra para ir almacenando los Shapes que contiene mi canvas.
    }

    struct Point {
        pub x: f64,
        pub y: f64
    }

    struct Circle {
        radius: f64
    }

    struct Rectangle {
        width: f64,
        height: f64
    }



    impl Canvas {
        pub fn new(width: f64, height:f64) -> Self{
            Canvas {
                width,
                height,
                canvas_shapes: Vec::new() // Puedo declarar esto aca, mas alla de que no este como parametro, es como cuando haces en python ponele list = [] solo existe, no esta como parametro necesariamente.
            }
        }


        // En este metodo hay que validar que shape no se salga del canvas
        pub fn add(&mut self, place: Point, shape: Box<dyn Shape>){
            self.canvas_shapes.push((place, shape));
        }
        pub fn sum_areas(&self) -> f64{
            self.canvas_shapes.iter().map(|_, s| s.area()).sum() // dentro de canvas_shapes tenemos Point, Box<dyn Shape>. A nosotros, solo nos interesa el Shape.
        }

        // Cambia la posicion de los Shapes dentro del canvas
        // Se debe validar que no se mueva ningun Shape fuera (tambien parcialmente) del area del canvas
        // En cuyo caso se retorna 'false' y se invalida toda la operacion

        pub fn shift_all(&mut self, shift_x: f64, shift_y: f64) -> bool { // shift_x tiene que ver con el ancho (base) (width), shift_y tiene que ver con altura (height)
            // Validar que no se mueva ningun Shape fuera del area del canvas -> Aca si algo sale mal, va false.
            // Valido en base a pensar que dentro del self.width y self.heigth, y tambien dentro de 0.0 en x, y 0.0 en y.
            for (c, s) in self.canvas_shapes{
                let (Point{x: low_x, y: low_y}, Point{x: top_x, y:top_y}) = s.container_box(&c); // Toma los puntos que tiene declarado nuestro shape, y los guarda en esos puntos de low y top.
                if low_x < 0.0 || low_y < 0.0 || top_x > self.width || top_y > self.height { // Chequea que no se pase de las dimensiones de nuestro Canvas. Chequeando los valores de los puntos que tiene nuestra Shape.
                    return false
                }
            }

            // Caso exitoso
            for (c, _) in self.canvas_shapes{
                let Point{ x, y } = c;
                *c = Point{x: *x + shift_x, y: *y + shift_y}; // Modifico el valor de x e y por eso debo poner el *. Debo ponerlo explicitamente porque lo estoy modificando a traves de la referencia al punto.
                return true
            }
        }
    }


    pub trait Shape {
        fn area(&self) -> f64;

        // Dada una posicion para el centro, retornar los puntos inferior izquierdo
        // y superior derecho de un box que contenga el shape.
        fn container_box(&self, center: &Point) -> (Point, Point);
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

}



