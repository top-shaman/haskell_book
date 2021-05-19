--1. If otherwise is the top-most guard, every argument passed will return the same result
--2. It will still type check, but it won't work the same way, because the logic isn't the same
--3.
pal xs
    | xs == reverse xs = True
    | otherwise       = False
  --b)
--4. pal can take [a] arguments of type class Eq a
--5) pal :: Eq a => [a] -> Bool
--6)
numbers x
    | x < 0  = -1
    | x == 0 = 0
    | x > 0  = 1
  --c)
--7) numbers can take Num arguments
--8) numbers :: (Ord a, Num a, Num p) => a -> p