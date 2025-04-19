module NonRepeating (firstNonRepeatingLetter, firstNonRepeatingLetterMap) where

import Data.Char (toUpper)
import Data.Set qualified as S
import qualified Data.Map.Strict as M

firstNonRepeatingLetter :: String -> Maybe Char
firstNonRepeatingLetter [] = Nothing
firstNonRepeatingLetter [x] = Just x
firstNonRepeatingLetter (x:xs) = recf S.empty x xs
  where
    recf :: S.Set Char -> Char -> String -> Maybe Char
    recf set char [] = if toUpper char `S.member`  set then Nothing else Just char
    recf set char rest
      | capChar `S.member` set = recf set nextChar restStr
      | capChar `elem` capRest = recf (capChar `S.insert` set) nextChar restStr
      | otherwise = Just char
      where
        capChar = toUpper char
        capRest = map toUpper rest
        nextChar = head rest
        restStr = tail rest

firstNonRepeatingLetterMap :: String -> Maybe Char
firstNonRepeatingLetterMap str =
  case filter (\c -> freqMap M.! toUpper c == 1) str of
    (x:_) -> Just x
    []    -> Nothing
  where
    freqMap = M.fromListWith (+) [(toUpper c, 1 :: Int) | c <- str]
