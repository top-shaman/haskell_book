module Vehicles where

data Price        = Price Integer deriving (Eq, Show)
data Size         = Size Integer deriving (Eq, Show)
data Manufacturer = Mini | Mazda | Tata deriving (Eq, Show)
data Airline      = PapuAir | CatapultsR'Us | TakeYourChancesUnited deriving (Eq, Show)
data Vehicle      = Car Manufacturer Price | Plane Airline Size deriving (Eq, Show)




myCar    = Car Mini (Price 14000)
urCar    = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge     = Plane PapuAir (Size 42069)
--1. myCar :: Vehicle

--2.
isCar :: Vehicle -> Bool
isCar (Car _ _)   = True
isCar _           = False

isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True
isPlane _           = False

areCars :: [Vehicle] -> Bool
areCars = and . map isCar

--3.
getManu :: Vehicle -> Manufacturer
getManu (Car x _) = x

--4. it will throw an exception because there is no Manufacturer data in plane
--5. added Size datatype, as well as Size to Plane data constructor, and extra '_' to isPlane function Plane argument