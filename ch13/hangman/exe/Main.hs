module Main where

import Control.Monad (forever)
import Data.Char     (toLower)
import Data.Maybe    (isJust)
import Gallows
import Words
import Puzzle
import System.Exit   (exitSuccess)
import System.IO     (BufferMode(NoBuffering),
                      hSetBuffering,
                      stdout)



gameOver :: Puzzle -> IO ()
gameOver (Puzzle wordToGuess correct guesses) =
  if (incorrectCount correct guesses) > 7 then
    do putStrLn "You lose!"
       putStrLn $
         "The word was: " ++ wordToGuess
       exitSuccess
  else return ()



gameWin :: Puzzle -> IO ()
gameWin (Puzzle _ filledInSoFar _) =
  if all isJust filledInSoFar then
    do putStrLn "You win!"
       exitSuccess
  else return ()

runGame :: Puzzle -> IO ()
runGame puzzle = forever $ do
  gameOver puzzle
  gameWin puzzle
  renderGallows puzzle
  putStrLn $
    "Current puzzle is: " ++ show puzzle
  putStrLn "Guess a letter: "
  guess <- getLine
  case guess of
    [c] -> handleGuess puzzle c >>= runGame
    _   -> putStrLn "Your guess must\
                   \ be a single charater"

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  word <- randomWord'
  let puzzle =
        freshPuzzle (fmap toLower word)
  runGame puzzle