module TypeKwonDo2 where

--1.
chk :: Eq b => (a -> b) -> a -> b -> Bool
chk g a b = g a == b

--2.
arith :: Num b
      => (a -> b)
      -> Integer
      -> a
      -> b
arith ab a b = ab b + fromInteger a