import Data.List

data Sequence = Sequence  { list :: [Int]
                          , lower :: Int
                          , upper :: Int } deriving (Show)

convolute :: Sequence -> Sequence -> Sequence
convolute s t = Sequence (diagSum array) (lower s + lower t) (upper s + upper t)
  where array = [ [ (x * y) | x <- (list s) ] | y <- (list t) ]

diagSum :: (Num a) => [[a]] -> [a]
diagSum [] = []
diagSum [x] = x
diagSum (x:y:ts) = diagSum (z:ts)
  where z = termwiseSum (0:x) (y)

termwiseSum :: (Num a) => [a] -> [a] -> [a]
termwiseSum [] ys = ys
termwiseSum xs [] = xs
termwiseSum (x:xs) (y:ys) = ((x + y):(termwiseSum xs ys))

list2Seq :: [Int] -> Sequence
list2Seq l = Sequence l (0) (length l - 1)

penceList :: Int -> Sequence 
penceList n = list2Seq l
  where l = take 201 ( cycle ( [1] ++ (replicate (n-1) 0) ) )

convoluteBunch :: [Sequence] -> Sequence 
convoluteBunch [] = list2Seq [0]
convoluteBunch [x] = x 
convoluteBunch (x:y:ts) = convoluteBunch ((convolute x y):ts)
