mod trie; // Módulo que maneja la estructura del árbol de Huffman
mod heap_entry; // Módulo para manejar las entradas de la heap

use std::collections::{BinaryHeap, BTreeMap};
use crate::heap_entry::HeapEntry;
use crate::trie::Trie;

#[derive(Debug)]
pub struct HuffmanEncoder(Trie<char>);

impl HuffmanEncoder {
    /// Crea una nueva tabla de codificación a partir del texto proporcionado
    pub fn new(text: &str) -> HuffmanEncoder {
        // Implementa la creación de un mapa de frecuencias
        // y la construcción del trie de Huffman
    }

    /// Comprime el texto proporcionado en un vector de bits
    pub fn compress(&self, text: &str) -> Vec<bool> {
        // Crea una tabla de codificación a partir del trie
        // y utiliza esta tabla para convertir el texto en un vector de bits
    }

    /// Descomprime el vector de bits en un `String`
    pub fn decompress(&self, bits: Vec<bool>) -> String {
        // Implementa la descompresión utilizando el trie de Huffman
    }

    // Funciones auxiliares para implementar la lógica del trie
}
