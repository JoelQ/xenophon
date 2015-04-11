module Main where

responseFor :: [String] -> String
responseFor ("Action":_) = "call 0"
responseFor _ = ""

processCommand :: String -> String
processCommand x = responseFor $ words x

processInput :: String -> String
processInput x = unlines $ map processCommand $ lines x

main :: IO ()
main = interact processInput
