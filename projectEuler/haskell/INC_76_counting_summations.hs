isSummation :: [Integer] -> Integer -> Bool
isSummation nums num = sum nums == num

countingSummations :: Integer -> Integer
countingSummations n
    | n <= 1 = 0
    | n == 2 = 1
    | otherwise = 
