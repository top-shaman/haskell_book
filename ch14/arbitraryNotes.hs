module Arbitrary where

import Test.QuickCheck
import Test.QuickCheck.Gen (oneof) -- needed for Sum Type checks

--Trivial (simplest)
data Trivial =
  Trivial
  deriving (Eq, Show)

trivialGen :: Gen Trivial
trivialGen =
  return Trivial

instance Arbitrary Trivial where
  arbitrary = trivialGen

--Identity (single value, type)
data Identity a =
  Identity a
  deriving (Eq, Show)

identityGen :: Arbitrary a =>
               Gen (Identity a)
identityGen = do
  a <- arbitrary
  return (Identity a)

instance Arbitrary a =>
         Arbitrary (Identity a) where
  arbitrary = identityGen

identityGenInt :: Gen (Identity Int)
identityGenInt = identityGen

--Product (Multiple values, multiple types)
data Pair a b =
  Pair a b
  deriving (Eq, Show)

pairGen :: (Arbitrary a,
            Arbitrary b) =>
           Gen (Pair a b)
pairGen = do
  a <- arbitrary
  b <- arbitrary
  return (Pair a b)

instance (Arbitrary a,
          Arbitrary b) =>
         Arbitrary (Pair a b) where
  arbitrary = pairGen

pairGenIntString :: Gen (Pair Int String)
pairGenIntString = pairGen

-- equal sums
data Sum a b =
    First a
  | Second b
  deriving (Eq, Show)

sumGenEqual :: (Arbitrary a,
                Arbitrary b) =>
               Gen (Sum a b)
sumGenEqual = do
  a <- arbitrary
  b <- arbitrary
  oneof [return $ First a,
         return $ Second b]

sumGenCharInt :: Gen (Sum Char Int)
sumGenCharInt = sumGenEqual

--weighted Sums

sumGenFirstPls :: (Arbitrary a,
                   Arbitrary b) =>
                  Gen (Sum a b)
sumGenFirstPls = do
  a <- arbitrary
  b <- arbitrary
  frequency [(10, return $ First a),
             (1, return $ Second b)]

sumGenCharIntFirst :: Gen (Sum Char Int)
sumGenCharIntFirst = sumGenFirstPls

main :: IO ()
main = do
  sample trivialGen
