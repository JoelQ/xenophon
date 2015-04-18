module Main where
import System.IO
import Data.Maybe

responseFor :: [String] -> Maybe String
responseFor ("Action":_) = Just "call 0"
responseFor _ = Nothing

processCommand :: String -> Maybe String
processCommand = responseFor . words

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  interact $ unlines . (mapMaybe processCommand . lines)
