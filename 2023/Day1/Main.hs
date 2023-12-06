import Data.Char
import System.IO
import Data.List.Split

main :: IO ()
main = do
    content <- readFile "input_1.txt"
    let linesList = lines content
    putStrLn (show $ sum (map decodedLine linesList))

decodedLine :: String -> Int
decodedLine l = (10 * (digitToInt $ head ds)) + (digitToInt $ last ds)
    where ds = filter isDigit l
