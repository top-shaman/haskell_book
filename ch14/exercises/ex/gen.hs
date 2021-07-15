module Gen where

import Test.QuickCheck

data Fool =
    Fulse
  | Frue
  deriving (Eq, Show)

genFoolEqual :: Gen Fool
genFoolEqual = oneof [return Fulse, return Frue]

genFoolWeighted :: Gen Fool
genFoolWeighted = frequency [(2, return Fulse),
                             (1, return Frue)]