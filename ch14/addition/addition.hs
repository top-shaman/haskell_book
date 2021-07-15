module Addition where

import Gen
import Test.Hspec
import Test.QuickCheck

dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
  where go n  d count
         | n < d = (count, n)
         | otherwise =
             go (n - d) d (count + 1)

multiplyBy :: (Eq a, Num a) => a -> a -> a
multiplyBy x 1 = x
multiplyBy x y = x + multiplyBy x (y-1)

main :: IO ()
main = hspec $ do 
  describe "Addition" $ do
  {-
    it "15 divided by 3 is 5" $ do
      dividedBy 15 3 `shouldBe` (5, 0)
    it "22 divided by 5 is\
      \ 4 remainder 2" $ do
      dividedBy 22 5 `shouldBe` (4, 2)
  -}
    it "6 multiplied by 9 is 54" $ do
      multiplyBy 6 9 `shouldBe` 54
    it "42 multiplied by 10 is 420" $ do
      multiplyBy 42 10 `shouldBe` 420
    it "x + 1 is always \
       \ greater than x" $ do
      property $ \x -> x + 1 > (x :: Int)