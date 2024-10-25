#[derive(Debug, PartialEq)]
pub enum Error {
    EmptyBuffer,
    FullBuffer,
}

pub struct CircularBuffer<T:Clone> {
    buffer: Vec<Option<T>>,
    size: usize,
    next: usize,
}

impl<T:Clone> CircularBuffer<T> {
    pub fn new(size: usize) -> CircularBuffer<T> {
        CircularBuffer {
            buffer: vec![None; size],
            size: 0,
            next: 0,
        }
    }

    // Utilizar el hint de decremento
    pub fn read(&mut self) -> Result<T, Error> {
        let index = (self.next + self.buffer.len() - self.size) % self.buffer.len();
        if let Some(value) = self.buffer[index].take(){ // Tomo el valor del option
            self.size -= 1; // Descremento el size de mi buffer
            return Ok(value)
        }
        Err(Error::EmptyBuffer)
    }

    // Utilizar el hint de incremento
    pub fn write(&mut self, byte: T) -> Result<(), Error> {
        if self.is_full() {
           return Err(Error::FullBuffer)
        }
        self.buffer[self.next] = Some(byte); // Aca agregamos el elemento teniendo en cuenta el next. (siguiente slot).
        self.next = (self.next + 1) % self.buffer.len(); // Hint, para el incremento circular
        self.size += 1;
        Ok(())
    }

    pub fn clear(&mut self) {
        for slot in self.buffer.iter_mut(){
            *slot = None; // modifica el valor para que todos los elementos se anulen.
        }
        self.size = 0;
        self.next = 0;
    }

    pub fn is_empty(&self) -> bool {
        self.size == 0
    }

    pub fn is_full(&self) -> bool {
        self.buffer.capacity() == self.size
    }
}
