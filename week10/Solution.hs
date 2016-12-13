-- file Solution.hs
module Solution
( listToNumber,
  suffix,
  occurrences,
  removeAt
) where

listToNumber [] = 0
listToNumber n = foldl (\acc x -> acc * 10 + x) 0 n

suffix xs ys = xs == drop (length ys - length xs) ys

occurrences :: [Int] -> [Int] -> [Int]
occurrences xs ys = map (flip(count) ys) xs
  where
    count y = length . filter (y==)


removeAt :: Int -> [a] -> [a]

removeAt n xs
  | n < 0 || n >= length xs = error "Index out of bounds"
  | otherwise = let (ys,zs) = splitAt n xs in ys ++ tail zs

