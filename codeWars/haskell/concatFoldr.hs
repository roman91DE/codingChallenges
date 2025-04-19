{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Eta reduce" #-}
{-# HLINT ignore "Fuse foldr/map" #-}


-- foldConcat :: [[a]] -> [a]
-- foldConcat nestedList = foldr (foldr p q) r nestedList

-- p :: [a] -> [a -> [a]] -> [a -> [a]]
-- p x acc = (:x):acc

-- q = []

-- r = []


-- foldr :: (a -> b -> b) -> b -> t a -> b
--          (function  )-> acc -> nlist -> list