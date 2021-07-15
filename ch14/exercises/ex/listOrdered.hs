module ListOrdered where

import Data.List (sort)
import Test.Hspec
import Test.QuickCheck

-- for any list you apply sort to,
-- this property should hold

listOrdered :: (Ord a) => [a] -> Bool
listOrdered xs =
  snd $ foldr go (Nothing, True) xs
  where go _ status@(_, False) = status
        go y (Nothing, t) = (Just y, t)
        go y (Just x, t) = (Just y, x >= y)

prop_listOrdered :: (Eq a, Ord a) => [a] -> Bool
prop_listOrdered = listOrdered . sort

listHSpec :: IO ()
listHSpec = hspec $ do
  describe "ListOrdered" $ do
    it "For Word list xs, property should be true" $ do
      property $ (prop_listOrdered :: [Word] -> Bool)
    it "For Ordering list xs, property should be true" $ do
      property $ (prop_listOrdered :: [Ordering] -> Bool)
    it "For Int list xs, property should be true" $ do
      property $ (prop_listOrdered :: [Int] -> Bool)
    it "For Float list xs, property should be true" $ do
      property $ (prop_listOrdered :: [Float] -> Bool)
    it "For Double list xs, property should be true" $ do
      property $ (prop_listOrdered :: [Double] -> Bool)
    it "For Char list xs, property should be true" $ do
      property $ (prop_listOrdered :: [Char] -> Bool)
    it "For Bool list xs, property should be true" $ do
      property $ (prop_listOrdered :: [Bool] -> Bool)
    it "For Integer list xs, property should be true" $ do 
      property $ (prop_listOrdered :: [Integer] -> Bool)

listQuickCheck :: IO ()
listQuickCheck = do
  putStrLn "For Word list xs, property should be true"
  quickCheck (prop_listOrdered :: [Word] -> Bool)
  putStrLn "For Ordering list xs, property should be true"
  quickCheck (prop_listOrdered :: [Ordering] -> Bool)
  putStrLn "For Int list xs, property should be true"
  quickCheck (prop_listOrdered :: [Int] -> Bool)
  putStrLn "For Float list xs, property should be true"
  quickCheck (prop_listOrdered :: [Float] -> Bool)
  putStrLn "For Double list xs, property should be true"
  quickCheck (prop_listOrdered :: [Double] -> Bool)
  putStrLn "For Char list xs, property should be true"
  quickCheck (prop_listOrdered :: [Char] -> Bool)
  putStrLn "For Bool list xs, property should be true"
  quickCheck (prop_listOrdered :: [Bool] -> Bool)
  putStrLn "For Integer list xs, property should be true"
  quickCheck (prop_listOrdered :: [Integer] -> Bool)