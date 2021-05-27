module MoreBottom where

{-
1. take 1 $ map (+1) [undefined, 2, 3]
   bottom
2. take 1 $ map (+1) [1, undefined, 3]
   returns a value
3. take 2 $ map (+1) [1, undefined, 3]
   bottom
4. itIsMystery xs = map (\x -> elem x "aeiou") xs
   'itIsMystery' takes a list of 'Char' types and
    returns a list of whether or not that Char is
    a vowel. Its type is [Char] -> [Bool]
5. a) map (^2) [1..10]
      [1,4,9,16,25,36,49,64,81,100]
   b) map minimum [[1..10], [10..20], [20..30]]
      [1,10,20]
   c) map sum [[1..5], [1..5], [1..5]]
      [15, 15, 15]
6. 
-}
import Data.Bool

isThree = map (\x -> bool x (-x) (x == 3)) [1..10]
--check
isThree' = map (\x -> if x == 3 then (-x) else (x)) [1..10]