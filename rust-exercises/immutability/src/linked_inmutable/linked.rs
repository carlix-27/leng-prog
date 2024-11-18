// 1. Lista Enlazada Inmutable
// Implementa una lista enlazada inmutable en Rust, similar al Stack, pero que permita agregar elementos
// al final de la lista en lugar de al principio.
// La lista debe ser inmutable, es decir, cada vez que añades un elemento,
// se genera una nueva lista que contiene el elemento nuevo, manteniendo los anteriores sin cambios.
//
// Crea una estructura ImmutableList<T>.
// Implementa los métodos new, append, len (para devolver la longitud de la lista) y to_vec (para convertir la lista a un vector Vec<T>).
// Asegúrate de que append devuelve una nueva lista sin modificar la original.
// Ejemplo de uso:
//
fn main(){
    let list = ImmutableList::new();
    let list1 = list.append(1);
    let list2 = list1.append(2);
    assert_eq!(list.len(), 0);
    assert_eq!(list1.len(), 1);
    assert_eq!(list2.to_vec(), vec![1, 2]);
}

#[derive(Debug)]
struct LinkedList<T>(Option<Rc<Node<T>>>);

