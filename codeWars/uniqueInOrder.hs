
module UniqueInOrder (uniqueInOrder) where

import Data.List(group)

uniqueInOrder :: Eq a => [a] -> [a]
uniqueInOrder  = map head . group 


