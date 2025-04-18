import Data.Char (isDigit)

createFract :: String
createFract = filter isDigit $ show [1 ..]

sumPositions :: Int  -> Integer
sumPositions n = sum selection
  where
    xs = take (10 ^ n) createFract
    indices = take n $ map (10 ^) [0..]
    selection = [read ((xs !! i): "" )| i <- indices]
