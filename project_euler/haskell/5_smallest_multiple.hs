nums :: [Int]
nums = [1 .. 20]

isDivisibleBy :: Int -> [Int] -> Bool
isDivisibleBy n = all (\x -> n `mod` x == 0)

bruteForceSolution :: [Int] -> Int
bruteForceSolution xs = head solutions
  where
    lastElem = last xs
    solutions = [s | s <- [lastElem, (2 * lastElem) ..], isDivisibleBy s xs]

lcmSolution :: [Int] -> Int
lcmSolution = foldl lcm 1

main :: IO ()
main = do
  let sol = bruteForceSolution nums
  putStrLn $ "Brute Force:" ++ show sol
