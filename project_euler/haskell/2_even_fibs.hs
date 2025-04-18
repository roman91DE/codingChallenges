fibSeq :: [Int]
fibSeq = 1 : 2 : zipWith (+) fibSeq (tail fibSeq)

result :: Int
result = sum $ filter even $ takeWhile (< 4000000) fibSeq
