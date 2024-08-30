module Trie  (Trie(..), left, right, find, decode, toList) where

import Bit
  
data Trie a = Leaf a
            | Trie a :-: Trie a deriving (Eq, Show, Ord)

-- Bring definition from previous TP

left::Trie a -> Trie a
left (nodeLeft :-: _) = nodeLeft
left (Leaf a :-: _) = Leaf a

right::Trie a -> Trie a
right (_ :-: nodeRight) = nodeRight
right ( _ :-: Leaf a) = Leaf a
  
find::Bits -> Trie a -> a
find [] (Leaf a) = a
find (bit: bits) (Leaf a) = a
find (bit: bits) trie
     | bit == F = find bits (left trie)
     | bit == T = find bits (right trie)

decode::Bits -> Trie Char -> String
decode [] _ = []
decode bits trie =
          let
            (character, anotherBits) = findDecode bits trie

          in character : (decode anotherBits trie)


findDecode::Bits -> Trie a -> (a, Bits)
findDecode [] (Leaf a) = (a, [])
findDecode bits (Leaf a) = (a, bits)
findDecode (bit: bits) trie
     | bit == F = findDecode bits (left trie)
     | bit == T = findDecode bits (right trie)

toList::Trie a -> [(a, Bits)]
toList (Leaf a) = []
toList trie = travelTrie trie []

travelTrie:: Trie a -> Bits -> [(a, Bits)]
travelTrie (Leaf a) bits = [(a, bits)]
travelTrie trie bits = travelTrie (left trie) (bits ++ [F]) ++ travelTrie (right trie) (bits ++ [T])

