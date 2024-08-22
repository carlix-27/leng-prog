module Lists (member, union, intersection, difference,
              insert, insertionSort, firsts,
              binaryToDecimal, toDecimal, toDec, decimal,
              binaryAdd, merge) where
  
import Data.Char(digitToInt)  -- En el caso de toDec, va a servir pasa para cada caracter al entero que representa.

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
--insert:: Int -> [Int] -> [Int]
--insert x [] = x : []
--
--insert x (y:ys)
--      | x <= y = x:y:ys .
--      | otherwise = y: (insert x ys)

insertionSort:: [Int] -> [Int] -- Mi forma de resolverlo - Quiza es poco optima. La solucion de chat, fue mas optima.. Debido a que el insert que implemente esta bien pensado
insertionSort [] = []
insertionSort [x] = [x]  -- Lista con un solo elemento
insertionSort (x: y: ys)
            | y < x = insertionSort(y: (insertionSort(x:ys)))
            | x < y = x: (insertionSort(y: ys))
            | otherwise = insert x (insertionSort (y:ys)) -- Insert solventa los casos donde sean iguales los valores.

---- insertionSort utilizando la función insert  - Chat gpt
--insertionSort :: [Int] -> [Int]
--insertionSort [] = []
--insertionSort (x:xs) = insert x (insertionSort xs)


-- Anotaciones
-- Primero Sorteas para ordenar todos elementos de la lista
    -- Como sorteamos?
        --1. Analizamos el elemento que tenemos a la izquierda, si es mayor -> swap, si es menor, esta ordenado.
        --2. Asi con cada elemento que tenemos en la lista.
-- Luego insertas tranquilamente, usando el metodo insert que desarrolle arriba.

-- TODO: Implementar insertionSort con 'foldr'

binaryToDecimal :: [Int] -> Int
binaryToDecimal list = binaryToDecimalAux list (length(list) - 1)

binaryToDecimalAux :: [Int] -> Int -> Int
binaryToDecimalAux [] _ = 0
binaryToDecimalAux (n:ls) c =  n * 2^c  +  binaryToDecimalAux (ls) (c - 1)



    
toDecimal :: Int -> [Int] -> Int
toDecimal _ [] = 0
toDecimal b ls = toDecimalAux b ls (length(ls) - 1)

toDecimalAux:: Int -> [Int] -> Int -> Int -- Para solventar el error de pattern matching debe haber un caso base aca. Para que sepa cuando cortar
toDecimalAux _ [] _ = 0
toDecimalAux b (n:ls) c = n*b^c + toDecimalAux b ls (c-1)
    
toDec::Int -> String -> Int -- S puede ser considerada una lista de char String === [Char]
toDec base s =
  let
    listInt = intMap s
  in
    toDecimal base listInt



-- Un string, puede ser considerado, una lista de caracteres. Tenemos basicamente "73" -> ['7', '3']

-- Tengo que pasar cada caracter al nro que verdaderamente representa

intMap:: [Char] -> [Int]
intMap listC = map (\c -> digitToInt c) listC -- Funcion map, va de lista a lista.
--    [Char] =            [Int]

-- c es cada caracter de la lista de caracteres (listC)

-- map f [x] -> [y]
-- f, es una funcion. Y [x] es una lista de n elementos de cualquier tipo. [y] es una lista del tipo especificado

-- Same as `toDec` But use a list comprehension

decimal:: Int -> String -> Int -- Como usamos la funcion zip aca? Y lo de list comprehension lo usamos en intMapComprenhension
decimal base s = toDecimal base (intMapComprehension s)

intMapComprehension:: [Char] -> [Int]
intMapComprehension listC = [digitToInt c | c <- listC]

firsts::[a] -> [[a]]
firsts x = [take n x | n <- [1 .. length(x)]] -- take toma ciertos nros y te devuelve una lista de estos, de una lista que le especifiquemos.

-- Given two String that represents numbers in binary implement the 'binaryAdd' function
-- DO NOT USE a predefined '+' operation

binaryAdd::String -> String -> String
binaryAdd a b = foldr (++) " " addBit a b

addBit:: String -> String -> String


binaryAddAux:: String -> String -> String -> String
binaryAdd '' '' = '0'
binaryAddAux (a: as) (b: bs) r
        | a === '0' && b === '0' = '0': r
        | a === '1' && b === '0' || a === '0' && b === '1' = '1':r
        | a === '1' && b === '1' = '0': r                    -- Caso borde donde hay acarreo.
        binaryAddAux as bs r
-- funcion aux, que recibe el acarreo actual y las dos listas -> Acarreo nuevo, el caracter que le falta para sumar.

merge:: (Ord a) => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
    | x < y = x: merge xs (y:ys)
    | x == y = x : y : merge xs ys -- Chequeo donde las listas sean iguales.
    | otherwise = y: merge (x:xs) ys