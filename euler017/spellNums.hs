import Data.List
import Data.Char

hundreds :: Int -> Int
hundreds n = div (mod n 1000) 100

tens :: Int -> Int
tens n = div (mod n 100) 10

ones :: Int -> Int
ones n = mod n 10

spellDigit :: Int -> [Char]
spellDigit 0 = "zero"
spellDigit 1 = "one"
spellDigit 2 = "two"
spellDigit 3 = "three"
spellDigit 4 = "four"
spellDigit 5 = "five"
spellDigit 6 = "six"
spellDigit 7 = "seven"
spellDigit 8 = "eight"
spellDigit 9 = "nine"

spell :: Int -> [[Char]]
spell n  = (spellHundreds n) ++ (spellTwos n)

spellHundreds :: Int -> [[Char]]
spellHundreds n 
  | hundreds n == 0             = []
  | tens n == 0 && ones n == 0  = [spellDigit (hundreds n), "hundred"]
  | otherwise                   = [spellDigit (hundreds n), "hundred", "and"]

spellTwos :: Int -> [[Char]]
spellTwos n 
  | tens n == 1 = spellTeens (ones n)
  | otherwise   = (spellTens (tens n)) ++  (spellOnes (ones n))

spellTeens :: Int -> [[Char]]
spellTeens 0 = ["ten"]
spellTeens 1 = ["eleven"]
spellTeens 2 = ["twelve"]
spellTeens 3 = ["thirteen"]
spellTeens 4 = ["fourteen"]
spellTeens 5 = ["fifteen"]
spellTeens 6 = ["sixteen"]
spellTeens 7 = ["seventeen"]
spellTeens 8 = ["eighteen"]
spellTeens 9 = ["nineteen"]

spellTens :: Int -> [[Char]]
spellTens 0 = []
spellTens 2 = ["twenty"]
spellTens 3 = ["thirty"]
spellTens 4 = ["forty"]
spellTens 5 = ["fifty"]
spellTens 6 = ["sixty"]
spellTens 7 = ["seventy"]
spellTens 8 = ["eighty"]
spellTens 9 = ["ninety"]

spellOnes :: Int -> [[Char]]
spellOnes 0 = []
spellOnes n = [spellDigit n]

main = do
  let l = [1..999]
  let words = concat ( concat ( map spell l ) )  ++ "onethousand"
  putStrLn (show words)
  putStrLn (show (length words))
  






