import Data.List (find)
import Primes (isPrime, primes)

oddCompositeNums :: [Integer]
oddCompositeNums = [n | n <- [2 ..], not $ isPrime n, odd n]

squares :: [Integer]
squares = map (^ 2) [1 ..]

canBeConstructed :: Integer -> Bool
canBeConstructed n = elem n $ [a + 2 * b | a <- pr, b <- sq, a + b < n]
  where
    pr = takeWhile (< n) primes
    sq = takeWhile (< n) squares

firstMiss :: Maybe Integer
firstMiss = find (not . canBeConstructed) oddCompositeNums
