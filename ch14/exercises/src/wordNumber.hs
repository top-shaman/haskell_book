module WordNumber where

import Data.List (intersperse)

digits :: Int -> [Int]
digits num = go num [] (0 :: Int)
  where dCount = length $ show num
        go n ns c
          | c == dCount = ns
          | otherwise        = go n ([d] ++ ns) (c + 1) 
              where d        = mod10 $ div n $ powCount c 
                    mod10    = \x -> flip mod 10 x :: Int
                    powCount = \x -> (^) 10 x :: Int


digitToWord :: Int -> String
digitToWord n
  | n == 0 = "zero"
  | n == 1 = "one"
  | n == 2 = "two"
  | n == 3 = "three"
  | n == 4 = "four"
  | n == 5 = "five"
  | n == 6 = "six"
  | n == 7 = "seven"
  | n == 8 = "eight"
  | n == 9 = "nine"
  | otherwise = ""

wordNumber :: Int -> String
wordNumber num = concat $ intersperse "-" $ map digitToWord $ digits num