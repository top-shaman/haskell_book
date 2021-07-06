module Palindrome where

import Control.Monad
import Data.Char     (toLower, isLetter, isNumber)
import System.Exit   (exitSuccess)

palindrome :: IO ()
palindrome = forever $ do
  line1 <- getLine
  let simp = foldr (\a b -> if isLetter a || isNumber a
                            then toLower a : b
                            else b
                            ) "" line1
  case (simp == reverse simp) of
    True  -> putStrLn "It's a palindrome!"
    False -> do 
              putStrLn "Nope!"
              exitSuccess
  