module Filtering where

--1.
multOf3 = filter (\x -> mod x 3 == 0)[1..30]

--2.
howManyMultOf3 = length $ filter (\x -> mod x 3 == 0)[1..30]

--3.
noArticles = filter (/="an") . filter (/="a") . filter (/="the") . words