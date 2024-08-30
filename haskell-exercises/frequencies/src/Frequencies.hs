module Frequencies  (Frequency, frequencyMap, frequencies, insert, insertionSort) where

import Data.Map(Map)
import qualified Data.Map as Map
import Data.Tuple(swap)

type Frequency = (Int, Char)

frequencies::String -> [Frequency]
frequencies [] = []
frequencies (c:cs) = frequenciesAux c cs 1

frequenciesAux:: Char -> String -> Int -> [Frequency] -- TODO. Hay algo mal en la combinacion de las listas.
frequenciesAux currentChar [] count = [(count, currentChar)]
frequenciesAux currentChar (c: cs) count
            | currentChar == c = frequenciesAux currentChar cs (count + 1)
            | currentChar /= c = (count, currentChar) : frequenciesAux c cs 1 -- Con esta logica, manejo que cambie el currentChar.

frequencyMap::(Ord a) => [a] -> Map a Int
frequencyMap = error "Implement it"

insert::(Ord a) => a -> [a] -> [a]
insert = error "Implement it"

insertionSort :: (Ord a) => [a] -> [a]
insertionSort = error "Implement it"