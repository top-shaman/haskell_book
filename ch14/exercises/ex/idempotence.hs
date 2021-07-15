module Idempotence where

import Data.Char
import Data.List
import Test.Hspec
import Test.QuickCheck

twice :: (b -> b) -> b -> b
twice f = f . f

fourTimes :: (b -> b) -> b -> b
fourTimes = twice. twice

f :: [Char] -> Bool
f x =
  (capitalizeWord x == twice capitalizeWord x) &&
  (capitalizeWord x == fourTimes capitalizeWord x)
  where capitalizeWord = foldr (\a b -> toUpper a : b) []

f' :: Ord a => [a] -> Bool
f' x =
  (sort x == twice sort x) &&
  (sort x == fourTimes sort x)

twiceHSpec :: IO ()
twiceHSpec = hspec $ do
  describe "Twice" $ do
    it "Idempotence check for f" $ do
      property (f :: [Char] -> Bool)
    it "Idempotence check for [Integer] f'" $ do
      property (f' :: [Integer] -> Bool)
    it "Idempotence check for [Int] f'" $ do
      property (f' :: [Int] -> Bool)
    it "Idempotence check for [Word] f'" $ do
      property (f' :: [Word] -> Bool)
    it "Idempotence check for [Char] f'" $ do
      property (f' :: [Char] -> Bool)

twiceQuickCheck :: IO ()
twiceQuickCheck = do
  putStrLn "Idempotence check for f"
  quickCheck (f :: [Char] -> Bool)
  putStrLn "Idempotence check for [Integer] f'"
  quickCheck (f' :: [Integer] -> Bool)
  putStrLn "Idempotence check for [Int] f'"
  quickCheck (f' :: [Int] -> Bool)
  putStrLn "Idempotence check for [Word] f'"
  quickCheck (f' :: [Word] -> Bool)
  putStrLn "Idempotence check for [Char] f'"
  quickCheck (f' :: [Char] -> Bool)