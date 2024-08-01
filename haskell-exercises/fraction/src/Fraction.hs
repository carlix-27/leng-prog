module Fraction (Fraction, add, sub, mul, divide, hcf) where

type Fraction = (Int, Int)

-- Implement the `add` Function
-- Para sumarlos, deben tener el mismo denominador.

add :: Fraction -> Fraction -> Fraction -- (Int, Int) -> (Int, Int) -> (Int, Int)
add n d -- n es una fraction y d es otra. Son tuplas de la forma (Int, Int)
      | getDenominator n /= getDenominator d =
        let
            f1 = getFraction1Modified n (getDenominator d)
            f2 = getFraction2Modified d (getDenominator n)
        in add f1 f2                                                    -- Hace la suma con las fracciones modificadas
      | otherwise = (getNumerator n + getNumerator d, getDenominator n) -- Poner de denominator nDenominator o dDenominator es lo mismo porque en este caso serian iguales.


getFraction1Modified:: Fraction -> Int -> Fraction -- nNumerator, nDenominator, dDenominator  y dNumerator, dDenominator, nDenominator
getFraction1Modified (nF1, dF1) dF2 = (nF1 * dF2, dF1 * dF2)


getFraction2Modified:: Fraction -> Int -> Fraction
getFraction2Modified (nF2, dF2) dF1 = (nF2 * dF1, dF2 * dF1)

getNumerator:: Fraction -> Int
getNumerator (n, _) = n -- Con esto obtengo el numerator de la fraction

getDenominator:: Fraction -> Int
getDenominator (_, d) = d -- Con esto la idea es obtener el denominador de la  fraction

    
-- Implement the `sub` Function
-- Similar a la suma, tambien deben tener el mismo denominador para poder restarse.

sub :: Fraction -> Fraction -> Fraction
sub n d
    | getDenominator n /= getDenominator d =
      let
        f1 = getFraction1Modified n (getDenominator d)
        f2 = getFraction2Modified d (getDenominator n)
      in sub f1 f2
    | otherwise = (getNumerator n - getNumerator d, getDenominator n)


-- Implement the `mul` Function

mul :: Fraction -> Fraction -> Fraction
mul n d = (getNumerator n * getNumerator d, getDenominator n * getDenominator d)

-- Implement the `divide` Function

divide :: Fraction -> Fraction -> Fraction
divide n d = mul n (inverted d)

inverted:: Fraction -> Fraction
inverted d = (getDenominator d, getNumerator d) -- Armo la fraccion invertida. Formo denominador/numerador

-- Implement the `hcf` Function


-- En lugar de meternos a descomponer por nros primos. Una forma facil de sacarlo, es mediante el Algoritmo de Euclides.

hcf :: Int -> Int -> Int
hcf n 0 = n
hcf 0 d = d
hcf n d = hcf d (n `mod` d) -- Por como funciona, debe hallar el resto, para ello mod es el resto de la division entre n y d.

-- checkIfNumberIsPrime:: Int -> Bool
-- checkIfNumberIsPrime number =

-- findPrimeNumbers :: Int -> [Int] -- De 24, tenemos los siguientes nros primos [2, 2, 2, 3]
-- findPrimerNumbers number =




    