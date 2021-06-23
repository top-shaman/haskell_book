module BinaryTree where

data BinaryTree a =
    Leaf
  | Node (BinaryTree a) a (BinaryTree a)
  deriving (Eq, Ord, Show)

--1.
unfold :: (a -> Maybe (a,b,a))
       -> a
       -> BinaryTree b
unfold f x = case f x of
  Nothing               -> Leaf
  Just (left, x, right) -> (Node (unfold f left) (x) (unfold f right))

--2.
treeBuild :: Integer -> BinaryTree Integer
treeBuild n
  | n < 0 = Leaf
  | otherwise = unfold f 0
    where
      f count
        | count == n = Nothing
        | otherwise  = Just (count+1,count,count+1)