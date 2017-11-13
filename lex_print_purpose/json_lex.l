/*
JSON(Javascript Object Notation) Lexer
Onur Berk Tore Yeditepe University Programming Language Course

Notes 

Yapılacaklar

1)Numbers with Exponential shown up
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
\"(\\.|[^\\"])*\"               printf("%s:STRING LITERAL\n",yytext);
"."                             printf("%s:DOT\n",yytext);
("+"|"-")?[0-9]*\.[0-9]+        printf("%s:DOUBLEVAL\n",yytext);
("+"|"-")?[0-9]*                printf("%s:INTEGER\n",yytext);
"true"                          printf("%s:TRUE\n",yytext);
"false"                         printf("%s:FALSE\n",yytext);
.|\n

%%

int main(int argc,char *argv[]){

    yyin=fopen(argv[1],"r");
    yylex();
    fclose(yyin);
    return 0;
}
