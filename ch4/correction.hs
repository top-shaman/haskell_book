module Correction where

--1
x = (+)

f xs      = w `x` 1
  where w = length xs

--2
myId = \x -> x

--3
-- changed to ff to prevent compiler error
ff a b = a