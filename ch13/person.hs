module Person where

import Data.Char

type Name = String
type Age = Integer

data Person = Person Name Age deriving Show

data PersonInvalid =
    NameEmpty
  | AgeTooLow
  | PersonInvalidUnknown String
  deriving (Eq, Show)
mkPerson :: Name
         -> Age
         -> Either PersonInvalid Person
mkPerson name age
  | name /= "" && age > 0 = Right $ Person name age
  | name == "" = Left NameEmpty
  | not (age > 0) = Left AgeTooLow
  | otherwise = Left $ PersonInvalidUnknown $
                "Name was: " ++ show name ++
                " Age was: " ++ show age

gimmePerson :: IO ()
gimmePerson = do
  putStrLn "Please enter your name and age (Name #): "
  line1 <- getLine
  let age = read (foldr (\a b -> if isNumber a
                                 then a : b
                                 else b) "" line1) :: Integer
      name = (foldr (\a b -> if isLetter a
                             then a : b
                             else b) "" line1) :: String
  case mkPerson name age of
    Left AgeTooLow     -> putStrLn "error: age too low"
    Left NameEmpty     -> putStrLn "error: name empty"
    Left (PersonInvalidUnknown a) -> putStrLn $ "error: person invalid unknown" ++ a
    Right p@(Person n a) -> putStrLn $ "Successfully got a person: " ++ show p