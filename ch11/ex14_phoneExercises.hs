module PhoneExercises where

import Data.Char
import Data.List

--1. Create Data Structure that can be manipulated 
--type aliases
type Digit = Char
type Digits = String
type Presses = Int

--data type definitions
data Button = Button Digit Digits deriving (Eq, Ord, Show)
data Phone = Phone [Button] deriving (Eq, Show)

--phone constructor
phone :: Phone
phone = Phone
  [ Button '1' "1", Button '2' "abc2", Button '3' "def3"
  , Button '4' "ghi4", Button '5' "jkl5", Button '6' "mno6"
  , Button '7' "pqrs7", Button '8' "tuv8", Button '9' "wxyz9"
  , Button '*' "^", Button '0' " 0", Button '#' ",."
  ]

--valid sets
validChar :: [Char]
validChar = ['a'..'z'] ++ ['A'..'Z'] ++ ['0'..'9'] ++ " ,."

validDigit :: [Digit]
validDigit = ['0'..'9'] ++ "*#"

--validators
isValidChar :: Char -> Bool
isValidChar = flip elem validChar

isValidDigit :: Digit -> Bool
isValidDigit = flip elem validDigit

--parse (to Button)
digitFromButton :: Button -> Digit
digitFromButton (Button d _) = d

digitsFromButton :: Button -> Digits
digitsFromButton (Button _ ds) = ds

--parse (to Digit/to Char)
buttonFromDigit :: Phone -> Digit -> Button
buttonFromDigit (Phone (b:bs)) d
  | not $ isValidDigit d = Button '\\' "\\"
  | otherwise = case digitFromButton b == d of
                  True  -> b
                  False -> buttonFromDigit (Phone bs) d

buttonFromChar :: Phone -> Digit -> Button
buttonFromChar (Phone (b:bs)) char
  | not $ isValidChar char = Button '\\' "\\"
  | otherwise = case elem char $ digitsFromButton b of
                  True  -> b
                  False -> buttonFromChar (Phone bs) char

--from digit to char
digitFromChar :: Phone -> Char -> Digit
digitFromChar p char = digitFromButton $ buttonFromChar p char

-- # of presses from Char entered
presses :: Button -> Char -> Presses
presses b char
  | not $ isValidChar char = 0
  | otherwise = pressCount b char 1
    where pressCount (Button x (d:ds)) char count
            | d == char = count
            | otherwise = pressCount (Button x ds) char (count + 1)

digitPresses :: Phone
             -> Char
             -> [(Digit, Presses)]
digitPresses pho char
  | not $ isValidChar char = []
  | isUpper char = ('*',1) : (taps pho $ toLower char)
  | otherwise = taps pho char
    where taps p c = ((digitFromChar p c), (presses (buttonFromChar p c) c)) : []

--2.
stringToTaps :: Phone
            -> String
            -> [(Digit, Presses)]
stringToTaps _ "" = []
stringToTaps p (x:xs) = digitPresses p x ++ stringToTaps p xs

stringsToTaps :: Phone
              -> [String]
              -> [[(Digit, Presses)]]
stringsToTaps _ [] = []
stringsToTaps p (x:xs) = stringToTaps p x : stringsToTaps p xs

--3.
fingerTaps :: [(Digit, Presses)] -> Presses
fingerTaps [] = 0
fingerTaps ((_, presses) : xs) = presses + fingerTaps xs

--4. 
mostPopularLetter :: String -> Char
mostPopularLetter xs = head $ findMost $ group $ sort $ xs
  where findMost []       = []
        findMost (x:xs)   = myMax x (findMost xs)
          where myMax x y = case length x > length y of
                              True ->  if isLetter $ head x then x else y
                              False -> y

tapsToChars :: Phone -> [(Digit,Presses)] -> [Char]
tapsToChars _ [] = []
tapsToChars p (x:[]) = digitPressToChar p x : tapsToChars p []
tapsToChars p (x:y:xs) 
  | digitPressToChar p x == '^' = (toUpper $ digitPressToChar p y) : (tapsToChars p xs)
  | otherwise = digitPressToChar p x : tapsToChars p (y:xs)

digitPressToChar :: Phone -> (Digit, Presses) -> Char
digitPressToChar p (digit, presses) = digitsFromButton (buttonFromDigit p digit) !! (presses-1)

--reveals most popular letter and the amount of taps it costs each time
popularLetterAndCost :: Phone -> String -> (Char, Presses)
popularLetterAndCost p message = (char, presses (charButton) char)
  where char = mostPopularLetter message
        charButton = buttonFromChar phone char

convo :: [String]
convo =
  ["Wanna play 20 questions",
  "Ya",
  "U 1st haha",
  "Lol OK. Have u ever tasted alcohol",
  "Lol ya",
  "Wow ur cool haha. Ur turn",
  "OK. Do u think I am pretty Lol",
  "Lol ya",
  "Just making sure rofl ur turn"]

--5.
coolestLetter :: [String] -> Char
coolestLetter = mostPopularLetter . concat

mostPopularWord :: String -> String
mostPopularWord xs = head $ findMost $ group $ sort $ split xs
  where split []= []
        split x = matched : (split $ dropWhile (not . isLetter) rest)
          where
            (matched, rest) = span isLetter x
        findMost []       = []
        findMost (x:xs)   = myMax x (findMost xs)
          where myMax x y = case length x > length y of
                              True ->  x
                              False -> y

coolestWord :: [String] -> String
coolestWord = mostPopularWord . map toLower . concatMap (++" ")

--most used letter: 'a'
--most used word : "lol"