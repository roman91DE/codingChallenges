isPalindrom :: Integer -> Bool
isPalindrom n = reverse (show n) == show n

candidates :: [Integer]
candidates = [a * b | a <- reverse [100 .. 999], b <- reverse [100 .. 999]]

result :: Integer
result = maximum $ filter isPalindrom candidates
