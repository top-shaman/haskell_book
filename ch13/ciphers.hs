module Ciphers where

import Control.Monad (forever)
import Data.List
import Data.Char
import System.IO     (BufferMode(NoBuffering),
                      hSetBuffering,
                      stdout)

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

caesar :: Int -> String -> String
caesar _ [] = []
caesar shift (x:xs)
  | isUpper x = shifter 65 : caesar shift xs
  | otherwise = shifter 97 : caesar shift xs
  where shifter a = chr $ (+a) $ flip mod 26 $ (+) shift $ (+) (-a) $ ord x

main :: IO ()
main = forever $ do
  hSetBuffering stdout NoBuffering
  putStrLn "Please enter a word to cipher: "
  word <- getLine
  putStrLn "Caesar or Vigenere?"
  whichCipher <- getLine
  case toLower $ head whichCipher of
    'c'  -> do
              putStrLn "How many characters should be shifted?"
              s <- getLine
              putStr "Coded word:"
              putStrLn $ caesar (read s :: Int) word ++ "\n"
    'v'  -> do
              putStrLn "Please enter key"
              key <- getLine
              putStr "Coded word:"
              putStrLn $ vigenere key word ++ "\n"
    _    -> do putStrLn "unable to read input\n"