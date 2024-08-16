module Lists (member, union, intersection, difference,
              insert, insertionSort, firsts,
              binaryToDecimal, toDecimal, toDec, decimal,
              binaryAdd, merge) where
  
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
insert x [] = x : [] -- Si la lista esta vacia directamente agrega el valor. Esto puede ocurrir tambien, si el elemento es mas grande que todo el resto.

insert x (y:ys)
      | x <= y = x:y:ys -- Agrega el elemento a la lista, tiene en cuenta el valor de y porque asi almacena el duplicado. DUPLICADOS. Tiene en cuenta el valor inicial de y, para evitar perder valores ya analizados.
      | otherwise = y: (insert x ys) -- Tiene en cuenta el valor inicial de y, para evitar perder los valores ya analizados.


-- Casos Base
-- Que pasa si la lista esta vacia? -> Insertas normalmente
-- Que pasa si solo hay un elemento? -> Chequeas si es mayor al elemento a insertar. Lo insertas donde corresponda.
-- Que pasa si el elemento a insertar, ya esta en la lista? -> Chequear donde insertar el elemento.


-- TODO
insertionSort :: [Int] -> [Int]
insertionSort [] = []
insertionSort x = x
insertionSort (x:[]) = [x]
insertionSort (x: y: z: ys) -- FIXME: Es probable que el insertionSort primero, este de mas.
             | z >= x && y >= x = x: y: z: insertionSort(ys) -- Chequeo que contemple que las sublistas formadas esten ordenadas. Por como esta diseñado, van a ordenarse y con z. Para ese momento.
             | y < x = insertionSort(y : insertionSort (x: z: ys)) -- Esto sortea. Tenes que ver esta condicion tambien.
             | y > x = insertionSort(x : insertionSort(y: z: ys)) -- Esto sortea acorde a si un elemento es mas grande. Aca hay un drama.
             | otherwise = x: y: z: ys -- Caso donde se llego al final del array.

-- Z no mas sirve para ver si los elementos de las sublistas estan ordenadas.
-- Anotaciones
-- Primero Sorteas para ordenar todos elementos de la lista
    -- Como sorteamos?
        --1. Analizamos el elemento que tenemos a la izquierda, si es mayor -> swap, si es menor, esta ordenado.
        --2. Asi con cada elemento que tenemos en la lista.
-- Luego insertas tranquilamente, usando el metodo insert que desarrolle arriba.

-- TODO: Implementar insertionSort con 'foldr'

binaryToDecimal :: [Int] -> Int
binaryToDecimal = error "Implement it"
    
toDecimal :: Int -> [Int] -> Int
toDecimal = error "Implement it"
    
toDec::Int -> String -> Int
toDec base s =   error "Implement it"

-- Same as `toDec` But use a list comprehension

decimal::Int -> String -> Int
decimal  = error "Implement it"

firsts::[a] -> [[a]]
firsts = error "Implement it"

-- Given two String that represents numbers in binary implement the 'binaryAdd' function
-- DO NOT USE a predefined '+' operation

binaryAdd::String -> String -> String
binaryAdd  = error "Implement it"

merge:: (Ord a) => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
    | x < y = x: merge xs (y:ys)
    | x == y = x : y : merge xs ys -- Chequeo donde las listas sean iguales.
    | otherwise = y: merge (x:xs) ys