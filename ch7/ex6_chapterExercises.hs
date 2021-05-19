--Multiple Choice
--1.d)
--2.b)
--3.d)
--4.b)
--5.a)

--Let's write code
--1)
--  a)
tensDigit :: Integral a => a -> a
tensDigit x = xLast
  where xLast = (snd . d) . (fst . d) $ x
        d     = flip divMod 10
--  b) it only has the same type if fst is used compositely
--  c)
hundredsDigit :: Integral a => a -> a
hundredsDigit x = xLast
  where xLast = (snd . h) . (fst . t) $ x
        t     = flip divMod 100
        h     = flip divMod 10
--2)
foldBool :: a -> a -> Bool -> a
foldBool x y b =
  case b of
    True -> x
    False -> y

foldBool' :: a -> a -> Bool -> a
foldBool' x y b
  | b = x
  | otherwise = y
--3)
g :: (a -> b) -> (a, c) -> (b, c)
g f (x, y) = (f x, y)
--4)
roundTrip :: (Show a, Read a) => a -> a
roundTrip a = read (show a)

main = do
  print (roundTrip 4)
  print (roundTrip' 4) -- added for 5
  print (roundTrip'' 4 :: Int) -- added for 6
  print (id 4)

--5)
roundTrip' :: (Show a, Read a) => a -> a
roundTrip' = read . show

--6)
roundTrip'' :: (Show a, Read b) => a -> b
roundTrip'' = read . show