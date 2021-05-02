--Reading Syntax
--1.
  --a) correct; concat [[1, 2, 3], [4, 5, 6]]
  --b) (++) [1,2, 3] [4, 5, 6]
  --c) correct; (++) "hello" " world"
  --d) "hello" ++ " world"
  --e) "hello" !! 4
  --f) (!!) "hello" 4
  --g) take 4 "lovely"
  --h) take 3 "awesome"
--2.
  --a) [6, 12, 18]
  --b) "rainbow"
  --c) 10
  --d) 10
  --e) "Jules"
  --f) [2, 3, 4, 6, 8, 9]

--Building Functions
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