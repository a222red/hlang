module Main where

import Lexer
import Parser
import Ast

main :: IO ()
main = print (tokens "(1 + 2)")
