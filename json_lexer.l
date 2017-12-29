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


"{"                            {yylval.string = strdup(yytext); return OPEN_BRACES;}
"}"                            {yylval.string = strdup(yytext); return CLOSE_BRACES;}
":"                            {yylval.string = strdup(yytext); return COLON;}
","                            {yylval.string = strdup(yytext); return COMMA;}
"["                            {yylval.string = strdup(yytext); return OPEN_BRACKETS;}
"]"                            {yylval.string = strdup(yytext); return CLOSE_BRACKETS;}
\"(\\.|[^\\"])*\"              {yylval.string = strdup(yytext); return STRING_LITERAL;}
"."                            {yylval.string = strdup(yytext); return DOT;}
("+"|"-")?[0-9]*\.[0-9]+       {yylval.string = strdup(yytext); return DOUBLEVAL;}
("+"|"-")?[0-9]*               {yylval.string = strdup(yytext); return INTEGER;}
"true"                         {yylval.string = strdup(yytext); return TRUE;}
"false"                        {yylval.string = strdup(yytext); return FALSE;}
\n                             {linenum++;}

[ \t]+

%%