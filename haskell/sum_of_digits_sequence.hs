
-- Let a0, a1, a2, ... be an integer sequence defined by:
--
-- a0 = 1;
-- for n ≥ 1, an is the sum of the digits of all preceding terms.
-- The sequence starts with 1, 1, 2, 4, 8, 16, 23, 28, 38, 49, ...
-- You are given a[10^6] = 31054319.
--
-- Find a[10^15].

-- gen ::  (a -> a) -> a -> [a]
-- gen f s = [23]

unfold p h t x 
     | p x = []
     | otherwise = h x : unfold p h t (t x)

next :: Integer -> Integer
next last = last + (sumofdigits last)

iter :: (a -> a) -> a -> Int -> a 
iter f x n
   | n <= 1    = x
   | otherwise = iter f (f $! x) (n-1)

gen :: Int -> Integer
gen x = iter next 1 x

--sumofdigits x = 1
--{-
sumofdigits :: Integer -> Integer
sumofdigits x 
          | x <= 9 = x
          | otherwise = sum alldigits
          where 
            alldigits = unfold (==(getnumdigits x)) (getplacedigit $ fromInteger x) (+1) 0
            powersOf10 = [10^i | i <- [0..]]
--}


getnumdigits = (+1) . floor . logBase 10 . fromInteger

getplacedigit:: Integer -> Integer -> Integer
getplacedigit subject place = let scale = 10 ^ (place)
                               in (subject `mod` (10*scale)) `div` scale

ans = gen $ 10^15


main = print $ fromInteger ans
