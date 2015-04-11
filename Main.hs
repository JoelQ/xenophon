module Main where

responseFor :: [String] -> String
responseFor ("Action":_) = "call 0"
responseFor _ = ""

processCommand :: String -> String
processCommand x = responseFor $ words x

noEmptyResponses :: [String] -> [String]
noEmptyResponses = filter (not . null)

processInput :: String -> String
processInput x = unlines . noEmptyResponses $ map processCommand $ lines x

main :: IO ()
main = interact processInput
