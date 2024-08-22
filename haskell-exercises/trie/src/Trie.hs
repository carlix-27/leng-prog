module Trie  (Trie(..), left, right, find, decode, toList) where

import Bit

data Trie a =  Leaf a | Trie a :-: Trie a deriving(Eq, Show) -- Add the Type definition deriving (Eq, Show)

-- A :-: B
-- Las hojas (Leaf) son los datos. Por como funciona, solo tenemos datos en las hojas de este arbol.
-- Trie :-: Trie es como deberian estructurarse.

buildTrie:: Trie a -> Trie a -> Trie a
buildTrie a b = a :-: b

left::Trie a -> Trie a
left (nodeLeft :-: _) = nodeLeft -- Te da el nodo izquierdo (contiene la informacion)
left (Leaf a :-: _) = error "left of Leaf" -- Maneja el error si analiza un nodo left de un node que ya es un leaf. Condicion de corte del analisis.


right::Trie a -> Trie a
right (_ :-: nodeRight) = nodeRight
right (_ :-: Leaf a) = error "right of Leaf"


find::Bits -> Trie a -> a
find [] (Leaf a) = a -- Caso base, donde llega a una hoja. Devuelve el caracter que tiene asociado esa hoja.
find (bit: bits) trie
     | bit == F = find bits (left trie)
     | bit == T = find bits (right trie)


charAt:: Bit -> Char -- El bit es F o es T. La transformacion numerica de esa cadena, la puedo hacer segun 0 o 1. Y ese conjunto de numbers. Pasarlo al number correspondiente. Y luego al char.
chatAt bit =
       where
         listOfN = []
         | bit == F = 0: listOfN
         | bit == T = 1: listOfN
         number = bitsToInt listOfN
         chr(number)

bitsToInt:: [Int] -> Int -- Teorema fundamental de la numeracion para pasar la representacion binaria en un nro.
bitsToInt list = foldl(\acc bit -> acc * 2 + bit) 0 -- Chequea bien como hace esto. acc que es? Un acumulador que pasamos inicialmente en 0. Y vamos sumando el valor entero del bit.


decode::Bits -> Trie Char -> String
decode = error "Define it"

toList::Trie a -> [(a, Bits)]
toList = error "Define it"
