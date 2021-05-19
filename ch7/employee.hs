module Employee where

data Employee = Coder
              | Manager
              | Veep
              | CEO
              deriving (Eq, Ord, Show)

reportBoss :: Employee -> Employee -> IO ()
reportBoss e e' =
  putStrLn $ show e ++
             " is the boss of " ++
             show e'

--compare function uses behavior of Ord instance to assume order

employeeRank :: Employee
             -> Employee
             -> IO ()

employeeRank e e' =
  case compare e e' of
    GT -> reportBoss e e'
    EQ -> putStrLn "Neither employee\
                   \ is the boss"
    LT -> (flip reportBoss) e e'

-- needs a function with type Ord to determine ranking, so compare would have to be used after (employeeRank')
employeeRank' :: ( Employee
                -> Employee
                -> Ordering )
              -> Employee
              -> Employee
              -> IO ()

employeeRank' f e e' =
  case f e e' of
    GT -> reportBoss e e'
    EQ -> putStrLn "Neither employee\
                   \ is the boss"
    LT -> (flip reportBoss) e e'

codersRuleCEOsDrool :: Employee
                    -> Employee
                    -> Ordering

codersRuleCEOsDrool Coder Coder = EQ
codersRuleCEOsDrool Coder _ = GT
codersRuleCEOsDrool _ Coder = LT
codersRuleCEOsDrool e e' = compare e e'