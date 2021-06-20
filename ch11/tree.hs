module BinaryTree where

data BinaryTree a =
    Leaf
  | Node (BinaryTree a) a (BinaryTree a)
  deriving (Eq, Ord, Show)

insert :: Ord a
       => a
       -> BinaryTree a
       -> BinaryTree a
insert b Leaf = Node Leaf b Leaf
insert b (Node left a right)
  | b == a = Node left a right
  | b < a  = Node (insert b left) a right
  | b > a  = Node left a (insert b right)

mapTree :: (a -> b)
        -> BinaryTree a
        -> BinaryTree b
mapTree _ Leaf = Leaf
mapTree f (Node left a right) =
  Node (mapTree f left) (f a) (mapTree f right)

testTree :: BinaryTree Integer
testTree =
  Node (Node Leaf 3 Leaf)
       1
       (Node Leaf 4 Leaf)

mapExpected =
  Node (Node Leaf 4 Leaf)
       2
       (Node Leaf 5 Leaf)

mapOkay =
  if mapTree (+1) testTree == mapExpected
  then print "yup OK!"
  else error "test failed!"

preorder :: BinaryTree a -> [a]
preorder (Node (Node _ a _) b (Node _ c _)) = [b,a,c]

inorder :: BinaryTree a -> [a]
inorder (Node (Node _ a _) b (Node _ c _)) = [a,b,c]

postorder :: BinaryTree a -> [a]
postorder (Node (Node _ a _) b (Node _ c _)) = [a,c,b]



testPreorder :: IO ()
testPreorder =
  if preorder testTree == [2, 1, 3]
  then putStrLn "Preorder fine!"
  else putStrLn "Bad news bears."

testInorder :: IO ()
testInorder =
  if inorder testTree == [1, 2, 3]
  then putStrLn "Inorder fine!"
  else putStrLn "Bad news bears."

testPostorder :: IO ()
testPostorder =
  if postorder testTree == [1, 3, 2]
  then putStrLn "Postorder fine!"
  else putStrLn "Bad news bears"

main :: IO ()
main = do
  testPreorder
  testInorder
  testPostorder

foldTree :: (a -> b -> b)
         -> b
         -> BinaryTree a
         -> b
foldTree _ z Leaf = z
foldTree f z (Node left x right) =
  foldTree f (f x (foldTree f z left)) right