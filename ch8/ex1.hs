module ApplyTimes where

applyTimes :: (Eq a, Num a) =>
              a -> (b -> b) -> b -> b
applyTimes 0 f b = b
applyTimes n f b = f (applyTimes (n-1) f b)

-- (applyTimes 5 (+1) 5) evaluates to 10
-- the function (+1) is applied to 5 a number of 5 times