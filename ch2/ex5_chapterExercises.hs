--Parenthesization
--1.
--2 + (2 + 3) - 1

--2.
--10 ^ (1 + 1)

--3.
--(*)((^) 2 2)((^) 4 5) + 1

--Equivalent expressions
--1. 1 + 2
--   2
--   same

--2. 10 ^ 2
--   10 + 9 * 10
--   same

--3. 400 - 37
--   (-) 37 400
--   different

--4. 100 `div` 3
--   100 / 3
--   different

--5. 2 * 5 + 18
--   2 * (5 + 18)
--   different

module Exercises2 where

waxOn     = x * 5
  where z = 7
        x = y ^ 2
        y = z + 8

triple x = x * 3

waxOff x = triple x