appendList :: [char] -> [char] -> [char]
appendList [] a = a
appendList (x:xs) ys = x : appendList xs ys


reverseList :: [char] -> [char]
reverseList [] = []
reverseList (x:xs) = appendList (reverseList xs) [x]


takeList :: Int -> [Int] -> [Int]
takeList 0 xs = []
-- takeList n (x:xs) = x : takeList (n-1) xs
takeList n (x:xs) = appendList [x] (takeList (n-1) xs)

dropList :: Int -> [Int] -> [Int]
dropList 0 xs = xs
dropList n [] = []
dropList n (x:xs) = dropList (n-1) xs

-- combination of take and drop
splitList :: Int -> [Int] -> ([Int], [Int])
splitList 0 xs = ([], xs)
splitList n (x:xs)
 = (x:as, bs)
    where
    (as, bs) = splitList (n-1) xs

memberSet :: Int -> [Int] -> Bool
memberSet n [] = False
memberSet n (x:xs) = if n==x then True else memberSet n xs

unionSet :: [Int] -> [Int] -> [Int]
unionSet xs [] = xs
unionSet (x:xs) ys
    | memberSet x ys = unionSet xs ys
    | otherwise = x : unionSet xs ys


main :: IO()
main = print(memberSet 10 [1, 2, 3])
