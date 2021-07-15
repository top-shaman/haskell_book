module ReverseTest where

import Test.Hspec
import Test.QuickCheck

reverseId :: Eq a => [a] -> Bool
reverseId x = (reverse $ reverse x) == id x

prop_reverseId :: Eq a => [a] -> Bool
prop_reverseId x = reverseId x

reverseHSpec :: IO ()
reverseHSpec = hspec $ do
  describe "ReverseTest" $ do
    it "For Word list xs, property should be true" $ do
      property $ (prop_reverseId :: [Word] -> Bool)
    it "For Ordering list xs, property should be true" $ do
      property $ (prop_reverseId :: [Ordering] -> Bool)
    it "For Int list xs, property should be true" $ do
      property $ (prop_reverseId :: [Int] -> Bool)
    it "For Float list xs, property should be true" $ do
      property $ (prop_reverseId :: [Float] -> Bool)
    it "For Double list xs, property should be true" $ do
      property $ (prop_reverseId :: [Double] -> Bool)
    it "For Char list xs, property should be true" $ do
      property $ (prop_reverseId :: [Char] -> Bool)
    it "For Bool list xs, property should be true" $ do
      property $ (prop_reverseId :: [Bool] -> Bool)
    it "For Integer list xs, property should be true" $ do 
      property $ (prop_reverseId :: [Integer] -> Bool)

reverseQuickCheck :: IO ()
reverseQuickCheck = do
  quickCheck (prop_reverseId :: [Word] -> Bool)
  putStrLn "For Ordering list xs, property should be true"
  quickCheck (prop_reverseId :: [Ordering] -> Bool)
  putStrLn "For Int list xs, property should be true"
  quickCheck (prop_reverseId :: [Int] -> Bool)
  putStrLn "For Float list xs, property should be true"
  quickCheck (prop_reverseId :: [Float] -> Bool)
  putStrLn "For Double list xs, property should be true"
  quickCheck (prop_reverseId :: [Double] -> Bool)
  putStrLn "For Char list xs, property should be true"
  quickCheck (prop_reverseId :: [Char] -> Bool)
  putStrLn "For Bool list xs, property should be true"
  quickCheck (prop_reverseId :: [Bool] -> Bool)
  putStrLn "For Integer list xs, property should be true"
  quickCheck (prop_reverseId :: [Integer] -> Bool)