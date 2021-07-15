module LengthTake where

import Test.Hspec
import Test.QuickCheck

f :: Int -> [a] -> Bool
f n xs = length (take n xs) == n

lengthHSpec :: IO ()
lengthHSpec = hspec $ do
  describe "LengthTake" $ do
    it "length of take Integer n, of xs should equal n" $ do
      property (f :: Int -> [Integer] -> Bool)
    it "length of take Int n, of xs should equal n" $ do
      property (f :: Int -> [Int] -> Bool)
    it "length of take Word n, of xs should equal n" $ do
      property (f :: Int -> [Word] -> Bool)

lengthQuickCheck :: IO ()
lengthQuickCheck = do
  putStrLn "length of take Integer n, of xs should equal n"
  quickCheck (f :: Int -> [Integer] -> Bool)
  putStrLn "length of take Int n, of xs should equal n"
  quickCheck (f :: Int -> [Int] -> Bool)
  putStrLn "length of take Word n, of xs should equal n"
  quickCheck (f :: Int -> [Word] -> Bool)