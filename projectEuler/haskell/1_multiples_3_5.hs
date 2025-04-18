find :: Integer -> Integer -> Integer -> [Integer]
find upperBound n1 n2 = [n | n <- [1 .. upperBound], n `mod` n1 == 0 || n `mod` n2 == 0]

result :: Integer
result = sum $ find 999 3 5
