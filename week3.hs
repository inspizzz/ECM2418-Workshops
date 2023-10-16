-- main
main :: IO()

--  task 1
inc :: Int -> Int
inc = (+) 1

-- task 2
incList :: [Int] -> [Int]
incList [] = []
incList (x:xs) = inc x : incList xs

-- task 3
neg :: Bool -> Bool
neg True = False
neg False = True

-- task 4
negList :: [Bool] -> [Bool]
negList [] = []
negList (x:xs) = neg x : negList xs

-- task 5
mapList :: (a->b) -> [a] -> [b]
mapList f [] = []
mapList f (x:xs) = f x : mapList (f) xs

-- task 6
single :: Int -> Bool
single x | x < 10 = True
single x | x >= 10 = False

-- task 7
singleList :: [Int] -> [Int]
singleList [] = []
singleList (x:xs) 
    | single x = x : singleList xs
    | otherwise = singleList xs
    
-- task 8
palindrome :: String -> Bool
palindrome s = s == reverse s

-- task 9
palindromeList :: [String] -> [String]
palindromeList [] = []
palindromeList (x:xs)
    | palindrome x = x : palindromeList xs
    | otherwise = palindromeList xs
    
filterList :: (a->b) -> [a] -> [b]
filterList f [] = []
filterList f (x:xs)
    | f x = x : filterList f xs
    | otherwise = filterList f xs

main = print(filterList palindrome ["aba", "asdf", "fdas", "abaa"])
