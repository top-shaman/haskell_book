module Chapter9Exercises where

import Data.Char
import Data.List

filterUpper :: String -> String
filterUpper a = filter (\x -> isUpper x) a

upperFirst :: String -> String
upperFirst a = (toUpper $ head a) : tail a

upperAll :: String -> String
upperAll [] = []
upperAll a = (toUpper $ head a) : (upperAll $ tail a)

returnUpperFirst :: String -> Char
returnUpperFirst a = toUpper $ head a

returnUpperFirst' = \x -> toUpper . head $ x
returnUpperFirst'' = toUpper . head

caesar :: Int -> String -> String
caesar _ [] = []
caesar shift (x:xs)
  | isUpper x = shifter 65 : caesar shift xs
  | otherwise = shifter 97 : caesar shift xs
  where shifter a = chr $ (+a) $ flip mod 26 $ (+) shift $ (+) (-a) $ ord x
-- isolates first letter of word, converts it to Int, subtracts ascii value to get raw value, shifts it by desired value, modulos it by 26, returns it to proper ASCII value (a) and converts it back to a char

unCaesar :: Int -> String -> String
unCaesar _ [] = []
unCaesar shift (x:xs)
  | isUpper x = shifter 65 : unCaesar shift (tail xs)
  | otherwise = shifter 97 : unCaesar shift (tail xs)
  where shifter a = chr $ (+a) $ flip mod 26 $ (+) (-shift) $ (+) (-a) $ ord x
-- does same as caesar's shifter except negates 'shift' value

myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = x || myOr xs

myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny f (x:xs) = f x || myAny f xs

myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem x (y:ys) = x == y || myElem x ys

myReverse :: [a] -> [a]
myReverse [] = []
myReverse a = last a : myReverse (init a)

v = [[1,2,3,4,5,6],[7,8,9],[10,11,12],[13,14,15,16,17,18,19],[20]]

squish :: [[a]] -> [a]
squish (x : []) = x
squish (x : x1 : []) = x ++ x1
squish (x:xs) = squish $ (x ++ head xs) : tail xs

--alternatively
squish' :: [[a]] -> [a]
squish' [] = []
squish' (x:xs) = prepend x $ squish' xs
  where prepend [] rest = rest
        prepend (x:xs) rest = x : prepend xs rest

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f (x:xs) = prepend (f x) $ squishMap f xs
  where prepend [] rest = rest
        prepend (x:xs) rest = x : prepend xs rest

squishAgain :: [[a]] -> [a]
squishAgain a = squishMap id a

myMaximumBy :: (a -> a -> Ordering)
            -> [a] -> a
myMaximumBy _ (x:[]) = x
myMaximumBy f (x:xs) =
  let y = myMaximumBy f xs in
    case f x y of
      LT -> y
      EQ -> x
      GT -> x

myMinimumBy :: (a -> a -> Ordering)
            -> [a] -> a
myMinimumBy _ (x:[]) = x
myMinimumBy f (x:xs) =
  let y = myMinimumBy f xs in
    case f x y of
      LT -> x
      EQ -> x
      GT -> y

myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare



myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare