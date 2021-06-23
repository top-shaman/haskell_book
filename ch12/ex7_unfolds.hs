module Unfolds where

import Data.List

--1.
myIterate :: (a -> a) -> a -> [a]
myIterate f x = f x : (myIterate f $ f x)

--2.
myUnfoldr :: (b -> Maybe (a, b))
          -> b
          -> [a]
myUnfoldr f x = case f x of
  Nothing    -> []
  Just (a,b) -> a : myUnfoldr f b

--3.
betterIterate :: (a -> a) -> a -> [a]
betterIterate f = myUnfoldr (\a -> Just (a, f a))