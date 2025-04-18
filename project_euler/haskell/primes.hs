module Primes (isPrime, primes) where

isPrime :: Integer -> Bool
isPrime n
  | n <= 1 = False
  | otherwise = null [k | k <- [2 .. upperBound], n `mod` k == 0]
  where
    upperBound :: Integer
    upperBound = floor $ sqrt $ fromIntegral n

primes :: [Integer]
primes = filter isPrime [1 ..]
