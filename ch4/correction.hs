module Correction where

--1
x = (+)

f xs      = w `x` 1
  where w = length xs

--2
myId = \x -> x

--3
-- f changed to f1 to prevent compiler error
f1 a b = a