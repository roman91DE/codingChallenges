data PickedPeaks = PickedPeaks { pos :: [Int], peaks :: [Int]} deriving (Eq, Show)


isLocalMax :: [Int] -> Bool
isLocalMax [p, c, n]
  | p > c = False
  | c < n = False
  | otherwise = True

slidingWindow  :: Int -> [Int] -> [[Int]]
slidingWindow n xs
  | n > length xs = []
  | otherwise = take n xs : slidingWindow n (tail xs)


pickPeaks :: [Int] -> PickedPeaks
pickPeaks points = PickedPeaks{pos = idxlist, peaks = valList}
    where
        sliding = slidingWindow 3 points
        mask = False : map isLocalMax sliding ++ [False]
        intList = [0..] 
        zipped = zip (zip mask points) intList
        filtered = filter (\((isMax, _), _) -> isMax) zipped
        extract :: [((Bool, Int), Int)] -> [(Int, Int)]
        extract = map (\((_, val), idx) -> (val, idx))
        vP = extract filtered
        valList = map fst vP
        idxlist = map snd vP


points :: [Int]
points = [3, 2, 3, 6, 4, 1, 2, 3, 2, 1, 2, 3]


