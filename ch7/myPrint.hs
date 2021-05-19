module MyPrint where

myPrint :: Show a => a -> IO ()
myPrint a = (putStrLn . show) a