module Fraction (Fraction, add, sub, mul, divide, hcf) where

type Fraction = (Int, Int)

-- Implement the `add` Function
-- Para sumarlos, deben tener el mismo denominador.
add :: Fraction -> Fraction -> Fraction -- (Int, Int) -> (Int, Int) -> (Int, Int)
add n d =  -- n es una fraction y d es otra. Son tuplas de la forma (Int, Int)
    nNumerator = getNumerator n     -- nNumerator guarda el numerador de la fraction n
    dNumerator = getNumerator d     -- dNumerator guarda el numerador de la fraction d
    nDenominator = getDenominator n -- nDenominator guarda el denominador de la fraction n.
    dDenominator = getDenominator d -- dDenominator guarda el denominador de la fraction d.
    fraction1Modified = getFraction1Modified nNumerator nDenominator  dDenominator
    fraction2Modified = getFraction2Modified dNumerator dDenominator nDenominator
    | nDenominator != dDenominator = add fraction1Modified fraction2Modified -- Hace la suma con las fracciones modificadas
    | otherwise = Fraction(nNumerator + dNumerator, nDenominator) -- Poner de denominator nDenominator o dDenominator es lo mismo porque en este caso serian iguales.

getFraction1Modified:: Int -> Int -> Int -> Int -- nNumerator, nDenominator, dDenominator  y dNumerator, dDenominator, nDenominator
    let
        newN = nNumerator * dDenominator
        newD = nDenominator * dDenominator
    in Fraction(newN, newD)

getFraction2Modified:: Int -> Int -> Int -> Fraction
    let
        newN = dNumerator * nDenominator
        newD = dDenominator * nDenominator
    in Fraction(newN, newD)


getNumerator:: (Int, Int) -> Int
getNumerator (n, _) = numerator -- Con esto obtengo el numerator de la fraction

getDenominator:: (Int, Int) -> Int
getDenominator (_, d) = denominator -- Con esto la idea es obtener el denominador de la  fraction

    
-- Implement the `sub` Function

sub :: Fraction -> Fraction -> Fraction
sub n d = error "Implement it"

-- Implement the `mul` Function

mul :: Fraction -> Fraction -> Fraction
mul n d =
     nNumerator = getNumerator n
     dNumerator = getNumerator d
     nDenominator = getDenominator n
     dDenominator = getDenominator d
     Fraction (nNumerator*dNumerator, nDenominator*dDenominator)

-- Implement the `divide` Function

divide :: Fraction -> Fraction -> Fraction
divide n d = error "Implement it"

-- Implement the `hcf` Function

hcf :: Int -> Int -> Int
hcf n d = error "Implement it" -- En este caso, tanto n como d, son nros.


    