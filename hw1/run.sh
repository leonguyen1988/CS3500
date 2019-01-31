#!/bin/bash

flex ThoNguyen.l
g++ lex.yy.c -o lexer
lexer < example.txt > ouput.txt
lexer