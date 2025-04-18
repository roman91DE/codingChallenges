module DigitalRoot where

digitalRoot :: (Integral a) => a -> a
digitalRoot n 
    | n < 10 = n
    | otherwise = digitalRoot $ sum digits
        where
            digits = extractDigits n



extractDigits :: (Integral a) => a -> [a]
extractDigits n = loop n []
  where
    loop :: (Integral a) => a -> [a] -> [a]
    loop n acc
      | n == 0 = acc
      | otherwise =
          let dig = n `mod` 10
              rest = n `div` 10
           in loop rest (dig : acc)
