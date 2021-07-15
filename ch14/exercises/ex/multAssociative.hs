module MultAssociative where

import Test.Hspec
import Test.QuickCheck

multAssociative x y z =
  x * (y * z) == (x * y) * z
multCommutative x y =
  x * y == y * x

prop_multAssociative :: (Eq a, Integral a) => a -> a -> a -> Bool
prop_multAssociative = multAssociative

prop_multCommutative :: (Eq a, Integral a) => a -> a -> Bool
prop_multCommutative = multCommutative

multHSpec :: IO ()
multHSpec = hspec $ do
  describe "multAssociative" $ do
    it "Associative: Integers x * (y * z) should equal (x * y) * z" $ do
      property $ \x y z -> multAssociative x y (z :: Integer)
    it "Associative: Ints x * (y * z) should equal (x * y) * z" $ do
      property $ \x y z -> multAssociative x y (z :: Int)
    it "Associative: Words x * (y * z) should equal (x * y) * z" $ do
      property $ \x y z -> multAssociative x y (z :: Word)
    it "Commutative: Integers x * y should equal y * x" $ do
      property $ \x y -> multAssociative x (y :: Integer)
    it "Commutative: Ints x * y should equal y * x" $ do
      property $ \x y -> multAssociative x (y :: Int)
    it "Commutative: Words x * y should equal y * x" $ do
      property $ \x y -> multAssociative x (y :: Word)

multQuickCheck :: IO ()
multQuickCheck = do
  putStrLn "Associative: Integers x * (y * z) should equal (x * y) * z"
  quickCheck (prop_multAssociative :: Integer -> Integer -> Integer -> Bool)
  putStrLn "Associative: Ints x * (y * z) should equal (x * y) * z"
  quickCheck (prop_multAssociative :: Int -> Int -> Int -> Bool)
  putStrLn "Associative: Words x * (y * z) should equal (x * y) * z"
  quickCheck (prop_multAssociative :: Word -> Word -> Word -> Bool)
  putStrLn "Commutative: Integers x * y should equal y * x"
  quickCheck (prop_multCommutative :: Integer -> Integer -> Bool)
  putStrLn "Commutative: Ints x * y should equal y * x"
  quickCheck (prop_multCommutative :: Int -> Int -> Bool)
  putStrLn "Commutative: Words x * y should equal y * x"
  quickCheck (prop_multCommutative :: Word -> Word -> Bool)