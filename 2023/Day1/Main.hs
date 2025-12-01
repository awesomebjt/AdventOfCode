module Main (main) where

import Data.Char
import System.IO
import Data.List.Split
import Data.List
import Data.Text(pack, unpack, replace, Text)


numbers = map pack ["one","two","three","four",
                       "five","six", "seven", "eight",
                       "nine", "zero"]
numerals = map pack ["1","2","3","4","5","6","7","8","9","0"]

main :: IO ()
main = do
    content <- readFile "part2.txt"
    let linesList = lines content
    let pairs = zip numbers numerals
    let textLinesList = map pack linesList -- lines need to be Text instead of String so we can use the replace function
    let textTranslatedLines = map (digitizeTextNumerals pairs) textLinesList
    -- Now we have a [Text] of all the input lines
    -- except all the numbers written out have been
    -- translated into their numeric character
    let translatedLines = map unpack textTranslatedLines -- Changes that [Text] back to [String]
    putStrLn (show $ sum (map decodeLine translatedLines))

decodeLine :: String -> Int
decodeLine l = (10 * (digitToInt $ head ds)) + (digitToInt $ last ds)
    where ds = filter isDigit l

digitizeTextNumerals :: [(Text, Text)] -> Text -> Text
digitizeTextNumerals ((x,y):pairs) lineText | length pairs > 0 = digitizeTextNumerals pairs (replace x y lineText)
    | otherwise = replace x y lineText
