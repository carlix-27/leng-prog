module Frequencies  (Frequency, frequencyMap, frequencies, insert, insertionSort) where

import Data.Map(Map)
import qualified Data.Map as Map
import Data.Tuple(swap)

type Frequency = (Int, Char)


frequencyMap::(Ord a) => [a] -> Map a Int
frequencyMap [] = Map.empty
frequencyMap (a: as) = frequencyMapAux a as 1

-- En este caso: a es el elemento. as es el resto de la lista, 1 es el contador de ocurrencias
frequencyMapAux::(Ord a) => a -> [a] -> Int -> Map a Int
frequencyMapAux currentElement [] count = Map.singleton currentElement count -- Map.fromList[(currentElement, count)]
frequencyMapAux currentElement (e: as) count
                | currentElement == e =  Map.insert currentElement (count + 1) (frequencyMapAux e as 1) -- Pisa el valor de la clave especificada.
                | otherwise = frequencyMapAux currentElement as count  -- Sigue analizando. Pero desde el current element. Para analizar todos los caracteres del arreglo.

-- Es posible que aca, tengas que usar insert? No lo se. Creo que tu implementacion va encaminada pero falta algo..





insert::(Ord a) => a -> [a] -> [a]
insert x [] = x : []
insert x (y:ys)
    | x <= y = x:y:ys
    | otherwise = y: (insert x ys)

insertionSort :: (Ord a) => [a] -> [a]
insertionSort [] = []
insertionSort [x] = [x]
insertionSort (x: y: ys)
           | y < x = insertionSort(y: (insertionSort(x: ys)))
           | x < y = x: (insertionSort(y:ys))
           | otherwise = insert x (insertionSort (y:ys))


frequencies::String -> [Frequency] -- Es posible usar insert y frequencyMap.
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


