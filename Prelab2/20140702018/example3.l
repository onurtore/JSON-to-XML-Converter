digit	[0-9]
letter	[A-Za-z]
%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
extern int yylval;
int linenum=1;
%}
%%
"endl"							return ENDL;
"auto"							return AUTO;
"for"							return FOR;
"if"							return IF;
"cout"							return COUT;			
"do"							return DO;
"break"							return BREAK;
"continue"						return CONTINUE;
"cin"							return CIN;
"std"							return STD;
"main"                          return MAIN;
"include"                       return INCLUDE;
"char"                          return CHAR;
"float"                         return FLOAT;
"return"                        return RETURN;
"const"                         return CONST;
"delete"                        return DELETE;
"while"                         return WHILE;
"new"                           return NEW;
"int"                           return INT;
"double"                        return DOUBLE;
"="                             return ASSIGNOP;
";"                             return SEMICOLON;
","                             return COMMA;
"."                             return DOT;
"<"                             return LITTLE_THAN;
">"                             return GREATER_THAN;
"("                             return OPEN_PARANTHESIS;
")"                             return CLOSE_PARANTHESIS;
"["                             return OPEN_BRACKETS;
"]"                             return CLOSE_BRACKETS;
"{"                             return OPEN_BRACES;
"}"                             return CLOSE_BRACES;
"#"                             return HASH_SYMBOL;
"*"                             return STAR_SYMBOL;
"+"								return ADD;
"-"								return MINUS;
"/"								return DIVIDE;
"%"								return MOD;
"->"                            return POINT_SYMBOL;
"::"                            return NAMESPACE_SYMBOL;
"<<"                            return IO_OUT_SYMBOL;
">>"                            return IO_IN_SYMBOL;
"++"                            return INCREMENT_SYMBOL;
"--"							return DECREMENT_SYMBOL;
("//".*)|("/*".*"*/")           return COMMENT;
{letter}({letter}|{digit})*     return IDENTIFIER;
[0-9]+                          return INTEGER_VAL;
([0-9]+\.[0-9]+)                return DOUBLE_VAL;
							
"'"((.)|("\\".))"'"             return CHARACTER_LITERAL;
\".*\"                          return STRING_LITERAL;
\n                              {linenum++;}
[ \t]+
%%


