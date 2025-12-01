module Main(main) where

import Data.Text (pack, unpack, split)
import Data.List.Extra (trim)

data Sample = Sample { red :: Integer, green :: Integer, blue :: Integer }
data Game = Game {id :: Integer, samples :: [Sample]}


--readSample :: String -> Sample
--readSample entry = (
--  where sampList = map (reverse . (split (==' ')))) . (map pack) . (map trim) . (map unpack) . (split (==',')) . pack $ trim
--        red
--
--
main :: IO ()
main = do
    putStrLn "hi!"
