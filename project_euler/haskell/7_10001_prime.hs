import Primes

main :: IO ()
main = do
  let n = 10001
  let result = primes !! (n - 1)
  putStrLn (show n ++ "th. Prime Number: " ++ show result)
