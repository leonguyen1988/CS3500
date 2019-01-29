#!/bin/bash

flex example.l
g++ lex.yy.c -o lexer
lexer < example.txt
lexer
