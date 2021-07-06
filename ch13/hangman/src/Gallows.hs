module Gallows where

import Puzzle

renderGallows :: Puzzle -> IO ()
renderGallows (Puzzle _ correct guesses) = do
  let count = incorrectCount correct guesses
  case count of
    0 -> putStrLn  "  __   \n\
                   \ |      \n\
                   \ |     \n\
                   \ |     \n\
                   \ |     \n\
                   \_|______"
    1 -> putStrLn  "  __   \n\
                   \ |  |  \n\
                   \ |     \n\
                   \ |     \n\
                   \ |     \n\
                   \_|______"
    2 -> putStrLn  "  __   \n\
                   \ |  |  \n\
                   \ |  O  \n\
                   \ |     \n\
                   \ |     \n\
                   \_|______"
    3 -> putStrLn  "  __   \n\
                   \ |  |  \n\
                   \ |  O  \n\
                   \ |  |  \n\
                   \ |     \n\
                   \_|______"
    4 -> putStrLn  "  __   \n\
                   \ |  |  \n\
                   \ |  O  \n\
                   \ | /|  \n\
                   \ |     \n\
                   \_|______"
    5 -> putStrLn  "  __   \n\
                   \ |  |  \n\
                   \ |  O  \n\
                   \ | /|\\ \n\
                   \ |     \n\
                   \_|______"
    6 -> putStrLn  "  __   \n\
                   \ |  |  \n\
                   \ |  O  \n\
                   \ | /|\\ \n\
                   \ | /   \n\
                   \_|______"
    7 -> putStrLn  "  __   \n\
                   \ |  |  \n\
                   \ |  O  \n\
                   \ | /|\\ \n\
                   \ | / \\ \n\
                   \_|______"