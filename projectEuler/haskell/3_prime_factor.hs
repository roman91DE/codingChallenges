import Primes

simpleFacts :: Integer -> [Integer] -> [Integer]
simpleFacts n acc
  | isPrime n = n : acc
  | otherwise = simpleFacts (n `div` smallestDiv) (smallestDiv : acc)
  where
    smallestDiv = head [p | p <- primes, n `mod` p == 0]

largestPrimeFactor :: Integer -> Integer
largestPrimeFactor n = head $ simpleFacts n []

result = largestPrimeFactor 600851475143

main = do
  print result
