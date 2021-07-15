module Half where

import Test.Hspec
import Test.QuickCheck

half :: Fractional a => a -> a
half x = x/2

halfIdentity :: Fractional a => a -> a
halfIdentity = (*2) . half

prop_halfIdentity :: (Eq a, Fractional a) => a -> Bool
prop_halfIdentity x = halfIdentity x == x

halfHSpec :: IO ()
halfHSpec = hspec $ do
  describe "Half" $ do
    it "half of x is always half of x" $ do
      property $ \x -> x == halfIdentity (x :: Double)

halfQuickCheck :: IO ()
halfQuickCheck = do
  putStrLn "check Double"
  quickCheck (prop_halfIdentity :: Double -> Bool)
  putStrLn "check Float"
  quickCheck (prop_halfIdentity :: Float -> Bool)