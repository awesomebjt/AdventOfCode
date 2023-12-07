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

pairs = zip numbers numerals

main :: IO ()
main = do
    theLine <- getLine
    end <- isEOF
    let textLine = pack theLine
    putStrLn $ unpack (digitizeTextNumerals pairs textLine)
    if end then
        return ()
    else
        main


digitizeTextNumerals :: [(Text, Text)] -> Text -> Text
digitizeTextNumerals ((x,y):pairs) lineText | length pairs > 0 = digitizeTextNumerals pairs (replace x y lineText)
    | otherwise = replace x y lineText
