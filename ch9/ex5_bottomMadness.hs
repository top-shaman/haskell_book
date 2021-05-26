--1. [x^y | x <- [1..5], y <- [2, undefined]]
--   bottom

--2. take 1 $ [x^y | x <- [1..5], y <- [2, undefined]]
--   will return a value

--3. sum [1, undefined, 3]
--   bottom

--4. length [1, 2, undefined]
--   will return a value

--5. length $ [1, 2, 3] ++ undefined
--   bottom

--6. take 1 $ filter even [1, 2, 3, undefined]
--   will return a value

--7. take 1 $ filter even [1, 3, undefined]
--   bottom

--8. take 1 $ filter odd [1, 3, undefined]
--   will return a value

--9. take 2 $ filter odd [1, 3, undefined]
--   will return a value

--10. take 3 $ filter odd [1, 3, undefined]
--   bottom

--Intermission: Is it in normal form?

--1. [1, 2, 3, 4, 5]
--   WHNF & NF
--2. 1 : 2 : 3 : 4 : _
--   WHNF
--3. enumFromTo 1 10
--   neither
--4. length [1, 2, 3, 4, 5]
--   neither
--5. sum (enumFromTo 1 10)
--   neither
--6. ['a'..'m'] ++ ['n'..'z']
--   neither
--7. (_, 'b')
--   WHNF