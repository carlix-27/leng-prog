module Trie  (Trie(..), left, right, find, decode, toList) where

import Bit
import Data.Char(chr)

data Trie a =  Leaf a | Trie a :-: Trie a deriving(Eq, Show) -- Add the Type definition deriving (Eq, Show)


-- A :-: B
-- Las hojas (Leaf) son los datos. Por como funciona, solo tenemos datos en las hojas de este arbol.
-- Trie :-: Trie es como deberian estructurarse.

buildTrie:: Trie a -> Trie a -> Trie a
buildTrie a b = a :-: b

left::Trie a -> Trie a
left (nodeLeft :-: _) = nodeLeft -- Te da el nodo izquierdo (contiene la informacion). Puede tener hijos, como no.
left (Leaf a :-: _) = Leaf a
-- left (Leaf a :-: _) = error "left of Leaf" -- Maneja el error si analiza un nodo left de un node que ya es un leaf. Condicion de corte del analisis.


right::Trie a -> Trie a
right (_ :-: nodeRight) = nodeRight
right ( _ :-: Leaf a) = Leaf a
-- right (_ :-: Leaf a) = error "right of Leaf"


find::Bits -> Trie a -> a
find [] (Leaf a) = a -- Caso base, donde llega a una hoja. Devuelve el caracter que tiene asociado esa hoja.
-- find _ (Leaf a) = a --error "This element not exist in this Binary Trie"-- Caso donde se pida algo que no existe en el arbol.
find (bit: bits) trie
     | bit == F = find bits (left trie)
     | bit == T = find bits (right trie)



-- Como resulta decode, si lo encaro por este lado?
charAt:: Bit -> Char -- El bit es F o es T. La transformacion numerica de esa cadena, la puedo hacer segun 0 o 1. Y ese conjunto de numbers. Pasarlo al number correspondiente. Y luego al char.
charAt bit =
       let listOfN = case bit of
                   F -> [0]
                   T -> [1]
       in chr (bitsToInt listOfN) -- Pasa el numero hallado a caracter.

bitsToInt:: [Int] -> Int -- Teorema fundamental de la numeracion para pasar la representacion binaria en un nro.
bitsToInt list = bitsToIntAux list (length(list) - 1)

bitsToIntAux :: [Int] -> Int -> Int
bitsToIntAux [] _ = 0
bitsToIntAux (n:ls) c =  n * 2^c  +  bitsToIntAux (ls) (c - 1)

-- bitsToInt list = foldl (\acc bit -> acc * 2 + bit) 0 -- Chequea bien como hace esto. acc que es? Un acumulador que pasamos inicialmente en 0. Y vamos sumando el valor entero del bit. CG


decode::Bits -> Trie Char -> String -- String - [Char]
decode [] _ = [] -- Le ponemos esto para que sepa cuando cortar.
decode bits trie =
          let
            character = find bits trie
            anotherBits = tail bits -- Debe analizar el resto de la lista para evitar que tengamos el mismo caracter nuevamente. Pidiendo el tail, devuelve todos los elementos menos el head.

          in character : (decode anotherBits trie) -- Tengo que tener en cuenta que siga analizando la cadena de bits que falta analizar




toList::Trie a -> [(a, Bits)]
toList = error "Define it"
