module Puzzle where

import Data.List (intersperse, sort)

data Puzzle =
  Puzzle String [Maybe Char] [Char]

instance Show Puzzle where
  show (Puzzle _ discovered guessed) =
    (intersperse ' ' $
     fmap renderPuzzleChar discovered)
    ++ " Guessed so far: " ++ guessed

freshPuzzle :: String -> Puzzle
freshPuzzle word = Puzzle word (fmap (\a -> Nothing) word) ""

charInWord :: Puzzle -> Char -> Bool
charInWord (Puzzle word _ _) guess = elem guess word

alreadyGuessed :: Puzzle -> Char -> Bool
alreadyGuessed (Puzzle _ guesses _) guess = elem (Just guess) guesses

renderPuzzleChar :: Maybe Char -> Char
renderPuzzleChar (Just letter) = letter
renderPuzzleChar Nothing       = '_'

fillInCharacter :: Puzzle -> Char -> Puzzle
fillInCharacter (Puzzle word filledInSoFar s) c =
  Puzzle word newFilledInSoFar (c : s)
  where zipper guessed wordChar guessChar =
          if wordChar == guessed
          then Just wordChar
          else guessChar
        newFilledInSoFar =
          zipWith (zipper c)
            word filledInSoFar

handleGuess :: Puzzle -> Char -> IO Puzzle
handleGuess puzzle guess = do
  putStrLn $ "Your guess was: " ++ [guess]
  case (charInWord puzzle guess
       , alreadyGuessed puzzle guess) of
    (_,True) -> do
      putStrLn "You already guessed that\
              \ character, pick \
              \ something else!"
      return puzzle
    (True,_) -> do 
      putStrLn "This character was in the\
              \ word, filling in the word\
              \ accordingly"
      return (fillInCharacter puzzle guess)
    (False,_) -> do
      putStrLn "This character wasn't in\
               \ the word, try again."
      return (fillInCharacter puzzle guess)

correctChars :: [Maybe Char] -> [Char]
correctChars correct = fmap renderPuzzleChar correct

incorrectCount :: [Maybe Char] -> [Char] -> Int
incorrectCount correct guesses = length $ filter (==False) $
                                 fmap (\y -> elem y (correctChars correct)) $ removeDuplicates $ sort guesses
  where removeDuplicates = foldr (\a b -> a : dropWhile (==a) b) []