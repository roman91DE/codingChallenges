range :: [Int]
range = [1 .. 100]

sumOfSquares :: [Int] -> Int
sumOfSquares = sum . map (^ 2)

squareOfSum :: [Int] -> Int
squareOfSum = (^ 2) . sum

diff :: [Int] -> Int
diff xs = abs $ sumOfSquares xs - squareOfSum xs
