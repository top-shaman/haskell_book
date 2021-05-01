module WhatCanWeDo where

--Given the following datatype definitions:
data Rocks = Rocks String deriving (Eq, Show)

data Yeah = Yeah Bool deriving (Eq, Show)

data Papu = Papu Rocks Yeah deriving (Eq, Ord, Show)

--1.
--phew = Papu "chases" True -- no, because type isn't given
--2.
truth = Papu (Rocks "chomskydoz") (Yeah True) -- yes
--3.
equalityForAll :: Papu -> Papu -> Bool
equalityForAll p p' = p == p' --yes, because p & p' are expected to be type Papu
--4.
comparePapus :: Papu -> Papu -> Bool
comparePapus p p' = p > p' --no, because Ord isn't instanced