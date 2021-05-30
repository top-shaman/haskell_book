module ZippingExercises where

a = enumFromTo 1 100
b = enumFromTo 'a' 'z'
c = []

myZip :: [a] -> [b] -> [(a, b)]
myZip _ [] = []
myZip [] _ = []
myZip (x:xs) (y:ys) = (x, y) : myZip xs ys

myZipWith :: (a -> b -> c)
          -> [a] -> [b] -> [c]
myZipWith f _ [] = []
myZipWith f [] _ = []
myZipWith f (x:xs) (y:ys) = f x y : (myZipWith f xs ys)