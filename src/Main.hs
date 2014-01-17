{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty
import Data.Text.Lazy (pack)

runWebApp :: [Person] -> IO ()
runWebApp people = scotty 3000 $ do
    get "/:word" $ do
      text . pack . show $ people

data Person = Person String String Int deriving (Show)

rawContactsPersonFromList :: [String] -> Person
rawContactsPersonFromList [firstName, lastName, rawAge] = Person firstName lastName age
  where age = read rawAge

main = do 
  content <- getContents
  let makePerson = rawContactsPersonFromList . words
      c1 = lines content
      c2 = map makePerson c1 
  runWebApp c2