module Lists (member, union, intersection, difference,
              insert, insertionSort,
              binaryToDecimal, toDecimal, toDec, decimal,
              binaryAdd) where
  
import Data.Char(digitToInt)  

member:: Int -> [Int] -> Bool
member _ []      = False -- Si tenes un nro X, pero la lista es vacia, tira false. Caso base
member e (x:xs)  = e == x || member e xs -- (x:xs) es como decir (head:tail) Lo que hacemos en la recursividad es ir cambiando el head.
-- e, en primer instancia se compara con el head que tenes, si no es, va a member y compara con cada elemento de xs.


union:: [Int] -> [Int] -> [Int]
union [] ys     = ys -- Si tenes una lista vacia, y le haces union con ys, directamente devolve ys. Caso base
union (x:xs) ys -- (head:tail) con otro tail.
  | member x ys = union xs ys -- member, usa el head, y lo busca en ys tail. Si el member da true, directamente hace el union. Es decir, x esta en tu ys, directamente ejecuto union para evitar tener elementos repetidos.
  | otherwise   = x : union xs ys -- hace una nueva (head:tail) donde el tail es la union entre la tail de x y el ys.

-- Remove Implementations, from, here on

intersection:: [Int] -> [Int] -> [Int]
intersection [] ys = [] -- Si hacemos una interseccion con tail inicial vacio, directamente va el tail []. Caso Base
intersection (x:xs) ys -- ys es una lista entera, tiene tanto el head, como su tail. Todo en una misma lista
    | member x ys = x : intersection xs ys -- Si es true, salta al intersection, sino, ejecuta el otherwise. Necesariamente hay que analizar todo ys. Por si los elementos estan dispersos en la ys.
    | otherwise = intersection xs ys -- Si x no esta en la lista de ys, sigue analizando con el tail de x, xs.

-- x: intersection xs ys, toma el elemento x. Y sigue analizando el resto de los elementos. X quiere decir que es un elemento que las listas tienen en comun

difference:: [Int] -> [Int] -> [Int]
difference  [] ys = []
difference (x:xs) ys
        | not (member x ys) = x: difference xs ys -- Devuelve el caso en el que los elementos no esten presentes quiere decir que son parte de la difference. 
        | otherwise = difference xs ys -- El elemento x esta en ys, analizo con el resto de los elementos. Para buscar cuales no estan dentro de mi ys.

insert:: Int -> [Int] -> [Int] -- Es posible usar la notacion (x:xs) para poder agregar un elemento.
insert _ [] = _ : [] -- Si la lista esta vacia directamente agrega el valor.

insert x (y:ys)
      | x <= y = x:ys -- Agrega el elemento a la lista -- TODO: Evaluar que pasa con los valores de y.
      | otherwise = insert x ys


-- Casos Base
-- Que pasa si la lista esta vacia? -> Insertas normalmente
-- Que pasa si solo hay un elemento? -> Chequeas si es mayor al elemento a insertar. Lo insertas donde corresponda.
-- Que pasa si el elemento a insertar, ya esta en la lista? -> Chequear donde insertar el elemento.



insertionSort :: [Int] -> [Int]
insertionSort = error "Implement it"

binaryToDecimal :: [Int] -> Int
binaryToDecimal = error "Implement it"
    
toDecimal :: Int -> [Int] -> Int
toDecimal = error "Implement it"
    
toDec::Int -> String -> Int
toDec base s =  = error "Implement it"

-- Same as `toDec` But use a list comprehension

decimal::Int -> String -> Int
decimal  = error "Implement it"

firsts::[a] -> [[a]]
firsts = error "Implement it"

-- Given two String that represents numbers in binary implement the 'binaryAdd' function
-- DO NOT USE a predefined '+' operation

binaryAdd::String -> String -> String
binaryAdd  = error "Implement it"