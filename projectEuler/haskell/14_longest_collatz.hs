import Data.List (maximumBy)
import Data.Ord (comparing)

collatz :: Int -> Int
collatz n
  | even n = n `div` 2
  | otherwise = 3 * n + 1

collatzSeq :: Int -> [Int]
collatzSeq n = n : collatzSeq (collatz n)

lenCollatzSeq :: [Int] -> Int
lenCollatzSeq xs = 1 + length (takeWhile (/= 1) xs)

findLongest :: Int -> Int
findLongest x = head $ maximumBy (comparing length) candidates
  where
    candidates = map collatzSeq [1 .. x]

main :: IO ()
main = do
  print $ findLongest 999999
