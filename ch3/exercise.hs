module Exercise where

entered :: String -> String
entered x = x

exercises :: String -> IO ()
exercises x = do
  putStrLn x
  putStrLn (x !! 4 : "")
  putStrLn (drop 9 x)

thirdLetter :: String -> Char
thirdLetter x = x !! 3

letterIndex :: Int -> Char
letterIndex x = "Curry is awesome!" !! x