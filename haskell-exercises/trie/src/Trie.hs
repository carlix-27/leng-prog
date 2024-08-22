module Trie  (Trie(..), left, right, find, decode, toList) where

import Bit
  
data Trie a =  Leaf Char | Trie a :-: Trie a deriving(Eq, Show) -- Add the Type definition deriving (Eq, Show)

-- A :-: B
-- Las hojas (Leaf) son los caracteres. Por como funciona, solo tenemos datos en las hojas de este arbol.
-- Trie :-: Trie es como deberian estructurarse.

buildTrie:: Trie a -> Trie a -> Trie a
buildTrie a b = a :-: b

left::Trie a -> Trie a
left (nodeLeft :-: _) = nodeLeft -- Te da el nodo izquierdo (contiene la informacion)

-- Como se manejaria el caso del error?
-- left ('' :-:_) = error "Left of: Leaf" -- Maneja el error si analiza un nodo left que ya es un leaf. Condicion de corte del analisis.

right::Trie a -> Trie a
right (_ :-: nodeRight) = nodeRight
  
find::Bits -> Trie a -> a
find = error "Define it"

decode::Bits -> Trie Char -> String
decode = error "Define it"

toList::Trie a -> [(a, Bits)]
toList = error "Define it"
