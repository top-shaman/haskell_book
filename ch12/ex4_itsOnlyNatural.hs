module OnlyNatural where

data Nat =
    Zero
  | Succ Nat
  deriving (Eq, Show)

natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ n) = 1 + natToInteger n

integerToNat :: Integer -> Maybe Nat
integerToNat n
  | n < 0       = Nothing
  | otherwise   = counter 0 Zero
      where counter c acc
              | c == n    = Just acc
              | otherwise = counter (c+1) (Succ acc)

--with fold

integerToNat' :: Integer -> Maybe Nat
integerToNat' n
  | n < 0     = Nothing
  | otherwise = Just $ foldr (\a b -> Succ b) Zero (flip replicate 1 $ fromIntegral n)