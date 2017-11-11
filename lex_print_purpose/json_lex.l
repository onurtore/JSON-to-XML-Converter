/*
JSON(Javascript Object Notation) Lexer
Onur Berk Tore Yeditepe University Programming Language Course

Notes 

Yapılacaklar

1)Negative Numbers 
2)Double
3)Numbers with Exponential shown up
*/

digit      [0-9]
letter     [A-Za-z]
%{
#include <stdio.h>
%}
%%


"{"                             printf("%s:OPEN BRACES\n",yytext);
"}"                             printf("%s:CLOSE BRACES\n",yytext);
":"                             printf("%s:COLON\n",yytext);
","                             printf("%s:COMMA\n",yytext);
"["                             printf("%s:OPEN BRACKETS\n",yytext);
"]"                             printf("%s:CLOSE BRACKETS\n",yytext);
\".*\"                          printf("%s:STRING LITERAL\n",yytext);
"."                             printf("%s:DOT\n",yytext);
{digit}({digit}|("."{digit}+))* printf("%s:NUMBER LITERAL\n",yytext);
"true"                          printf("%s:TRUE",yytext);
"false"                          printf("%s:FALSE",yytext);
.|\n

%%

int main(int argc,char *argv[]){

    yyin=fopen(argv[1],"r");
    yylex();
    fclose(yyin);
    return 0;
}
