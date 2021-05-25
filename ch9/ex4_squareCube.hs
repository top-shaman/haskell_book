module SquareCube where


mySqr = [x^2 | x <- [1..5]]
myCube = [x^3 | x <- [1..5]]

--1.
scTuples = [(x,y) | x <- mySqr, y <- myCube]
--2.
sctLessThan50 = [(x,y) | x <- mySqr,
                         y <- myCube,
                         x < 50, y < 50]

--3.
main :: IO ()
main = do
  putStrLn "(mySqr, myCube):"
  putStrLn $ show scTuples ++ "\n"
  putStrLn "(mySqr, myCube) < 50"
  putStrLn $ show sctLessThan50 ++ "\n"
  putStrLn "Square and Cube combinations under 50:"
  putStrLn $ show $ length sctLessThan50