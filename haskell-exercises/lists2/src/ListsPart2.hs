module ListsPart2 (Bit(..), bitAt, charToBits, bits, queens) where

import Data.Char(ord)  
import Data.Bits(testBit)
  
data Bit = F | T  deriving (Eq, Show, Enum, Read)
type Bits = [Bit]

bitAt :: Int -> Char -> Bit
bitAt n c = if testBit (ord c) (7-n) then T else F -- Con el testBit chequea que este activado o no. T-> 1; F -> 0

-- ord c -> 'A' -> 65 -> '01000001' -> F T F F F F F T

charToBits :: Char -> Bits -- Bits = [Bit]
charToBits c = [bitAt n c | n <- [0 .. 7]]


bits:: String -> Bits -- String -> [Char]
bits s = foldr (++) [] (map charToBits s) -- Concatena las listas que genera map. En base a la operacion ++ con una lista inicial vacia


type Solution = [Int]

queens:: Int -> [Solution]
queens = error "Implement It"

-- Solucion
-- queens:: Int -> [[Int]]
-- queens n = placeQueens n where
-- placeQueens 0 = [[]]
-- placeQueens k = [ x : y | y <- placeQueens (k-1), x <- [1 .. n], isSafe x y 1]
-- isSafe _ [] _ = True
-- isSafe x (y:ys) n = x /= y && x/= y + n && isSafe x ys (n + 1)