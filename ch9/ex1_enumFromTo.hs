module EnumFromTo where

eftBool :: Bool -> Bool -> [Bool]
eftBool a b
  | a < b = [a, b]
  | a == b = [a]
  | otherwise = []

eftOrd :: Ordering
       -> Ordering
       -> [Ordering]
eftOrd a b = go a b []
  where go a' b' e -- first ord, second ord, new Enum
          | compare a' b' == GT = []
          | compare a' b' == EQ = (e ++ [b'])
          | otherwise =
              go (succ a') b' (e ++ [a'])

eftInt :: Int -> Int -> [Int]
eftInt a b = go a b []
  where go a' b' e -- first ord, second ord, new Enum
          | a' > b' = []
          | a' == b' = (e ++ [b'])
          | otherwise =
              go (succ a') b' (e ++ [a'])


eftChar :: Char -> Char -> [Char]
eftChar a b = go a b []
  where go a' b' e -- first ord, second ord, new Enum
          | a' > b' = []
          | a' == b' = (e ++ [b'])
          | otherwise =
              go (succ a') b' (e ++ [a'])

-- or without the 'go' function
eftOrd' :: Ordering
       -> Ordering
       -> [Ordering]
eftOrd' a b
  | compare a b == GT = []
  | compare a b == EQ = [a]
  | otherwise = a : eftOrd' (succ a) b

eftInt' :: Int -> Int -> [Int]
eftInt' a b
  | a > b = []
  | a == b = [a]
  | otherwise = a : eftInt' (succ a) b

eftChar' :: Char -> Char -> [Char]
eftChar' a b
  | a > b = []
  | a == b = [a]
  | otherwise = a : eftChar' (succ a) b