module RangeExtractor.JorgeVS.Kata where

import Data.List (intercalate)

groupVals :: [Integer] -> [[Integer]]
groupVals [] = []
groupVals (x:xs) = go [x] xs
  where
    go :: [Integer] -> [Integer] -> [[Integer]]
    go acc [] = [acc]
    go acc (y:ys)
      | y == last acc + 1 = go (acc ++ [y]) ys
      | otherwise = acc : go [y] ys

toString :: [Integer] -> String
toString [] = ""
toString [a] = show a
toString [a, b] = show a ++ "," ++ show b
toString xs
  | length xs >= 3 = show (head xs) ++ "-" ++ show (last xs)
  | otherwise = intercalate "," (map show xs)

solution :: [Integer] -> String
solution = intercalate "," . map toString . groupVals