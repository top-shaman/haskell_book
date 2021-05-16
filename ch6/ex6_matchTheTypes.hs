module Exercise6 where

  import Data.List

--1.
  i :: Num a => a
  i = 1
  --cannot be replaced with 'i :: a' because there is no instance
  --for (Num a) arising from the literal

--2.
  f :: Float
  f = 1.0
  --cannot be replaced with 'f :: Num a => a' because Num defaults
  --to Integer, it expects that rather than a float

--3.
  f' :: Float
  f' = 1.0
  --can be replaced with 'f' :: Fractional a => a'

--4.
  f'' :: Float
  f'' = 1.0
  --cannot replace with 'f'' :: RealFrac' work because RealFrac
  --needs 2 arguments

--5.
  freud :: a -> a
  freud x = x
  --can be replaced with 'freud :: Ord a => a -> a' because x type
  --doesn't imply anything other than identity

--6.
  freud' :: a -> a
  freud' x = x
  --can be replaced with 'freud :: Int -> Int' because x type
  --doesn't imply anything other than identity


--7.
  myX = 1 :: Int

  sigmund :: Int -> Int
  sigmund x = myX
  --since myX is already typed as an Int, typing 'sigmund' as
  --'a -> a' conflicts with the expected type for sigmund

--8.
  myX' = 1 :: Int

  sigmund' :: Int -> Int
  sigmund' x = myX'
  --since myX is already typed as an Int, typing 'sigmund' as
  --'Num a => a -> a' conflicts with the expected type for sigmund
  --because it's a broader definition

--9.
  jung :: Ord a => [a] -> a
  jung xs = head (sort xs)
  --can be replaced with 'jung :: [Int] -> Int' because listed Int's
  --are instanced within Ord

--10.
  young :: [Char] -> Char
  young xs = head (sort xs)
  --can be replaced with 'young :: Ord a => [a] -> a' because listed
  --chars are instanced within Ord

--11.
  mySort :: [Char] -> [Char]
  mySort = sort

  signifier :: [Char] -> Char
  signifier xs = head (mySort xs)
  --cannot be replaced with 'signifier :: Ord a => [a] -> a' because
  --mySort expects [Char] as input, more specified than Ord a