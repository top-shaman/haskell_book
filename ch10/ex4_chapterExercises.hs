module Chapter4Exercises where

--Warmup & Review

--1.
stops  = "pbtdkg"
vowels = "aeiou"
nouns = ["foot","chair","toilet","butter","nose"]
verbs = ["kick","fart","look","peek","pop"]

comb :: Eq a => [a] -> [a] -> a -> [(a,a,a)]
comb xs ys z      = takeWhile (\a -> f a == z) $ combine
  where f (a,b,c) = a
        combine   = foldr (\x acc -> foldr (\y bcc -> foldr (\z ccc -> (x,y,z):ccc) bcc xs) acc ys) [] xs

--2.
seekritFunc x =
  div (sum (map length (words x)))
      (length (words x))

-- seekritFunc :: String -> Int ; Characters per String

--3.

seekritFunc' x =
  (/) (fromIntegral $ sum (map length (words x)))
      (fromIntegral $ length (words x))

--Rewriting Functions Using Folds
--1.
myOr :: [Bool] -> Bool
myOr = foldr (||) False

--2.
myAny :: (a -> Bool) -> [a] -> Bool
myAny = \f -> foldr ((||) . f) False

--3.
myElem :: Eq a => a -> [a] -> Bool
myElem = myAny . (==)

--4.
myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

--5.
myMap :: (a -> b) -> [a] -> [b]
myMap = \f -> foldr ((:) . f) []

--6.
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter = \f -> foldr (\a b -> if f a then a : b else b) []

--7.
squish :: [[a]] -> [a]
squish = foldr (++) []

--8.
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap = \f -> foldr ((++) . f) []

--9.
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

--10.
myMaximumBy :: (a -> a -> Ordering)
            -> [a]
            -> a
myMaximumBy = \f xs -> foldr (\a b -> case f a b of
                                        LT -> b
                                        EQ -> b
                                        GT -> a) (last xs) xs

--11.
myMinimumBy :: (a -> a -> Ordering)
            -> [a]
            -> a
myMinimumBy = \f xs -> foldr (\a b -> case f a b of
                                        LT -> a
                                        EQ -> b
                                        GT -> b) (last xs) xs