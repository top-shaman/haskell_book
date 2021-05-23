module Chapter8Exercises where

import Data.List (intersperse)

--Review of types
--1. d
--2. b
--3. d
--4. b

--Reviewing currying
cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

flippy = flip cattyConny

appedCatty = cattyConny "woops"
frappe = flippy "haha"

--1. "woops mrow woohoo!"
--2. "1 mrow haha"
--3. "woops mrow 2 mrow haha"
--4. "woops mrow blue mrow haha"
--5. "pink mrow haha mrow green mrow woops mrow blue"
--6. "are mrow Pugs mrow awesome"

--Recursion
--1. dividedBy 15 2
--   15 < 2 == False
--   go (15 - 2) 2 (0 + 1)
--   13 < 2 == False
--   go (13 - 2) 2 (1 + 1)
--   11 < 2 == False
--   go (11 - 2) 2 (2 + 1)
--   9 < 2 == False
--   go (9 - 2) 2 (3 + 1)
--   7 < 2 == False
--   go (7 - 2) 2 (4 + 1)
--   5 < 2 == False
--   go (5 - 2) 2 (5 + 1)
--   3 < 2 == False
--   go (3 - 2) 2 (6 + 1)
--   1 < 2 == True
--   (7, 1)

--2.
addTo :: (Eq a, Num a) => a -> a
addTo num = go num 0 0
  where go n sum count
         | n == count = sum + count
         | otherwise =
             go n (sum + count) (count + 1)

--3.
multiplyBy :: (Integral a) => a -> a -> a
multiplyBy num1 num2 = go num1 num2 0 0
  where go n1 n2 count sum
         | n2 == count = sum
         | otherwise =
             go n1 n2 (count + 1) (sum + n1)


--Fixing DividedBy

data DividedResult a = Result a | DividedByZero deriving Show

dividedBy :: Integral a => a -> a -> DividedResult a
dividedBy num denom
  | denom == 0                  = DividedByZero
  | signum num == signum denom  = Result r
  | otherwise                   = Result (-r)
  where
    r = go (abs num) (abs denom) 0
    go n d count
      | n < d     = count
      | otherwise = go (n - d) d (count + 1)

--McCarthy 91 function

mc91 :: Integral a => a -> a
mc91 n
  | n > 100 = n - 10
  | otherwise = mc91 (mc91 (n + 11))

--Numbers into words
--isolate digit of a particular place
 
{- -- what I did at first-- copied the original digit
  -- finding algorithm from earlier in the chapter
  -- it seemed excessive so I tried to optimize the code

digit :: Integral a => a -> a -> a
digit num place = digit
  where nLast = num `div` place
        digit   = nLast `mod` 10

digitCount :: Int -> Int
digitCount = length . show

whichDigit :: Integral a => a -> Int
whichDigit = \x -> (^) 10 x

digits :: Int -> [Int]
digits num = go num [] (digitCount num - 1)
  where go n ns c
          | c == 0 = ns ++ [d]
          | otherwise = go n (ns ++ [d]) (c - 1)
              where d = digit n $ whichDigit c
-}

digits :: Int -> [Int]
digits num = go num [] (0 :: Int)
  where dCount = length $ show num -- finds length of input, to be used for count limit
        go n ns c
          | c == dCount = ns -- checks to see if count matches limit
          | otherwise        = go n ([d] ++ ns) (c + 1) -- keeps number value, prepends new digit to list, increments count
              where d        = mod10 $ div n $ powCount c -- takes 'n' and 'c' values, determines divisor by place of digit to power of ten, modulos whichever digit is left in first position after
                    mod10    = \x -> flip mod 10 x :: Int -- input modulo 10, which should be num (n)
                    powCount = \x -> (^) 10 x :: Int -- outputs 10 to the power of input, which should be count (c)
 -- success! 9 lines instead of 14.


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