type Triplet = (Int, Int, Int)

isPythagoreanTriplet :: Triplet -> Bool
isPythagoreanTriplet (a, b, c)
  | not (a < b && b < c) = False
  | otherwise = a ^ 2 + b ^ 2 == c ^ 2

genTriplets :: [Triplet]
genTriplets =
  [ (a, b, c)
  | a <- [3 ..],
    b <- [a + 1 ..],
    c <- [b + 1 ..],
    isPythagoreanTriplet (a, b, c)
  ]
