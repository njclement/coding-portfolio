import Data.Char
import Data.List

sieveSingle :: Int -> [Int] -> [Int]
sieveSingle k (x:xs) = [0] ++ (take (k-1) xs) ++ sieveSingle k (drop (k-1) xs)
sieveSingle k [] = []

sieve :: [Int] -> [Int] -> [Int]
sieve (x:xs) y = sieve xs ((take (2*x) y) ++ sieveSingle x (drop (2*x) y))
sieve [] y = y

removeZeros :: [Int] -> [Int]
removeZeros (0:xs) = removeZeros xs
removeZeros (x:xs) = (x:removeZeros xs)
removeZeros [] = []
