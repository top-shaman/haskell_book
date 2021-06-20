module Programmers where

data OperatingSystem = GnuPlusLinux
                     | OpenBSDPlusNevermindJustBSDStill
                     | Mac
                     | Windows
                     deriving (Eq, Show)

data ProgLang = Haskell
              | Agda
              | Idris
              | PureScript
              deriving (Eq, Show)


data Programmer =
  Programmer { os :: OperatingSystem
             , lang :: ProgLang }
  deriving (Eq, Show)

allOperatingSystems :: [OperatingSystem]
allOperatingSystems =
  [ GnuPlusLinux
  , OpenBSDPlusNevermindJustBSDStill
  , Mac
  , Windows
  ]

allLanguages :: [ProgLang]
allLanguages =
  [Haskell, Agda, Idris, PureScript]

{-
allProgrammers :: [Programmer]
allProgrammers =
  foldr (\x acc -> foldr (\y bcc
                -> Programmer { os = x 
                              , lang = y}:bcc) acc allLanguages) [] allOperatingSystems
-}

--using List Comprehensions

allProgrammers :: [Programmer]
allProgrammers =
  [ Programmer {os = os, lang = lang}
  | os <- allOperatingSystems
  , lang <- allLanguages
  ]