module QuotDiv where

import Test.Hspec
import Test.QuickCheck

quotToRem :: (Real a, Enum a, Integral a) => a -> a -> Maybe Bool
quotToRem x y
  | y == 0 = Nothing
  | otherwise = Just $ (quot x y) * y + (rem x y) == x
divToMod :: (Real a, Enum a, Integral a) => a -> a -> Maybe Bool
divToMod x y
  | y == 0 = Nothing
  | otherwise = Just $ (div x y) * y + (mod x y) == x

prop_quotToRem :: (Real a, Enum a, Integral a) => a -> a -> Bool
prop_quotToRem x y = case quotToRem x y of
  Nothing   -> True
  Just True -> True
  Just False -> False

prop_divToMod :: (Real a, Enum a, Integral a) => a -> a -> Bool
prop_divToMod x y = case divToMod x y of
  Nothing   -> True
  Just True -> True
  Just False -> False

quotHSpec :: IO ()
quotHSpec = hspec $ do
  describe "QuotToRem" $ do
    it "Associative: Integers (quot x y) * y + (rem x y) should equal x" $ do
      property (prop_quotToRem :: Integer -> Integer -> Bool)
    it "Associative: Ints (quot x y) * y + (rem x y) should equal x" $ do
      property (prop_quotToRem :: Int -> Int -> Bool)
    it "Associative: Words (quot x y) * y + (rem x y) should equal x" $ do
      property (prop_quotToRem :: Word -> Word -> Bool)
    it "Commutative: Integers (div x y) * y + (mod x y) should equal x" $ do
      property (prop_divToMod :: Integer -> Integer -> Bool)
    it "Commutative: Ints (div x y) * y + (mod x y) should equal x" $ do
      property (prop_divToMod :: Int -> Int -> Bool)
    it "Commutative: Words (div x y) * y + (mod x y) should equal x" $ do
      property (prop_divToMod :: Word -> Word -> Bool)

quotQuickCheck :: IO ()
quotQuickCheck = do
  putStrLn "Associative: Integers (quot x y) * y + (rem x y) should equal x"
  quickCheck (prop_quotToRem :: Integer -> Integer -> Bool)
  putStrLn "Associative: Ints (quot x y) * y + (rem x y) should equal x"
  quickCheck (prop_quotToRem :: Int -> Int -> Bool)
  putStrLn "Associative: Words (quot x y) * y + (rem x y) should equal x"
  quickCheck (prop_quotToRem :: Word -> Word -> Bool)
  putStrLn "Commutative: Integers (div x y) * y + (mod x y) should equal x"
  quickCheck (prop_divToMod :: Integer -> Integer -> Bool)
  putStrLn "Commutative: Ints (div x y) * y + (mod x y) should equal x"
  quickCheck (prop_divToMod :: Int -> Int -> Bool)
  putStrLn "Commutative: Words (div x y) * y + (mod x y) should equal x"
  quickCheck (prop_divToMod :: Word -> Word -> Bool)