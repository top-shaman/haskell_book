module Exercise5 where
--Multiple Choice
--1. C
--2. A
--3. B
--4. C

--Determine the type
--1. a) (* 9) 6 -- Num a => a; 35
--   b) head [(0,"doge"),(1,"kitteh")] -- Num a => (a, [Char]); (0, "doge")
--   c) head [(0 :: Integer ,"doge"),(1,"kitteh")] -- (Integer, [Char]); (0, "doge")
--   d) if False then True else False -- Bool; False
--   e) length [1, 2, 3, 4, 5] -- Int; 5
--   f ) (length [1, 2, 3, 4]) > (length "TACOCAT") -- Bool; False

--2.
--x = 5
--y = x + 5
--w = y * 10
--w :: Num a => a

--3.
--z y = y * 10
--z :: Num a => a

--4.
--f = 4 / y
--f :: Fractional a => a

--5.
--x = "Julie"
--y = " < 3 "
--z = "Haskell"
--f = x ++ y ++ z
--f :: [Char]

--Does it compile?
--1. bigNum = (^) 5 $ 10
--   wahoo = bigNum $ 10
--   No, extraneous literal. needs to get rid of the ($ 10)

--2. x = print
--   y = print "wohoo!"
--   z = x "hello world"
--   Yes, it will compile.

--3. a = (+)
--   b = 5
--   c = b 10
--   d = c 200
--   No. Multiple values applied, to work we would want to use (a) as an infix operator, as it's declared

--4. a = 12 + b -- b not in scope
--   b = 10000 * c -- c not in scope
--   No, uses variables out of scope.  Needs to include variables in declaration

--Type variable or specific type constructor? (FP = fully polymorphic, CP = constrained polymorphic, C = concrete)
--1. f :: Num a => a -> b -> Int -> Int
--             FP       CP   C      C

--2. f :: zed -> Zed -> Blah
--        FP     C      C

--3. f :: Enum b => a -> b -> C
--    CP       FP   FP   C

--4. f :: f -> g -> C
--        FP   FP   C

--Write a Type Signature
--1. functionH :: [a] -> a
--   functionH (x:_) = x

--2. functionC :: Ord a => a -> a -> Bool
--   functionC = if (x > y) then True else False

--3. functionS :: (a, b) -> b
--   functionS (x, y) = y

--Given a type, write a function
--1.
  i :: a -> a
  i = i
--2.
  c :: a -> b -> a
  c a b = a
--3. (yes)
  c'' :: b -> a -> b
  c'' b a = b
--4.
  c' :: a -> b -> b
  c' a b = b
--5.
  r :: [a] -> [a]
  r = tail
--r = take a
--r = drop a
--6.
  co :: (b -> c) -> (a -> b) -> a -> c
  co a1 c1 c = a1 (c1 c)
--7.
  a :: (a -> c) -> a -> a
  a ac a = a
--8.
  a' :: (a -> b) -> a -> b
  a' a b = a b

--Fix it

  fstString :: [Char] -> [Char]
  fstString x = x ++ " in the rain"

  sndString :: [Char] -> [Char]
  sndString x = x ++ " over the rainbow"

  sing      = if (x < y) then fstString x else sndString y
    where x = "Singin"
          y = "Somewhere"

--Type-Kwon-Do
--1.
  f :: Int -> String
  f = undefined
  g :: String -> Char
  g = undefined
  h :: Int -> Char
  h x = g (f x)

--2.
  data A
  data B
  data C
  q :: A -> B
  q = undefined
  w :: B -> C
  w = undefined
  e :: A -> C
  e x = w (q x)

--3.
  data X
  data Y
  data Z
  xz :: X -> Z
  xz = undefined
  yz :: Y -> Z
  yz = undefined
  xform :: (X, Y) -> (Z, Z)
  xform (x, y) = ((xz x), (yz y))

--4.
  munge :: (x -> y)
        -> (y -> (w, z))
        -> x
        -> w
  munge xy xwz x = fst $ xwz $ xy x