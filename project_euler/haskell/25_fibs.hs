import Data.List (findIndex)

integerLength :: Integer -> Int
integerLength = length . show

fibSeq :: [Integer]
fibSeq = 1 : 1 : zipWith (+) fibSeq (tail fibSeq)

firstIdx :: Int -> Maybe Int
firstIdx n = findIndex p fibSeq
  where
    p x = integerLength x >= n

oneIdxed :: Int -> Maybe Int
oneIdxed = fmap (+ 1) . firstIdx
