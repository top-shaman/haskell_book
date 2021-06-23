module ValidateTheWord where

newtype Word' =
  Word' String
  deriving (Eq, Show)

vowels = "aeiou"

mkWord :: String -> Maybe Word'
mkWord xs
  | countLetters vowels xs > countLetters consonents xs = Nothing
  | otherwise = Just (Word' xs)
  where countLetters set = foldr (\a b -> if elem a set then b+1 else b) 0
        vowels = "aeiou"
        consonents = "bcdfghjklmnpqrstvwxyz" -- figured out by running (filter (not . flip elem vowels) ['a'..'z'])