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
bits (c: cs) = map (foldr (charToBits c))  cs

type Solution = [Int]

queens:: Int -> [Solution]
queens = error "Implement It"