{-
--1. b & c
--2. foldl (flip (*)) 1 [1..3]
     where f = flip (*)
     ((1 `f` 1) `f` 2) `f` 3
     (1 `f` 2) `f` 3
     2 `f` 3
     6
--3. c
--4. a
--5. a) foldr (++) "" ["woot", "WOOT", "woot"]
     b) foldr max (minBound :: Char) "fear is the little death"
     c) foldr (&&) True [False, True]
     d) foldr (||) False [False, True]
     e) foldr (show . (++)) "" [1..5]
     f) foldr (\x -> const $ toEnum x) 'a' [1..5]
     g) foldl const 0 "tacos"
     h) foldr (flip const) 0 "burritos"
     i) foldl const 'z' [1..5]
-}