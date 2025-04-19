module Codewars.Kata.IsUpperCase where

import Data.Char(isUpper, isLetter)

isUpperCase :: String -> Bool
isUpperCase = all isUpper . filter isLetter