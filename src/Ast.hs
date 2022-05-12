module Ast (Node (..)) where

data Node = Constant Int | Add Node Node | Sub Node Node | Mul Node Node
