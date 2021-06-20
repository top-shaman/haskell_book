module TheQuad where

--1.
data Quad =
    One
  | Two
  | Three
  | Four
  deriving (Eq, Show)

  eQuad :: Either Quad Quad
  eQuad = undefined
-- can be 4 + 4 types. cardinality 8

--2. prodQuad :: (Quad, Quad)
--   can be 4 * 4 types, cardinality 16

--3. funcQuad :: Quad -> Quad
--   can be 4 ^ 4 types, cardinality 256

--4. prodTBool :: (Bool, Bool, Bool)
--   can be 4 * 4 * 4 types, cardinality 64

--5. gTwo :: Bool -> Bool -> Bool
--   can be 2 ^ 2 ^ 2 types, cardinality 16

--6. fTwo :: Bool -> Quad -> Quad
--   can be 3 ^ 3 ^ 2 types,