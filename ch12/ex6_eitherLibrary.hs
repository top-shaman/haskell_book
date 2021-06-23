module EitherLibrary where



lefts' :: [Either a b] -> [a]
lefts' xs = foldr (\a b -> unLeft a b) [] xs
  where unLeft (Left a) b  = a : b
        unLeft (Right a) b = b

rights' :: [Either a b] -> [b]
rights' xs = foldr (\a b -> unRight a b) [] xs
  where unRight (Left a) b  = b
        unRight (Right a) b = a : b

partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' xs = (lefts' xs, rights' xs)

eitherMaybe' :: (b -> c)
             -> Either a b
             -> Maybe c
eitherMaybe' _ (Left _)  = Nothing
eitherMaybe' f (Right b) = Just (f b)

either' :: (a -> c)
        -> (b -> c)
        -> Either a b
        -> c
either' ac _ (Left a)  = ac a
either' _ bc (Right b) = bc b

eitherMaybe'' :: (b -> c)
              -> Either a b
              -> Maybe c
eitherMaybe'' f = either' (const Nothing) (Just . f)