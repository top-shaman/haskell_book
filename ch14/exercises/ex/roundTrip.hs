module RoundTrip where

import Test.Hspec
import Test.QuickCheck

f :: (Eq a, Read a, Show a) => a -> Bool
f x = (read (show x)) == x

roundTripHSpec :: IO ()
roundTripHSpec = hspec $ do
  describe "RoundTrip" $ do
    it "roundTrip of take Integer n, of xs should equal n" $ do
      property (f :: Integer -> Bool)
    it "roundTrip of take Int n, of xs should equal n" $ do
      property (f :: Int -> Bool)
    it "roundTrip of take Word n, of xs should equal n" $ do
      property (f :: Word -> Bool)

roundTripQuickCheck :: IO ()
roundTripQuickCheck = do
  putStrLn "roundTrip of take Integer n, of xs should equal n"
  quickCheck (f :: Integer -> Bool)
  putStrLn "roundTrip of take Int n, of xs should equal n"
  quickCheck (f :: Int -> Bool)
  putStrLn "roundTrip of take Word n, of xs should equal n"
  quickCheck (f :: Word -> Bool)