{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances          #-}

module LogicGoats where

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

instance TooMany (Int, String) where -- tells if length of string is larger than the number provided
  tooMany (n, s) = length s > n

instance TooMany (Int, Int) where
  tooMany (n1, n2) = tooMany (n1 + n2) -- sees if sum of n1 or n2 is true based on TooMany Int instance

instance ((Num a, TooMany a) => TooMany (a, a)) where
  tooMany (n1, n2) = (tooMany n1) && (tooMany n2)

newtype Goats =
  Goats Int deriving (Eq, Show, TooMany)
