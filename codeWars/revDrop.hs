module DropFromEnd (dropFromEnd) where

dropFromEndSlow :: Int -> [a] -> [a]
dropFromEndSlow n xs
  | n >= length xs = []
  | n < 0 = xs
  | otherwise = reverseDrop xs
      where
        reverseDrop = reverse . drop n . reverse



dropFromEndLessSlow :: Int -> [a] -> [a]
dropFromEndLessSlow n xs
  | n >= len = []
  | n < 0 = xs
  | otherwise = take newLen xs
      where
        len = length xs
        newLen = len - n


dropFromEnd :: Int -> [a] -> [a]
dropFromEnd n xs
  | n < 0 = xs
  | otherwise = map fst zipped
    where
        zipped = zip xs (drop n xs)

        



l = [1..100]