

-- If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
-- Find the sum of all the multiples of 3 or 5 below 1000.

target = 1000

of_three = [3,6..target]

of_five = [5,10..target]
          
divisableby number = \x -> (x `mod` 3) == 0

sum = foldr (+) 0 (of_three ++ (filter (\x -> not $ (divisableby 3 x) ) of_five))



