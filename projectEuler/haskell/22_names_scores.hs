{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use zipWith" #-}
{-# HLINT ignore "Use uncurry" #-}

import Data.Char (isLetter)
import Data.List (sort)
import qualified Data.Map as Map

processContent :: String -> [String]
processContent s = sort $ map stripper $ splitter ',' s
  where
    splitter :: Char -> String -> [String]
    splitter c = foldr step [[]]
      where
        step x acc = if x == c then [x] : acc else (x : head acc) : tail acc

    stripper :: String -> String
    stripper = filter isLetter

toInt :: Char -> Int
toInt c = Map.findWithDefault 0 c alphabetMap
  where
    alphabetMap = Map.fromList (zip ['A' .. 'Z'] [1 ..])

namesScores :: [String] -> [Int]
namesScores = map (sum . map toInt)

totalScores :: [Int] -> Int
totalScores xs = sum $ map (\(a, b) -> a * b) $ zip xs [1 ..]

pipeline :: String -> Int
pipeline = totalScores . namesScores . processContent

main :: IO ()
main = do
  content <- readFile "../data/0022_names.txt"
  let result = pipeline content
  print result
