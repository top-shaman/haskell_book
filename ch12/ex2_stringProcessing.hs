module StringProcessing where

import Data.Char

notThe :: String -> Maybe String
notThe xs
  | lowerAll xs == "the" = Nothing
  | otherwise            = Just xs
  where lowerAll x = foldr (\a -> (:) $ toLower a) "" x

--1.
replaceThe :: String -> String
replaceThe [] = []
replaceThe xs@(x:_)
  | (notThe $ take 3 xs) == Nothing =
    case length xs > 3 of
      True  -> if not $ isLetter $ xs !! 3
               then 'a' : (replaceThe $ drop 3 xs)
               else x : (replaceThe $ drop 1 xs)
      False -> 'a' : (replaceThe $ drop 3 xs)
  | otherwise = x : (replaceThe $ drop 1 xs)
  
--2.
countTheBeforeVowel :: String -> Integer
countTheBeforeVowel xs = theFollowedBy 0 (split xs)
  where split [] = []
        split xs = matched : (split $ dropWhile (not . isLetter) rest)
          where (matched, rest) = span isLetter xs
        theFollowedBy count []           = count 
        theFollowedBy count (x:xs)
          | (notThe x) == Nothing && (isVowel $ head $ head $ xs) = theFollowedBy (count+1) xs
          | otherwise = theFollowedBy count xs
              where isVowel = flip elem "aeiou"

--3.
countVowels :: String -> Integer
countVowels xs = count 0 xs
  where count c []     = c
        count c (x:xs)
          | elem x "aeiou" = count (c+1) xs
          | otherwise = count c xs

-- with foldr
countVowels' :: String -> Integer
countVowels' xs = foldr (\a b -> if elem a "aeiou" then b+1 else b) 0 xs