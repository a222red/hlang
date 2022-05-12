module Lexer (
    tokens,
    Token(Error, LParen, RParen, Plus, Dash, Star, Literal)
) where

import Data.Char ( isDigit, isSpace )

data Token = Error
    | LParen
    | RParen
    | Plus
    | Dash
    | Star
    | Literal Int deriving (Show, Eq)

lexLit :: String -> Int -> (Int, String)
lexLit (c:rest) i = if isDigit c then
        (i * 10 + read [c], rest)
    else
        (i, c:rest)
lexLit "" i = (i, "")

-- | Converts a string into a series of tokens
tokens :: String -> [Token]
tokens "" = []
tokens ('(':rest) = LParen : tokens rest
tokens (')':rest) = RParen : tokens rest
tokens ('+':rest) = Plus : tokens rest
tokens ('-':rest) = Dash : tokens rest
tokens ('*':rest) = Star : tokens rest
tokens (c:rest)
    | isDigit c = let (i, rest') = lexLit rest (read [c]) in
        Literal i : tokens rest'
    | isSpace c = tokens rest
    | otherwise = Error : tokens rest
    