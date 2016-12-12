-- Всяка функция в хаскел има само 1 аргумент
import Data.Bits
sumDigits :: Int -> Int
sumDigits n
    | n == 0 = 0
    | otherwise = (mod n 10) + sumDigits (div n 10)

productOfDigits :: Int -> Int
productOfDigits n
    | n < 10 = n
    | otherwise = (mod n 10) * productOfDigits (div n 10)


hasDigit :: Int -> Int -> Bool
hasDigit 0 x = False
hasDigit xs x = x == lastDigit || hasDigit x butLast
    where
        lastDigit = xs `mod` 10
        butLast = xs `div` 10

containsDigits :: Int -> Int -> Bool
containsDigits d1 d2 = all (hasDigit d1)  ys
    where
        ys = digs d2

factors n = [x | x <- [1..n], n `mod` x == 0]
isPrime' n = factors n == [1, n]

factorsWithoutItself n = init (factors n)

factorsSum n = foldl (+) 0 (factorsWithoutItself n)

interestingNumber n = n == factorsSum(factorsSum(n))

sign n
    | n >= 0 = 0
    | otherwise = 1

quadrant _ 0 = 0
quadrant 0 _ = 0
quadrant a b = (x `xor` y) + y + y + 1
    where
        x = sign a
        y = sign b

quadrant' 1 1 = 1
quadrant' 1 (-1) = 4
quadrant' (-1) 1 = 2
quadrant' (-1) (-1) = 3
quadrant' 0 0 = 0
quadrant' a b = quadrant' (signum a) (signum b)



isPrime :: Int -> Bool
isPrime n
    | n <= 1 = False
    | otherwise = isPrime' 2 n
        where
            isPrime' current n
                | current == n = True
                | mod n current == 0 = False
                | otherwise = isPrime' (current + 1) n


truncatablePrime 0 = True
truncatablePrime x = isPrime x && truncatablePrime(x `div` 10)

digs :: Integral x => x -> [x]
digs 0 = []
digs x = digs (x `div` 10) ++ [x `mod` 10]

