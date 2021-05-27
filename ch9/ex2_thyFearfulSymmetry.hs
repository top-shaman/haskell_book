module ThyFearfulSymmetry where

import Data.List

--1. take spaces out of a string, return list of strings separated by ' '
spaceOut :: String -> [String]
spaceOut a
  | (takeWhile (/=' ') a) == a = [a] -- ends recursion 
  | otherwise = if head a == ' ' -- checks if current index is a space
                then spaceOut $ tail a -- drops space from final list
                else taker a : (spaceOut $ dropper a)
      where taker   = \x -> takeWhile (/=' ') x
            dropper = \x -> tail $ dropWhile (/=' ') x

--2. separate a string with '\n', return list of strings separated by '\n'
firstSen = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful\
\ symmetry?"
sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen

myLines :: String -> [String]
myLines a
  | (takeWhile (/='\n') a) == a = [a] -- ends recursion
  | otherwise = if head a == '\n' -- checks if current index is a '\n'
                then myLines $ tail a -- drops '\n' from final list
                else taker a : (myLines $ dropper a)
        where taker   = \x -> takeWhile (/='\n') x
              dropper = \x -> tail $ dropWhile (/='\n') x

shouldEqual =
  [ "Tyger Tyger, burning bright"
  , "In the forests of the night"
  , "What immortal hand or eye"
  , "Could frame thy fearful symmetry?"
  ]

main :: IO ()
main =
  print $
  "Are they equal? "
  ++ show (myLines sentences
           == shouldEqual)

--3. parameterize previous functions

separator :: Char -> String -> [String]
separator c a -- takes in character to separate (c), and string to separate (a)
  | (takeWhile (/=c) a) == a = [a] -- ends recursion
  | otherwise = if head a == c -- checks if current index is a '\n'
                then separator c $ tail a -- drops '\n' from final list
                else taker a : (separator c $ dropper a)
        where taker   = \x -> takeWhile (/=c) x
              dropper = \x -> tail $ dropWhile (/=c) x