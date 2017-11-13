/*
JSON(Javascript Object Notation) Lexer
Onur Berk Tore Yeditepe University Programming Language Course

Notes 

Yapılacaklar

1)Numbers with Exponential shown up
2)ANSI C grammer String literal definition çalış
*/

digit      [0-9]
letter     [A-Za-z]
%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
extern int yyval;
int linenum=1;
%}
%%


"{"                             return OPEN_BRACES;
"}"                             return CLOSE_BRACES;
":"                             return COLON;
","                             return COMMA;
"["                             return OPEN_BRACKETS;
"]"                             return CLOSE_BRACKETS;
\"(\\.|[^\\"])*\"               return STRING_LITERAL;
"."                             return DOT;
("+"|"-")?[0-9]*\.[0-9]+        return DOUBLEVAL;
("+"|"-")?[0-9]*                return INTEGER;
"true"                          return TRUE;
"false"                         return FALSE;
\n                              {linenum++;}
[ \t]+
%%

