module ZippingExercises where

a = enumFromTo 1 100
b = enumFromTo 'a' 'z'
c = []

myZip :: [a] -> [b] -> [(a, b)]
myZip _ [] = []
myZip [] _ = []
myZip x y = (head x, head y) : myZip (tail x) (tail y)

myZipWith :: (a -> b -> c)
          -> [a] -> [b] -> [c]
myZipWith f _ [] = []
myZipWith f [] _ = []
myZipWith f x y = f (head x) (head y) : (myZipWith f (tail x) (tail y))