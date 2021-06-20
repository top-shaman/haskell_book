module PityTheBool where

--1.
data BigSmall = Big Bool | Small Bool deriving (Eq, Show)
-- cardinality of Bool = 2, 2 Bools, so 2+2 = 4, the cardinality of BigSmall is 4

--2.

import Data.Int
data NumberOrBool = Numba Int8
                  | BoolyBool Bool deriving (Eq, Show)

-- cardinality of Int8 = 256, Bool = 2, so 256 + 2 = 258, the cardinality of NumberOrBool = 258