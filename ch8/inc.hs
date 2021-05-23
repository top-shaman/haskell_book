module Inc where

inc :: Num a => a -> a
inc = (+1)

three = inc . inc . inc $ 0
three' = (inc . inc . inc) 0

--Composition bakes number of applications of (inc) into source code
--If we want to make a general function where we can apply (inc) an
--indefinite number of times & allow us to specify as an argument
--how many times it should be applied:

incTimes :: (Eq a, Num a) => a -> a -> a
incTimes 0 n =
  n
incTimes times n =
  1 + (incTimes (times - 1) n)

applyTimes :: (Eq a, Num a) =>
              a -> (b -> b) -> b -> b
applyTimes 0 f b = b
applyTimes n f b = f (applyTimes (n-1) f b)

incTimes' :: (Eq a, Num a) => a -> a -> a
incTimes' times n = applyTimes times (+1) n