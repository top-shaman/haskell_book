module Foldr where

cons :: Foldable t => [a] -> t a -> [a]
cons = foldr (:)

conc :: [a] -> [a] -> [a]
conc = (++)

foldConc :: Foldable t => t [a] -> [a]
foldConc = foldr (++) []

prop_consConc :: Eq a => [a] -> [a] -> Bool
prop_consConc xs ys = (cons xs ys) == (conc xs ys)

prop_foldConc :: (Eq a, Foldable t) => t [a] -> Bool
prop_foldConc xs = (foldConc xs) == (concat xs)

--I don't even need to run an HSpec/QuickCheck to konw that the functions aren't equal.
--(foldr (:) == (++)) both take 2 arguments
--(foldr (++) [] == concat) takes 1 argument