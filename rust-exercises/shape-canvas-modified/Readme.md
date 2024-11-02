# Más ejercicios!

La implementacion que tenes que hacer aca, en basicamente perfeccionar
un poco mas Shape. Agregando los siguientes metodos y cuestiones

Siguiendo lo siguiente:


### Ejercicio 1: Añadir más formas
**Consigna:** Extiende tu implementación para incluir un nuevo tipo de forma: un triángulo. Define una estructura `Triangle` que contenga la base y la altura, y implementa el trait `Shape` para calcular su área y el `container_box`.

**Estructura sugerida:**
```rust
struct Triangle {
    base: f64,
    height: f64,
}

// Implementa el trait Shape para Triangle
impl Shape for Triangle {
    fn area(&self) -> f64 {
        // Implementa el cálculo del área
    }

    fn container_box(&self, center: &Point) -> (Point, Point) {
        // Calcula y retorna los puntos del contenedor
    }
}
```

### Ejercicio 2: Eliminar formas
**Consigna:** Implementa un método `remove` en la estructura `Canvas` que permita eliminar una forma en una posición específica (basada en el índice). Asegúrate de que el método maneje correctamente la validación de índices.

**Estructura sugerida:**
```rust
impl Canvas {
    pub fn remove(&mut self, index: usize) -> Result<(), &'static str> {
        // Verifica si el índice es válido y elimina la forma
    }
}
```

### Ejercicio 3: Mover formas individuales
**Consigna:** Modifica tu método `shift_all` para que pueda mover formas individuales en lugar de todas a la vez. Crea un método `shift_shape` que acepte el índice de la forma a mover y los valores de desplazamiento.

**Estructura sugerida:**
```rust
impl Canvas {
    pub fn shift_shape(&mut self, index: usize, shift_x: f64, shift_y: f64) -> bool {
        // Mueve la forma en el índice especificado y verifica que no salga del canvas
    }
}
```

### Ejercicio 4: Contar formas
**Consigna:** Añade un método `count_shapes` a la estructura `Canvas` que devuelva la cantidad de formas que contiene.

**Estructura sugerida:**
```rust
impl Canvas {
    pub fn count_shapes(&self) -> usize {
        // Retorna el número de shapes en canvas_shapes
    }
}
```

### Ejercicio 5: Intersección de formas
**Consigna:** Implementa un método `intersects` en el trait `Shape` que determine si dos formas se intersectan. Este método debe ser genérico y aceptar cualquier forma que implemente el trait `Shape`.

**Estructura sugerida:**
```rust
pub trait Shape {
    // Otros métodos existentes...

    fn intersects(&self, other: &dyn Shape, center_self: &Point, center_other: &Point) -> bool;
}
```

### Ejercicio 6: Comparar áreas
**Consigna:** Crea un método `compare_areas` en `Canvas` que compare las áreas de dos formas y retorne cuál es más grande. Utiliza la función de área que ya has implementado.

**Estructura sugerida:**
```rust
impl Canvas {
    pub fn compare_areas(&self, index1: usize, index2: usize) -> Option<&str> {
        // Compara las áreas de las formas en los índices proporcionados
    }
}
```

Estas consignas te ayudarán a explorar más conceptos de Rust, como manejo de errores, generics y la implementación de traits. 
Cada ejercicio puede ser resuelto de manera independiente, así que siéntete libre de abordarlos en el orden que prefieras