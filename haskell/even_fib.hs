
-- each new term in the Fibonacci sequence is generated by adding the previous two terms. 
-- By starting with 1 and 2, the first 10 terms will be:
--
-- 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
--
-- By considering the terms in the Fibonacci sequence whose values do not exceed four million,
-- find the sum of the even-valued terms.

fib :: Int -> [Int]
fib 0 = [1]
fib 1 = 1 : (fib 0)
fib n = (x+y):rest
    where rest@(x:y:xs) = fib $ n-1

ans =  sum $ filter even $ fib 27          
