import Primes

xs = takeWhile (< 2000000) primes

summed = sum xs

main = do
  print summed
