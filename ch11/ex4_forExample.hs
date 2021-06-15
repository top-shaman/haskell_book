module ForExample where

data Example = MakeExample deriving Show

--1. MakeExample :: Example. If ':t Example' is queried, an error will be thrown because Data Constructor isn't in scope
--2. if ':i Example' is queried, we will see definition, definition location, instance of Show, and reference to the instance definition Show
--3.
data Example' = MakeExample' Int deriving Show