module DollarSignCheck where

import Data.List
import Test.Hspec
import Test.QuickCheck

prop_dollar :: Eq c => (b -> c) -> (a -> b) -> a -> Bool
prop_dollar f g x = (f (g x)) == (f $ g x)

dot :: (b -> c) -> (a -> b) -> a -> c
dot f g = f . g

noDot :: (b -> c) -> (a -> b) -> a -> c
noDot f g = \x -> f (g x)

prop_dot :: Eq c => (b -> c) -> (a -> b) -> a -> Bool
prop_dot f g x = (dot f g x) == (noDot f g x)


dollarHSpec :: IO ()
dollarHSpec = hspec $ do
  describe "DollarTest" $ do
    it "For Integer list xs, property should be true" $ do
      property $ \xs -> prop_dot length sort (xs :: [Integer])