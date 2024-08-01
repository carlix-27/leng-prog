module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n = collatzAux n 0 -- Arranca con los steps en 0.

collatzAux:: Integer -> Integer -> Maybe Integer
collatzAux n steps
      | n <= 0 = Nothing    -- No puede hacer nada. Tiene error aca.
      | n == 1 = Just steps -- El just corta si el n == 1 que es la condicion de corte para Collatz. Y por tanto devuelvo los steps.
      | checkParity n == 0 = collatzAux (n `div` 2) (stepsCounter steps) -- Dividis a por 2 y aumentas en el paso. Luego volves a usar es nro y chequeas collatz con ese.
      | otherwise = collatzAux (3*n + 1) (stepsCounter steps)            -- Trabajas con el nro par como esta, y aumento el paso.


checkParity:: Integer -> Integer -- Si es 0 es par, si es 1 es impar
checkParity n
        | (n `mod` 2 == 0) = 0 -- El nro es par
        | otherwise = 1        -- El nro es impar


stepsCounter:: Integer -> Integer
stepsCounter steps = steps + 1

-- Reglas:
-- Si el nro es par, divide por 2.
-- Si el nro es impar, hace 3*n + 1. Eventualmente, con cualquier nro que arranque, siempre voy a terminar en 1.

-- Deberia chequear si el nro es par, o impar, e ir haciendo las reglas acorde a los resultados que obtengo.
-- Debe tener en cuenta los nros de pasos que hiciste hasta llegar a 1.
