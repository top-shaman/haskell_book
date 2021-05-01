--1. No. No Show instance; had to add deriving
data Person = Person Bool deriving Show
printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)

--2 No. No Eq instance; had to add Eq to deriving
data Mood = Blah
          | Woot deriving (Eq, Show)

settleDown x = if x == Woot
                  then Blah
                  else x
--3
--a) "Blah" & "Woot"
--b) Error, because it isnt expecting any inputs aside from "Woot" and "Blah"
--c) Error, because Blah & Woot aren't global variables, and they don't have an Ord instance

--4 Yes, but s1 returns an error because there's no Object.
type Subject = String
type Verb = String
type Object = String

data Sentence =
  Sentence Subject Verb Object
  deriving (Eq, Show)
s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"