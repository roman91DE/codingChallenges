import Numeric (showIntAtBase)
import Data.Char (intToDigit)

bStr :: Integer -> String
bStr n = showIntAtBase 2 intToDigit n ""

dStr :: Integer -> String
dStr = show

isPalindrome :: String -> Bool
isPalindrome s = s == reverse s


dbPali :: Integer -> Integer
dbPali upperBound = sum [x | x <- [0.. upperBound], isPalindrome $ bStr x, isPalindrome $ dStr x]