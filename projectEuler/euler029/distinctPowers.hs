import Data.List

numlist :: [Int]
numlist = [(a^b) | a <- [2..100], b <- [2..100] ]

rr_s :: [Int] -> [Int] -- Remove repeats assuming sorted
rr_s [] = []
rr_s [x] = [x]
rr_s (x:y:t)
  | x == y    = rr_s((y:t))
  | otherwise = [x] ++ rr_s((y:t))

rr :: [Int] -> [Int]
rr = rr_s . sort 

-- This breaks really bad because there are some huge numbers in numlist
--
