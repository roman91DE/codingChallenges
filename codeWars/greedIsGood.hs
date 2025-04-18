-- module Greed (score) where
import Data.List (group, sort)

score :: [Int] -> Int
score dice = case triple of
  Just (v, remaining) ->
    let tripleScore = if v == 1 then 1000 else v * 100
    in tripleScore + scoreSingle remaining
  Nothing -> scoreSingle dice
  where
    triple = existsThreeTimes dice

scoreSingle :: [Int] -> Int
scoreSingle = sum . map singleScore
  where
    singleScore 1 = 100
    singleScore 5 = 50
    singleScore _ = 0

existsThreeTimes :: [Int] -> Maybe (Int, [Int])
existsThreeTimes xs = case filter (\g -> length g >= 3) (group $ sort xs) of
  (g:_) -> let v = head g
               (before, after) = break (== v) xs
               remaining = before ++ drop 3 after  -- remove first 3 occurrences
           in Just (v, remaining)
  [] -> Nothing