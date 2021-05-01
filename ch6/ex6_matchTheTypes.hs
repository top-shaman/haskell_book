module Exercise6 where

  import Data.List
  --Multiple Choice
  --1. The Eq class c) makes equality tests possible
  --2. The type class Ord b) is a subclass of Eq
  --3. Suppose the type class Ord has an operator >. What is the type of >? a) Ord a => a -> a -> Bool
  --4. In x = divMod 16 12 c) the type is a tuple
  --5 The type class Integral includes a) Int and Integer numbers


  --Does it type check?
  --1. No. No Show instance; had to add deriving
  --data Person = Person Bool deriving Show
  --printPerson :: Person -> IO ()
  --printPerson person = putStrLn (show person)

  --2 No. No Eq instance; had to add Eq to deriving
  --data Mood = Blah
  --          | Woot deriving (Eq, Show)

  --settleDown x = if x == Woot
  --                  then Blah
  --                  else x
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
  --s1 = Sentence "dogs" "drool"
  s2 = Sentence "Julie" "loves" "dogs"


  --Given a datatype declaration, what can we do?

  --Given the following datatype definitions:
  data Rocks = Rocks String deriving (Eq, Show)

  data Yeah = Yeah Bool deriving (Eq, Show)

  data Papu = Papu Rocks Yeah deriving (Eq, Ord, Show)

  --1.
  --phew = Papu "chases" True -- no, because type isn't given
  --2.
  truth = Papu (Rocks "chomskydoz") (Yeah True) -- yes
  --3.
  equalityForAll :: Papu -> Papu -> Bool
  equalityForAll p p' = p == p' --yes, because p & p' are expected to be type Papu
  --4.
  comparePapus :: Papu -> Papu -> Bool
  comparePapus p p' = p > p' --no, because Ord isn't instanced


  --Match the types
  --1.
    --i :: Num a => a
    --i = 1
    --cannot be replaced with 'i :: a' because there is no instance
    --for (Num a) arising from the literal

  --2.
    f :: Float
    f = 1.0
    --cannot be replaced with 'f :: Num a => a' because Num defaults
    --to Integer, it expects that rather than a float

  --3.
    f' :: Float
    f' = 1.0
    --can be replaced with 'f' :: Fractional a => a'

  --4.
    f'' :: Float
    f'' = 1.0
    --cannot replace with 'f'' :: RealFrac' work because RealFrac
    --needs 2 arguments

  --5.
    freud :: a -> a
    freud x = x
    --can be replaced with 'freud :: Ord a => a -> a' because x type
    --doesn't imply anything other than identity

  --6.
    freud' :: a -> a
    freud' x = x
    --can be replaced with 'freud :: Int -> Int' because x type
    --doesn't imply anything other than identity


  --7.
    myX = 1 :: Int

    sigmund :: Int -> Int
    sigmund x = myX
    --since myX is already typed as an Int, typing 'sigmund' as
    --'a -> a' conflicts with the expected type for sigmund

  --8.
    myX' = 1 :: Int

    sigmund' :: Int -> Int
    sigmund' x = myX'
    --since myX is already typed as an Int, typing 'sigmund' as
    --'Num a => a -> a' conflicts with the expected type for sigmund
    --because it's a broader definition

  --9.
    jung :: Ord a => [a] -> a
    jung xs = head (sort xs)
    --can be replaced with 'jung :: [Int] -> Int' because listed Int's
    --are instanced within Ord

  --10.
    young :: [Char] -> Char
    young xs = head (sort xs)
    --can be replaced with 'young :: Ord a => [a] -> a' because listed
    --chars are instanced within Ord

  --11.
    mySort :: [Char] -> [Char]
    mySort = sort

    signifier :: [Char] -> Char
    signifier xs = head (mySort xs)
    --cannot be replaced with 'signifier :: Ord a => [a] -> a' because
    --mySort expects [Char] as input, more specified than Ord a