module DatabaseProcessing where

import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate   UTCTime
                  deriving (Eq, Ord, Show, Read) -- derived read to type check

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime
            (fromGregorian 1911 5 1)
            (secondsToDiffTime 34123))
    --, DbNumber 9001
    , DbString "Hello, world!"
    , DbDate (UTCTime
              (fromGregorian 1921 5 1)
              (secondsToDiffTime 34123))
    -- adding following for testing
    , DbDate (UTCTime
              (fromGregorian 1931 5 1)
              (secondsToDiffTime 34123))
    --, DbNumber 69
    --, DbNumber 420
  ]

--1.
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate db = [t | DbDate t <- db]

--without list comprehensions
{-
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate db = foldr (\a b -> (if (take 6 $ show a) == "DbDate"
                                  then (read $ drop 7 $ show a ) : b
                                  else b )) [] db
-}
--2.
filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber db = [t | DbNumber t <- db]

--without list comprehensions
{-
filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber db = foldr (\a b -> (if (take 8 $ show a) == "DbNumber"
                                   then (read $ drop 9 $ show a ) : b
                                   else b )) [] db
-}
--3.
mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = maximum . filterDbDate

--without `maximum`
{-
mostRecent :: [DatabaseItem] -> UTCTime
mostRecent db = foldr (\a b -> max a b) d (filterDbDate db)
  where d     = UTCTime (fromGregorian 0000 0 0) (secondsToDiffTime 0)
-}

--4.
sumDb :: [DatabaseItem] -> Integer
sumDb = sum . filterDbNumber

--5.
avgDb :: [DatabaseItem] -> Double
avgDb db = case total == 0 of
            True  -> 0
            False -> (/) (fromIntegral $ sumDb db) (fromIntegral $ total)
           where total = length $ filterDbNumber db