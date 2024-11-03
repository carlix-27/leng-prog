mod trie; // Módulo que maneja la estructura del árbol de Huffman
mod heap_entry; // Módulo para manejar las entradas de la heap

use std::collections::{BinaryHeap, BTreeMap};
use crate::heap_entry::HeapEntry;
use crate::trie::Trie;
use crate::trie::Trie::Leaf;
use crate::trie::Trie::Node;
//
// Crea un nuevo tipo (un struct con solo un campo)
// en lugar de exponer el `Trie` al usuario.
// Los métodos `compress` y `decompress` se usan como métodos de miembro del nuevo tipo
//


#[derive(Debug)]
pub struct HuffmanEncoder(Trie<char>);

impl HuffmanEncoder {
    ///
    /// `new` crea una tabla de codificación basada en la tasa de
    /// ocurrencia de caracteres en la cadena proporcionada
    ///

    // Crea una nueva tabla de codificación a partir del texto proporcionado
    // Implementa la creación de un mapa de frecuencias
    // y la construcción del trie de Huffman
    pub fn new(text: &str) -> HuffmanEncoder {
        let freq_map = frequency_map(text);
        let mut heap = frequency_heap(freq_map);
        let huffman_trie = huffman_trie(&mut heap);
        HuffmanEncoder(huffman_trie)
    }

    // Comprime el texto proporcionado en un vector de bits
    // Crea una tabla de codificación a partir del trie
    // y utiliza esta tabla para convertir el texto en un vector de bits

    pub fn compress(&self, text: &str) -> Vec<bool> {
        let mut table = BTreeMap::new();

        create_encode_table(&self.0,vec![], &mut table);

        let mut result = vec![];
        for chr in text.chars() {
            match table.get(&chr) {
                None => { println!("Character '{chr}' not present in the encode table") }
                Some(code) => { code.iter().for_each(|e| result.push(*e)) }
            }
        }
        result
    }

    // Descomprime el vector de bits en un `String`
    // Implementa la descompresión utilizando el trie de Huffman

    pub fn decompress(&self, bits: Vec<bool>) -> String {
        let mut result = String::new();
        self.do_decompress(&self.0, &bits, &mut result);
        result
    }

    /// Internal private function to handle the recursion
    fn do_decompress(&self, current: &Trie<char>, bits: &[bool], result: &mut String) {
        match current {
            Leaf(chr) => {
                result.push(*chr);
                if bits.len() > 0 {
                    self.do_decompress(&self.0, bits, result);
                }
            }
            Node(left, right) => {
                self.do_decompress(
                    if bits[0] { right } else { left },
                    &bits[1..],
                    result);
            }
        }
    }
}



// Given a text creates a map based on the frequency of occurrences of each character in the input

/// Dado un texto, crea un mapa basado en la frecuencia de ocurrencias de cada carácter en la entrada


fn frequency_map(text: &str) -> BTreeMap<char, u64> {
    let mut result = BTreeMap::new();
    for chr in text.chars() {
        let v = result.entry(chr).or_default();
        *v += 1;
    }
    result
}


///
/// Given a map with each character and the number of occurrences,
/// creates a Heap to keep them sorted by frequency
///
fn frequency_heap(fm: BTreeMap<char, u64>) -> BinaryHeap<HeapEntry> {
    fm.iter()
        .map(|(chr, count)| HeapEntry::new(*count, *chr))
        .collect()
}

///
/// Creates the Huffman trie, given the Heap of letters ordered by frequency
///
fn huffman_trie(heap: &mut BinaryHeap<HeapEntry>) -> Trie<char> {
    while heap.len() >= 2 {
        let e1 = heap.pop().unwrap();
        let e2 = heap.pop().unwrap();
        heap.push(e1.combine(e2));
    }
    heap.pop().unwrap().trie()
}

///
/// Given the Trie, creates a Map to speed up the translation
///
fn create_encode_table(trie: &Trie<char>, bits: Vec<bool>, map: &mut BTreeMap<char, Vec<bool>>) {
    fn add(bits: &Vec<bool>, value: bool) -> Vec<bool> {
        let mut left_bits = bits.clone();
        left_bits.push(value);
        left_bits
    }

    match trie {
        Leaf(chr) => {
            map.insert(*chr, bits);
        }
        Node(left, right) => {
            create_encode_table(left, add(&bits, false), map);
            create_encode_table(right, add(&bits, true), map);
        }
    }
}




// Tests for the private functions of this module
#[test]
fn check_frequency_map() {
    let fm = frequency_map("Hello");
    assert_eq!(BTreeMap::from([('l', 2), ('o', 1), ('H', 1), ('e', 1)]), fm);
}

#[test]
fn check_frequency_heap() {
    let fm = frequency_map("   abc  ");
    let t = frequency_heap(fm);

    assert_eq!("[HeapEntry(1, Leaf('b')), HeapEntry(1, Leaf('a')), HeapEntry(5, Leaf(' ')), HeapEntry(1, Leaf('c'))]",
               format!("{t:?}"));
}

#[test]
fn check_huffman_trie() {
    let fm = frequency_map("   abc  ");
    let mut t = frequency_heap(fm);
    let hf = huffman_trie(&mut t);

    assert_eq!("Node(Node(Leaf('c'), Node(Leaf('b'), Leaf('a'))), Leaf(' '))",
               format!("{hf:?}"));
}
