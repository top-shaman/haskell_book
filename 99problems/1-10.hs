module Q1_10 where

--1. Find the last element of a list.

myLast = head . reverse

{-
test1 :: IO ()
test1 =
  do
    print $ myLast [1,2,3,4] == 4
    print $ myLast ['x','y','z'] == 'z'
-}

--2. Find the last but one element of a list.

myButLast = myLast . init

{-
test2 :: IO ()
test2 =
  do
    print $ myButLast [1,2,3,4] == 3
    print $ myButLast ['a'..'z'] == 'y'
-}

--3. Find the K'th element of a list. The first element in the list is number 1.
elementAt :: [a] -> Int -> a
elementAt (x:_) 1 = x
elementAt (_:xs) n = elementAt xs (n-1)
elementAt _ _ = error ("Index out of bounds")

{- --with 'go'
elementAt :: [a] -> Int -> a
elementAt a e = go a e 1
  where go (x:xs) elem count
          | elem == count = x
          | otherwise = go xs elem (count + 1) 
-}
{-
test3 :: IO ()
test3 =
  do
    print $ (elementAt [1,2,3] 2) == 2
    print $ (elementAt "haskell" 5) == 'e'

-}
--4. Find the number of elements of a list.


myLength :: [a] -> Int
myLength [] = 0
myLength (_:xs) = 1 + myLength xs

{-
test4 :: IO ()
test4 =
  do
    print $ myLength [123, 456, 789] == 3
    print $ myLength "Hello, world!" == 13
-}

--5. Reverse a list.

myReverse :: [a] -> [a]
myReverse [] = []
myReverse a = myLast a : myReverse (init a)

{-
test5 :: IO ()
test5 =
  do
    print $ myReverse "A man, a plan, a canal, panama!" == "!amanap ,lanac a ,nalp a ,nam A"
    print $ myReverse [1,2,3,4] == [4,3,2,1]
-}

--6. Find out whether a list is a palindrome. A palindrome can be read forward or backward;
--   e.g. (x a m a x).

isPalindrome :: Eq a => [a] -> Bool
isPalindrome a = myReverse a == a

{-
test6 :: IO ()
test6 =
  do
    print $ isPalindrome [1,2,3] == False
    print $ isPalindrome "madamimadam" == True
    print $ isPalindrome [1,2,4,8,16,8,4,2,1] == True
-}

--7. Flatten a nested list structure.
data NestedList a = Elem a | List [NestedList a]

flatten :: NestedList a -> [a]
flatten (Elem a)      = [a]
flatten (List (x:xs)) = flatten x ++ flatten (List xs)
flatten (List [])     = []

{-
test7 :: IO ()
test7 =
  do
    print $ flatten (Elem 5) == [5]
    print $ flatten (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]]) == [1,2,3,4,5]
--  doesn't test in this particular function, but tests positively in REPL
    print $ flatten (List []) == []
-}

--8. Eliminate consecutive duplicates of list elements.

compress :: Eq a => [a] -> [a]
compress (x:[]) = x:[]
compress (x:xs)
  | x == head xs = compress xs
  | otherwise = x : compress xs

{- --alternatively 
compress []     = []
compress (x:xs) = x : (compress $ dropWhile (== x) xs)
-}

{-
test8 :: IO ()
test8 =
  do
    print $ compress "aaaabccaadeeee" == "abcade"
-}

--9. Pack consecutive duplicates of list elements into sublists.

pack :: Eq a => [a] -> [[a]]
pack [] = []
pack (x:xs) = let (first,rest) = span (==x) xs
               in (x:first) : pack rest

{-
test9 :: IO ()
test9 =
  do
    print $ pack ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']
-}

--10. Run-length encoding of a list. Use the result of problem P09 to implement the so-called
--    run-length encoding data compression method. Consecutive duplicates of elements are encoded
--    as lists (N E) where N is the number of duplicates of the element E.

encode [] = []
encode (x:xs) = (myLength (x : (takeWhile (==x) xs)), x) : encode (dropWhile (==x) xs)

{-
test10 :: IO ()
test10 =
  do
    print $ encode "aaaabccaadeeee" == [(4,'a'),(1,'b'),(2,'c'),(2,'a'),(1,'d'),(4,'e')]
-}