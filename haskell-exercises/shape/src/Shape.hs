module Shape where

data Point = Point { x::Double, y:: Double} deriving (Eq, Show)

data Circle    = Circle    Point Double deriving (Eq, Show)
data Rectangle = Rectangle Point Point deriving (Eq, Show)


-- A point from a tuple Pair
point::(Double, Double) -> Point
point (a, b) = Point a b

-- The origin
origin::Point
origin = Point 0 0

-- Rectangle from a Tuple where (x0 y0) == origin
rectangle::(Double, Double) -> Rectangle
rectangle (a, b)= Rectangle (origin) (Point a b)

base::Rectangle -> Double -- Si tengo dos puntos y solo me interesa uno. Es posible usar pattern matching. Donde indico que es lo que me interesa de Rectangle.
base (Rectangle _ (Point a _)) = a

height::Rectangle -> Double
height (Rectangle _ (Point _ b)) = b

-- Circle from radius
circle::Double -> Circle
circle a = Circle (origin) (a)

-- Shift Class
class Shift a where -- Suma a con a, y b con b para cada uno de lo que tenemos Point, Rectangle y Circle
   shift::a -> (Double, Double) -> a
   
instance Shift Point where
    shift (Point a b) (c, d) = Point (a+c) (b+d)
  -- shift (point (a, b)) (c, d) = Point (a+c) (b+d) -> Que esta mal aca?

instance Shift Rectangle where
  shift  (Rectangle _ (Point a b)) (c, d) = Rectangle (Point c d) (Point (a+c) (b+d))
   
instance Shift Circle where
  shift (Circle _ (double)) (a, b)  = Circle (Point a b) double

-- Define the Surface class
class Surface a where
     surface :: a -> Double

instance Surface Rectangle where
  surface (Rectangle _ (Point a b)) = a * b
  -- surface rectangle (a, b) = a * b

instance Surface Circle where
  surface (Circle _ r) = pi * r^2
  -- surface circle r = pi * r^2

