# Inmutabilidad

Aquí tienes algunos ejercicios en Rust, de dificultad similar, que te ayudarán a practicar la implementación de estructuras inmutables y el manejo de referencias en Rust. Los ejercicios se centran en el manejo de estructuras inmutables, contenedores y el uso de `Option` y `Rc`.

### 1. **Lista Enlazada Inmutable**

Implementa una **lista enlazada inmutable** en Rust, similar al `Stack`, pero que permita agregar elementos al final de la lista en lugar de al principio. La lista debe ser inmutable, es decir, cada vez que añades un elemento, se genera una nueva lista que contiene el elemento nuevo, manteniendo los anteriores sin cambios.

- Crea una estructura `ImmutableList<T>`.
- Implementa los métodos `new`, `append`, `len` (para devolver la longitud de la lista) y `to_vec` (para convertir la lista a un vector `Vec<T>`).
- Asegúrate de que `append` devuelve una nueva lista sin modificar la original.

**Ejemplo de uso**:

   ```rust
   let list = ImmutableList::new();
   let list1 = list.append(1);
   let list2 = list1.append(2);
   assert_eq!(list.len(), 0);
   assert_eq!(list1.len(), 1);
   assert_eq!(list2.to_vec(), vec![1, 2]);
   ```

### 2. **Árbol Binario Inmutable**

Implementa un **árbol binario inmutable** en Rust. El árbol debe permitir insertar elementos y hacer búsquedas, sin modificar el árbol original. Cada vez que insertas un nuevo valor, debes crear un nuevo árbol que contenga el valor adicional y mantenga los elementos previos.

- Define una estructura `BinaryTree<T>`, que use nodos y referencias contadas (`Rc`) para construir un árbol binario inmutable.
- Implementa los métodos `new`, `insert`, y `contains`.
- `insert` debe devolver un nuevo árbol que incluye el valor, manteniendo el árbol original inalterado.

**Ejemplo de uso**:

   ```rust
   let tree = BinaryTree::new();
   let tree1 = tree.insert(5);
   let tree2 = tree1.insert(3);
   assert!(!tree.contains(3));
   assert!(tree2.contains(5));
   assert!(tree2.contains(3));
   ```

### 3. **Conjunto (Set) Inmutable**

Crea un **conjunto inmutable** de números en Rust, similar a un `HashSet`, pero sin modificar el conjunto original al agregar o quitar elementos. En lugar de modificarse, el conjunto debe devolver una nueva versión.

- Implementa la estructura `ImmutableSet` con operaciones como `add`, `remove`, `contains`, y `len`.
- Usa una estructura de datos eficiente, como un árbol o una lista enlazada, para implementar el conjunto.
- Los métodos `add` y `remove` deben devolver un nuevo conjunto sin cambiar el conjunto original.

**Ejemplo de uso**:

   ```rust
   let set = ImmutableSet::new();
   let set1 = set.add(10);
   let set2 = set1.add(20);
   assert_eq!(set.contains(10), false);
   assert_eq!(set1.contains(10), true);
   assert_eq!(set2.len(), 2);
   ```

### 4. **Cola Inmutable (Queue)**

Implementa una **cola inmutable** en Rust que funcione con los métodos `enqueue` (agregar al final) y `dequeue` (quitar del frente), devolviendo una nueva versión de la cola después de cada operación.

- Define una estructura `ImmutableQueue<T>`.
- Implementa los métodos `new`, `enqueue`, `dequeue`, y `peek` (que devuelve el elemento en el frente sin quitarlo).
- `enqueue` debe devolver una nueva cola con el elemento añadido al final, mientras que `dequeue` debe devolver una tupla con el elemento removido y la nueva cola.

**Ejemplo de uso**:

   ```rust
   let queue = ImmutableQueue::new();
   let queue1 = queue.enqueue(1);
   let queue2 = queue1.enqueue(2);
   let (front, queue3) = queue2.dequeue().unwrap();
   assert_eq!(front, 1);
   assert_eq!(queue3.peek(), Some(&2));
   ```

### 5. **Grafo Inmutable**

Implementa un **grafo inmutable** en Rust donde los nodos representen puntos y las aristas conexiones inmutables entre estos puntos. Cada vez que se agrega un nodo o una conexión, debe generarse una nueva versión del grafo.

- Define una estructura `ImmutableGraph<T>` para representar el grafo.
- Implementa los métodos `new`, `add_node`, `add_edge`, y `neighbors` (devuelve los nodos adyacentes a un nodo dado).
- `add_node` y `add_edge` deben devolver nuevas versiones del grafo que incluyen el cambio.

**Ejemplo de uso**:

   ```rust
   let graph = ImmutableGraph::new();
   let graph1 = graph.add_node(1);
   let graph2 = graph1.add_node(2);
   let graph3 = graph2.add_edge(1, 2);
   assert!(graph1.neighbors(1).is_empty());
   assert_eq!(graph3.neighbors(1), vec![2]);
   ```

Estos ejercicios te ayudarán a practicar el diseño de estructuras de datos inmutables, el uso de `Rc` para referencias contadas y las abstracciones necesarias en Rust. Cada uno de estos conceptos es útil para crear estructuras eficientes y seguras en un contexto funcional y sin mutabilidad. ¡Espero que los encuentres útiles!
