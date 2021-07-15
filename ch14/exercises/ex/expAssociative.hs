module ExpAssociative where

import Test.Hspec
import Test.QuickCheck

expAssociative x y z =
  x ^ (y ^ z) == (x ^ y) ^ z
expCommutative x y =
  x ^ y == y ^ x

prop_expAssociative :: (Eq a, Integral a) => a -> a -> a -> Bool
prop_expAssociative = expAssociative

prop_expCommutative :: (Eq a, Integral a) => a -> a -> Bool
prop_expCommutative = expCommutative

expHSpec :: IO ()
expHSpec = hspec $ do
  describe "expAssociative" $ do
    it "Associative: Integers x ^ (y ^ z) should equal (x ^ y) ^ z" $ do
      property (prop_expAssociative :: Integer -> Integer -> Integer -> Bool)
    it "Associative: Ints x ^ (y ^ z) should equal (x ^ y) ^ z" $ do
      property (prop_expAssociative :: Int -> Int -> Int -> Bool)
    it "Associative: Words x ^ (y ^ z) should equal (x ^ y) ^ z" $ do
      property (prop_expAssociative :: Word -> Word -> Word -> Bool)
    it "Commutative: Integers x ^ y should equal y ^ x" $ do
      property (prop_expCommutative :: Integer -> Integer -> Bool)
    it "Commutative: Ints x ^ y should equal y ^ x" $ do
      property (prop_expCommutative :: Int -> Int -> Bool)
    it "Commutative: Words x ^ y should equal y ^ x" $ do
      property (prop_expCommutative :: Word -> Word -> Bool)

expQuickCheck :: IO ()
expQuickCheck = do
  putStrLn "Associative: Integers x ^ (y ^ z) should equal (x ^ y) ^ z"
  quickCheck (prop_expAssociative :: Integer -> Integer -> Integer -> Bool)
  putStrLn "Associative: Ints x ^ (y ^ z) should equal (x ^ y) ^ z"
  quickCheck (prop_expAssociative :: Int -> Int -> Int -> Bool)
  putStrLn "Associative: Words x ^ (y ^ z) should equal (x ^ y) ^ z"
  quickCheck (prop_expAssociative :: Word -> Word -> Word -> Bool)
  putStrLn "Commutative: Integers x ^ y should equal y ^ x"
  quickCheck (prop_expCommutative :: Integer -> Integer -> Bool)
  putStrLn "Commutative: Ints x ^ y should equal y ^ x"
  quickCheck (prop_expCommutative :: Int -> Int -> Bool)
  putStrLn "Commutative: Words x ^ y should equal y ^ x"
  quickCheck (prop_expCommutative :: Word -> Word -> Bool)