module Main(main) where
import Data.Text (split, pack, unpack)


data Ball = Red | Green | Blue deriving (Eq, Ord, Enum, Show)
data Game  = Game { id :: Integer
                  , samples :: [[Ball]] } deriving (Eq, Ord, Show)

-- example line -- "Game 1: 10 green, 9 blue, 1 red; 1 red, 7 green; 11 green, 6 blue; 8 blue, 12 green"
readGame :: String -> Game
readGame l = Game {id = i, samples = readSamples s }
    where gid_groups = split (==':') pack l)
          groups = last gid_groups
          tballs = map (split (==',')) (split (==';') groups)
          balls = map 
          id = getId $ head gid_groups
          samples = 

getId :: Text -> Integer
getId gid = read (unpack (tail (split (==' ') gid)))

-- example input -- ["10" "green"]
readBall :: String -> Ball
readBall count color = replicate (read count) (readColor color)

readColor :: String -> Ball



main :: IO ()
main = do
    content <- readFile "input.txt"
    let linesList = lines content
    
