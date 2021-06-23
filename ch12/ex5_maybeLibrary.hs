module SmallLibrary where

--1.
isJust :: Maybe a -> Bool
isJust Nothing = False
isJust _       = True

isNothing :: Maybe a -> Bool
isNothing Nothing = True
isNothing _       = False

--2.
mayybee :: b -> (a -> b) -> Maybe a -> b
mayybee x _ Nothing  = x
mayybee x f (Just a) = f a

--3.
fromMaybe :: a -> Maybe a -> a
fromMaybe a b = mayybee a id b

--4.
listToMaybe :: [a] -> Maybe a
listToMaybe xs = if length xs > 0 then Just $ head xs else Nothing

maybeToList ::  Maybe a -> [a]
maybeToList Nothing  = []
maybeToList (Just a) = [a]

--5.
catMaybes :: [Maybe a] -> [a]
catMaybes []     = []
catMaybes (x:xs) = (maybeToList x) ++ (catMaybes xs)

--6.
flipMaybe :: [Maybe a] -> Maybe [a]
flipMaybe a = case elem True $ map isNothing a of
  True -> Nothing
  False -> Just $ catMaybes a