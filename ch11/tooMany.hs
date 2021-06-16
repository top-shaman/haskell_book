module TooMany where

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

newtype Goats = Goats Int deriving Show

instance TooMany Goats where
  tooMany (Goats n) = n > 43

--with {-# LANGUAGE GeneralizedNewtypeDeriving #-} pragma,
-- we can also derive an instance in the newtype declaration
-- saving us the need to define a new instance-- it can assume
-- it instead