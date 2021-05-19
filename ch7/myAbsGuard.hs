module MyAbsGuard where

myAbsGuard :: Integer -> Integer
myAbsGuard x
  | x < 0     = (-x)
  | otherwise = x