module AHeadCode where

--type these in the REPL
--1.
--let x = 5 in x
--5

--2.
--let x = 5 in x * x
--25

--3.
--let x = 5; y = 6 in x * y
--30

--4.
--let x = 3; y = 1000 in x + 3
--6

--rewrite with 'where' clauses
--1.
--ex1       = x * 3 + y
--  where x = 3
--        y = 1000

--2.
--ex2       = x * 5
--  where x = 10 * 5 + y
--        y = 10

--3.
--ex3       = z / x + y
--  where x = 7
--        y = negate x
--        z = y * 10