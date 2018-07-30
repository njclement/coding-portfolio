module Wordsort
( comp
, sort
, score
, scoreWord
, scoreList
) where

import Data.Char

-- This function means "strictly earlier in alphabetical ordering"
comp :: [Char] -> [Char] -> Bool
comp _ [] = False
comp [] (y:ys) = True
comp (x:xs) (y:ys)
  | x < y   = True
  | x > y   = False
  | x == y  = comp xs ys

sort :: [[Char]] -> [[Char]]
sort [] = []
sort [x] = [x]
sort (x:xs) = (sort before) ++ [x] ++ (sort after)
  where before = filter (\y -> comp y x) xs
        after = filter (\y -> not ( comp y x ) ) xs

score :: Char -> Int
score c = ord c - 64

scoreWord :: [Char] -> Int
scoreWord l = sum ( map score l )

scoreList :: [[Char]] -> Int
scoreList [] = 0
scoreList l@(x:xs) = sum (map scoreWord l) + scoreList xs
