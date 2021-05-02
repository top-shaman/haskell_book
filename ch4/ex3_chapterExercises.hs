--1. :t length
--   length :: Foldable t => t a -> Int

--2. a) 5
--   b) 3
--   c) 2
--   d) 5

--3. 6 / length [1, 2, 3] will return an error because length :: Integer and (/) works with Fractionals
--4. 6 `div` length [1, 2, 3]
--5. Conditional if '2 + 3' equals '5'. True
--6. Bool, False
--7. a) legnth all Awesome == 2 --> True
--   b) length [1, 'a', 3, 'b'] --> won't work, mixed types in list
--   c)length allAwesome + length awesome --> 5
--   d) (8 == 8) && ('b' < 'a') --> False
--   e) (8 == 8) && 9 --> won't work; 9 isn't Bool type
--8. isPalindrome :: (Eq a) => [a] -> Bool
--   isPalindrome x = (x == reverse x)
--9. myAbs :: Integer -> Integer
--   myAbs x = if x > 0 then x else negate x
--10. f :: (a, b) -> (c, d) -> ((b, d), (a, c))
--    f a b = ((snd a, snd b), (fst a, fst b))

--Matching
--1. c) Show a => a -> String
--2. b) Eq a => a -> a -> Bool
--3. a) (a, b) -> a
--4. d) Num a => a -> a -> a