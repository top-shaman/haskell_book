module CipherTest where

import Ciphers
import Test.Hspec
import Test.QuickCheck

prop_caesar :: Int -> [Char] -> Bool
prop_caesar n xs = xs == (caesar n $ uncaesar n xs)

prop_vig :: [Char] -> [Char] -> Bool
prop_vig key message = message == (vigenere key $ unvigenere key message)



cipherHSpec :: IO ()
cipherHSpec = hspec $ do
  describe "Ciphers" $ do
    it "the message should be equal to the caesar and un-caesar message" $ do
      property (prop_caesar :: Int -> [Char] -> Bool)
    it "the message should be equal to the vigenere and un-vigenere message" $ do
      property (prop_vig :: [Char] -> [Char] -> Bool)

cipherQuickCheck :: IO ()
cipherQuickCheck = do
  putStrLn"the message should be equal to the caesar and un-caesar message"
  quickCheck (prop_caesar :: Int -> [Char] -> Bool)
  putStrLn "the message should be equal to the vigenere and un-vigenere message"
  quickCheck (prop_vig :: [Char] -> [Char] -> Bool)