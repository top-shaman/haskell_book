--1. (++) :: [a] -> [a] -> [a]
--   myConcat x = x ++ "yo" -- becomes [Char] -> [Char] -> [Char]

--2. (*) :: Num a => a -> a -> a
--   myMult x = (x / 3) * 5 -- becomes Fractional a => a -> a -> a

--3. take :: Int -> [a] -> [a]
--   myTake x = take x "hey you" -- becomes Int -> [Char] -> [Char]

--4. (>) :: Ord a => a -> a -> Bool
--   myCom x = x > (length [1..10]) -- becomes Ord a => Int -> Int -> Bool

--5. (<) :: Ord a => a -> a -> Bool
--   myAlph x = x < 'z' -- becomes Ord a => Char -> Char -> Bool