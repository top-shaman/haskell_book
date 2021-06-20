module LanguageExercises where

--Language Exercises
--1.
capitalizeWord :: String -> String
capitalizeWord a = (toUpper $ head a) : tail a

--2.
capitalizeParagraph :: String -> String
capitalizeParagraph []       = []
capitalizeParagraph as@(a:_) = capitalizeWord $ split1 as ++ (capitalizeParagraph $ split2 as)
  where split1 a             = takeWhile (/='.') a ++ postSplit a
        postSplit            = takeWhile (not . isLetter) . dropWhile (/='.')
        split2               = dropWhile (not . isLetter) . dropWhile (/='.')