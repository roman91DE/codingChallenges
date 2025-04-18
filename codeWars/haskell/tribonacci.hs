module Tribonacci where

tribonacci :: (Num a) => (a, a, a) -> Int -> [a]
tribonacci (a, b, c) n = take n seq
  where
    addThree :: (Num a) => a -> a -> a -> a
    addThree a b c = a + b + c
    seq = a : b : c : zipWith3 addThree seq (tail seq) (tail (tail seq))
