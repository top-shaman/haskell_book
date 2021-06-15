module DogTypes where

data PugType = PugData
data HuskyType a = HuskyData
data DogueDeBordeaux doge = DogueDeBordeaux doge

myPug = PugData :: PugType

myHusky :: HuskyType a
myHusky = HuskyData

myOtherHusky :: Num a => HuskyType a
myOtherHusky = HuskyData

myOtherOtherHusky :: HuskyType [[[[Int]]]]
myOtherOtherHusky = HuskyData

myDoge :: DogueDeBordeaux Int
myDoge = DogueDeBordeaux 10

data Doggies a =
    Husky a
  | Mastiff a
  deriving (Eq, Show)

--1. Doggies is a type constructor
--2. Doggies is kind * -> *
--3. Doggies String is kind *
--4. 'Husky 10' is type Doggies Int
--5. Husky (10 :: Integer) is type Doggies Integer
--6. Mastiff "Scooby Doo" is type Doggies String
--7. DogueDeBordeaux is a type constructor and a data constructor
--8. DogueDeBordeaux is type doge -> DogueDeBordeaux doge
--9. DogueDeBordeaux "doggie!" is type DogueDeBordeaux [Char]