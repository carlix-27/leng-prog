module Frequencies  (Frequency, frequencyMap, frequencies, insert, insertionSort) where

import Data.Map(Map)
import qualified Data.Map as Map
import Data.Tuple(swap) -- Siempre estuvo?

type Frequency = (Int, Char)


frequencyMap::(Ord a) => [a] -> Map a Int
frequencyMap = error "Implement it"

insert::(Ord a) => a -> [a] -> [a]
insert = error "Implement it"

insertionSort :: (Ord a) => [a] -> [a]
insertionSort = error "Implement it"


frequencies::String -> [Frequency]
frequencies [] = []
frequencies (c:cs) = checkValues(frequenciesAux c cs 1)

frequenciesAux:: Char -> String -> Int -> [Frequency] -- TODO. Hay algo mal en la combinacion de las listas.
frequenciesAux currentChar [] count = [(count, currentChar)]
frequenciesAux currentChar (c: cs) count
            | currentChar == c = frequenciesAux currentChar cs (count + 1)
            | currentChar /= c = (count, currentChar) : frequenciesAux c cs 1 -- Con esta logica, manejo que cambie el currentChar.

checkValues:: [Frequency] -> [Frequency] -- TODO: La logica no es correcta, llegamos al mismo resultado. Por como esta hecha la comparacion.
checkValues [] = []
checkValues (tuple: []) = [tuple]
checkValues (tuple: tuple2: rest)
          | snd tuple == snd tuple2 = ((fst tuple + fst tuple2), snd tuple): checkValues (tuple2: rest)
          | otherwise = tuple : checkValues (tuple2: rest)


