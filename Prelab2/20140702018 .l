digit      [0-9]
letter     [A-Za-z]
%{
#include <stdio.h>
%}
%%
"main"                    printf("%s:MAIN RESERVED WORD\n",yytext);
"include"                 printf("%s:INCLUDE RESERVED WORD\n",yytext);
"int"                     printf("%s:INT RESERVED WORD\n",yytext);
"char"                    printf("%s:CHAR RESERVED WORD\n",yytext);
"float"                   printf("%s:FLOAT RESERVED WORD\n",yytext);
"return"                  printf("%s:RETURN RESERVED WORD\n",yytext);
"const"                   printf("%s:CONST RESERVED WORD\n",yytext);
"delete"                  printf("%s:DELETE RESERVED WORD\n",yytext);
"while"                   printf("%s:WHILE RESERVED WORD\n",yytext);
"new"                     printf("%s:NEW RESERVED WORD\n",yytext);
"."                       printf("%s:DOT\n",yytext);
";"                       printf("%s:SEMICOLON\n",yytext);
"<"                       printf("%s:LITTLE THAN\n",yytext);
">"                       printf("%s:GREATER THAN\n",yytext);
","                       printf("%s:COMMA\n",yytext);
"("                       printf("%s:OPEN PARANTHESIS\n",yytext);
")"                       printf("%s:CLOSE PARANTHESIS\n",yytext);
"{"                       printf("%s:OPEN BRACES\n",yytext);
"}"                       printf("%s:CLOSE BRACES\n",yytext);
"#"                       printf("%s:HASH SYMBOL\n",yytext);
"*"                       printf("%s:STAR SYMBOL\n",yytext);
"="                       printf("%s:EQUAL SYMBOL\n",yytext);
"->"                      printf("%s:POINT SYMBOL\n",yytext);
"::"                      printf("%s:NAMESPACE SYMBOL\n",yytext);
"<<"                      printf("%s:IO_OUT_SYMBOL\n",yytext);
"++"                      printf("%s:INCREMENT SYMBOL\n",yytext);
("//".*)|("/*".*"*/")     printf("%s:Comment\n",yytext);
"["                       printf("%s:OPEN BRACKETS\n",yytext);
"]"                       printf("%s:CLOSE BRACKETS\n",yytext);
\".*\"       printf("%s:STRING LITERAL\n",yytext);
"'"((.)|("\\".))"'" printf("%s:CHARACTER LITERAL\n",yytext);
{letter}({letter}|{digit}|"_")* printf("%s:IDENTIFIER\n",yytext);
{digit}({digit}|("."{digit}+))* printf("%s:NUMBER LITERAL\n",yytext);
.|\n

%%
int main(int argc,char *argv[]){

/*
Hocam yorum eklemiyorum sorular basitti.


Any material placed between the %{ and %} characters is copied directly
into final C program,so you can write any legal C code here.
*/




    yyin=fopen(argv[1],"r");
    yylex();
    fclose(yyin);
    return 0;
}
