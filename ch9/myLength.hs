module Mylength where

myLength :: [a] -> Integer
myLength [] = 0
myLength (_:xs) = 1 + myLength xs -- we use '_' to ignore values in our arguments that are part of a pattern match
-- strict in the spine, but not the values
-- forces evaluation of the entire spine without accompanying strictness in values