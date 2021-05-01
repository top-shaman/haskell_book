module DateBasic where

data DayOfWeek =
  Mon | Tue | Wed | Thu | Fri | Sat | Sun
  deriving (Eq, Show) -- necessary to allow datatype to print in REPL.
  --since we instance Eq and Ord, we don't need to derive them
  --If we wanted to not establish Friday as the best day we would
  --need to derive Ord. We don't have to instance Eq if we don't
  --want to-- deriving can implicitly figure out everythign we compiled

data Date =
  Date DayOfWeek Int
  deriving Show

--instance Eq DayOfWeek where
--  (==) Mon Mon = True
--  (==) Tue Tue = True
--  (==) Wed Wed = True
--  (==) Thu Thu = True
--  (==) Fri Fri = True
--  (==) Sat Sat = True
--  (==) Sun Sun = True
--  (==) _ _     = True

instance Eq Date where
  (==)  (Date weekday dayOfMonth)
        (Date weekday' dayOfMonth') =
      weekday == weekday'
   && dayOfMonth == dayOfMonth'

instance Ord DayOfWeek where -- establishes that Friday is the best day; all days are worse than Friday
  compare Fri Fri = EQ
  compare Fri _   = GT
  compare _ Fri   = LT
  compare _ _     = EQ