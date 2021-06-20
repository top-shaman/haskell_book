module AsPatterns where

import Data.Char

-- As-patterns
f :: Show a => (a,b) -> IO (a,b)
f t@(a,_) = do
  print a
  return t

doubleUp :: [a] -> [a]
doubleUp [] = []
doubleUp xs@(x:_) = x : xs

--1.
isSubseqOf :: (Eq a)
           => [a]
           -> [a]
           -> Bool
isSubseqOf [] _ = True
isSubseqOf _ [] = False
isSubseqOf xs@(x:_) (y:ys) = (x == y && isSubseqOf (tail xs) ys) || isSubseqOf xs ys

--2.
capitalizeWords          :: String -> [(String, String)]
capitalizeWords []       = []
capitalizeWords xs@(x:_) = (lowerAll $ split xs, upperFirst $ split xs) : (capitalizeWords $ separator xs)
  where split a          = takeWhile (isLetter) a
        lowerAll (a:as)  = toLower a : lowerAll as
        lowerAll []      = []
        upperFirst a     = (toUpper $ head a) : (tail $ lowerAll a)
        separator a      = drop 1 $ dropWhile (isLetter) a
