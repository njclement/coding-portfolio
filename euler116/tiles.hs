import Data.List

redTiles :: Integer -> Integer 
redTiles 0 = 1
redTiles 1 = 1
redTiles n = redTiles (n - 1) + redTiles (n - 2)
