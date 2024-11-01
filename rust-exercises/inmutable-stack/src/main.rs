fn main() {
    let stack = Stack::new();

    let stack1 = stack.push(1);
    let stack2 = stack1.push(2);


    if let Some((&item, stack3)) = stack2.pop() {
        println!("Popped item: {}", item);
        println!("Stack 3: {stack3:?}");
    }
    println!("Stack: {stack:?}");
    println!("Stack1: {stack1:?}");
    println!("Stack 2: {stack2:?}");
}

// Deberia imprimir:
// Popped item: 2
// Stack 3: Stack(Some(Node(1, Stack(None))))
// Stack: Stack(None)
// Stack1: Stack(Some(Node(1, Stack(None))))
// Stack 2: Stack(Some(Node(2, Stack(Some(Node(1, Stack(None)))))))


// Consigna:
// Tienes que implementar una pila inmutable. Es decir, una pila que, cuando se le aplica una operación,
// devuelve una nueva pila sin modificar la original.

#[derive(Debug)]
struct Stack<T>(Option<..complete..>);

impl<T> Clone for Stack<T> {
    fn clone(&self) -> Self { todo!(); }
}

#[derive(Debug)]
struct Node<T>(T, Stack<T>);

impl<T> Stack<T> {
    fn new() -> Self { todo!() } // An empty Stack

    fn push(&self, value: T) -> Self {
        Stack(Some(todo!()))
    }

    fn peek(&self) -> Option<&T> { todo!() }

    /// Si la pila está vacía, devuelve None
    /// de lo contrario, devuelve Some(tuple), donde el tuple contiene una referencia al valor
    /// en la cima de la pila junto con la Stack modificada
    fn pop(&self) -> Option<(&T, Stack<T>)> {
        todo!()
    }

    fn is_empty(&self) -> bool {
        todo!()
    }
}
