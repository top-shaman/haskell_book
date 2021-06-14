module Q1_20 where

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

--11. Modify the result of problem 10 in such a way that if an element has no duplicates
--    it is simply copied into the result list. Only elements with duplicates are transferred
--    as (N E) lists.

data NumberOf a = Single a
                | Multiple Int a
                deriving (Eq, Show)

encodeModified :: Eq a => [a] -> [NumberOf a]
encodeModified [] = []
encodeModified (x:xs) = (if len > 1 then (Multiple len x) else Single x) : encodeModified (dropWhile (==x) xs)
            where len = length (x : (takeWhile (==x) xs))

--alternatively
{-
encodeModified :: Eq a => [a] -> [NumberOf a]
encodeModified = map encodeHelper . encode
  where
    encodeHelper (1,x) = Single x
    encodeHelper (n,x) = Multiple n x
-}
{-
test11 :: IO ()
test11 =
  do
    print $ encodeModified "aaaabccaadeeee" ==
      [Multiple 4 'a',Single 'b',Multiple 2 'c',
       Multiple 2 'a',Single 'd',Multiple 4 'e']
-}

--12. Given a run-length code list generated as specified in problem 11. Construct its
--    uncompressed version.

decodeModified :: Eq a => [NumberOf a] -> [a]
decodeModified = concat . map decodeHelper -- can use concatMap
  where
    decodeHelper (Multiple n x) = take n $ repeat x -- can use "replicate n x"
    decodeHelper (Single x)     = x : []
{-
test12 :: IO ()
test12 =
  do
    print $ decodeModified [Multiple 4 'a',Single 'b',Multiple 2 'c',
                            Multiple 2 'a',Single 'd',Multiple 4 'e']
                            == "aaaabccaadeeee"
-}

--13. Run-length encoding of a list (direct solution).

encodeDirect :: Eq a => [a] -> [NumberOf a]
encodeDirect [] = []
encodeDirect (x:xs)
  | count == 1 = (Single x) : (encodeDirect xs)
  | otherwise  = (Multiple count x) : (encodeDirect rest)
  where
    (matched, rest) = span (==x) xs
    count = 1 + length matched

{-
test13 :: IO ()
test13 =
  do
    print $ encodeDirect "aaaabccaadeeee" ==
      [Multiple 4 'a',Single 'b',Multiple 2 'c',
       Multiple 2 'a',Single 'd',Multiple 4 'e']
-}

--14.  Duplicate the elements of a list.

dupli :: [a] -> [a]
dupli = concatMap $ replicate 2

{-
test14 :: IO ()
test14 =
  do
    print $ dupli [1, 2, 3] == [1,1,2,2,3,3]
-}

--15. Replicate the elements of a list a given number of times.

repli :: [a] -> Int -> [a]
repli xs n = concatMap (replicate n) xs

{-
test15 :: IO ()
test15 =
  do
    print $ repli "abc" 3 == "aaabbbccc"
-}

--16. Drop every N'th element from a list.

dropEvery [] _ = []
dropEvery xs n          = matched ++ (flip dropEvery n $ drop 1 rest) 
  where
    (matched, rest) = (take (n-1) xs, drop (n-1) xs)

{-
test16 :: IO ()
test16 =
  do
    print $ dropEvery "abcdefghik" 3 == "abdeghk"
-}

--17. Split a list into two parts; the length of the first part is given.

split xs n = (take n xs, drop n xs)

{-
test17 :: IO ()
test17 =
  do
    print $ split "abcdefghik" 3 == ("abc", "defghik")
-}

--18.Extract a slice from a list.

slice xs n1 n2 = drop (n1-1) $ take n2 xs

{-
test18 :: IO ()
test18 =
  do
    print $ slice ['a','b','c','d','e','f','g','h','i','k'] 3 7 == "cdefg"
-}

--19. Rotate a list N places to the left.

rotate xs n = part2 ++ part1
  where (part1, part2) = split xs $ mod n $ length xs

{-
test19 :: IO ()
test19 =
  do
    print $ rotate ['a','b','c','d','e','f','g','h'] 3 == "defghabc"
    print $ rotate ['a','b','c','d','e','f','g','h'] (-2) == "ghabcdef"
-}

--20. Remove the K'th element from a list.

removeAt n xs = (xs !! (n-1), take (n-1) xs ++ drop n xs)

{-
test20 :: IO ()
test20 =
  do
    print $ removeAt 2 "abcd" == ('b',"acd")
-}

--21. Insert an element at a given position into a list.

insertAt e xs i = take (i-1) xs ++ [e] ++ drop (i-1) xs

{-
test21 :: IO ()
test21 =
  do
    print $ insertAt 'X' "abcd" 2 == "aXbcd"
-}

--22. Create a list containing all integers within a given range.

range x y = [x..y]

{-
test22 :: IO ()
test22 =
  do
    range 4 9 == [4,5,6,7,8,9]
-}