module Ciphers where

import Data.List
import Data.Char

isShiftable :: Char -> Bool
isShiftable char = isUpper char || isLower char

caseShift :: Char -> Int
caseShift char
  | isUpper char = -65
  | isLower char = -97
  | otherwise    = 0

caseUnshift :: Char -> Int
caseUnshift char
  | isUpper char = 65
  | isLower char = 97
  | otherwise    = 0

encode :: Char -> Int
encode char = (ord char) + caseShift char

decode :: Char -> Int -> Char
decode char int = chr $ caseUnshift char + int

shift :: (a -> Int -> Int) -> a -> Char -> Char
shift f keyCharValue char
  | isShiftable char = decode char $ flip mod 26 $ f keyCharValue $ encode char
  | otherwise = char

vigenere keyWord message = cipher 0 message -- set counter to track key index over message
      where cipher _ [] = [] --base case
            cipher count (x:xs) 
              | isShiftable x           = shift (+) keyCharValue x : cipher (count+1) xs -- adds count when x is a letter
              | otherwise               = x : cipher count xs          -- doesn't alter count when not
              where counter      = mod (count) $ length keyWord       -- 
                    keyCharValue = encode $ keyWord !! counter

unvigenere keyWord message = cipher 0 message -- set counter to track key index over message
      where cipher _ [] = [] --base case
            cipher count (x:xs) 
              | isShiftable x           = shift (flip (-)) keyCharValue x : cipher (count+1) xs -- adds count when x is a letter
              | otherwise               = x : cipher count xs          -- doesn't alter count when not
              where counter      = mod (count) $ length keyWord
                    keyCharValue = encode $ keyWord !! counter