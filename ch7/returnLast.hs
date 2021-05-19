module ReturnLast where

returnLast :: a -> b -> c -> d -> d
returnLast _ _ _ d = d

returnLast' :: a -> (b -> (c -> (d -> d)))
returnLast' _ _ _ d = d

--returnLast :: (((a -> b) -> c) -> d) -> d
--returnLast _ _ _ d = d
--breaks because it's expecting one function ((a -> b) -> c) -> d)