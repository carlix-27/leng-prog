module Trie  (Trie(..), left, right, find, decode, toList) where

import Bit

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
find [] (Leaf a) = a -- Caso base, donde llega a una hoja. Devuelve el caracter que tiene asociado esa hoja..
find (bit: bits) (Leaf a) = a
find (bit: bits) trie
     | bit == F = find bits (left trie)
     | bit == T = find bits (right trie)


decode::Bits -> Trie Char -> String -- String - [Char]
decode [] _ = [] -- Le ponemos esto para que sepa cuando cortar.
decode bits trie =
          let
            (character, anotherBits) = findDecode bits trie -- Debe analizar el resto de la lista para evitar que tengamos el mismo caracter nuevamente. Pidiendo el tail, devuelve todos los elementos menos el head.

          in character : (decode anotherBits trie) -- Tengo que tener en cuenta que siga analizando la cadena de bits que falta analizar


findDecode::Bits -> Trie a -> (a, Bits) -- Con este metodo lo que hacemos es analizar el resto de los bits que nos quedan pendientes.
findDecode [] (Leaf a) = (a, []) -- Caso base, donde llega a una hoja. Devuelve el caracter que tiene asociado esa hoja.
findDecode bits (Leaf a) = (a, bits)
findDecode (bit: bits) trie
     | bit == F = findDecode bits (left trie)
     | bit == T = findDecode bits (right trie)


toList::Trie a -> [(a, Bits)]
toList (Leaf a) = []
toList trie = travelTrie trie [] -- Te devuelve el caracter que busca. Y los bits que lo representan.

travelTrie:: Trie a -> Bits -> [(a, Bits)] -- Mi idea es tener una lista que vaya almacenando lo que se recorrio en base a si va a un subarbol u otro
travelTrie (Leaf a) bits = [(a, bits)]
travelTrie trie bits = travelTrie (left trie) (bits ++ [F]) ++ travelTrie (right trie) (bits ++ [T]) -- Inicialmente la lista bits va a estar vacia y se va a ir llenando acorde recorre el arbol.







