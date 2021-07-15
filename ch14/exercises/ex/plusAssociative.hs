module PlusAssociative where

import Test.Hspec
import Test.QuickCheck

plusAssociative x y z =
  x + (y + z) == (x + y) + z
plusCommutative x y =
  x + y == y + x

prop_plusAssociative :: (Eq a, Integral a) => a -> a -> a -> Bool
prop_plusAssociative = plusAssociative

prop_plusCommutative :: (Eq a, Integral a) => a -> a -> Bool
prop_plusCommutative = plusCommutative

plusHSpec :: IO ()
plusHSpec = hspec $ do
  describe "PlusAssociative" $ do
    it "Associative: Integers x + (y + z) should equal (x + y) + z" $ do
      property $ \x y z -> plusAssociative x y (z :: Integer)
    it "Associative: Ints x + (y + z) should equal (x + y) + z" $ do
      property $ \x y z -> plusAssociative x y (z :: Int)
    it "Associative: Words x + (y + z) should equal (x + y) + z" $ do
      property $ \x y z -> plusAssociative x y (z :: Word)
    it "Commutative: Integers x + y should equal y + x" $ do
      property $ \x y -> plusAssociative x (y :: Integer)
    it "Commutative: Ints x + y should equal y + x" $ do
      property $ \x y -> plusAssociative x (y :: Int)
    it "Commutative: Words x + y should equal y + x" $ do
      property $ \x y -> plusAssociative x (y :: Word)

plusQuickCheck :: IO ()
plusQuickCheck = do
  putStrLn "Associative: Integers x + (y + z) should equal (x + y) + z"
  quickCheck (prop_plusAssociative :: Integer -> Integer -> Integer -> Bool)
  putStrLn "Associative: Ints x + (y + z) should equal (x + y) + z"
  quickCheck (prop_plusAssociative :: Int -> Int -> Int -> Bool)
  putStrLn "Associative: Words x + (y + z) should equal (x + y) + z"
  quickCheck (prop_plusAssociative :: Word -> Word -> Word -> Bool)
  putStrLn "Commutative: Integers x + y should equal y + x"
  quickCheck (prop_plusCommutative :: Integer -> Integer -> Bool)
  putStrLn "Commutative: Ints x + y should equal y + x"
  quickCheck (prop_plusCommutative :: Int -> Int -> Bool)
  putStrLn "Commutative: Words x + y should equal y + x"
  quickCheck (prop_plusCommutative :: Word -> Word -> Bool)