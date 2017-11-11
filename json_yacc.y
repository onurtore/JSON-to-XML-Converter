/*
YACC file for JSON
Onur Berk Töre Yeditepe University
*/


%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
extern FILE *yyin;
extern int linenum;
%}
%token OPEN_BRACES CLOSE_BRACES COLON  COMMA OPEN_BRACKETS CLOSE_BRACKETS STRING_LITERAL DOT NUMBER_LITERAL TRUE FALSE
%%

{
	"i" : 5,
	"word" : "This is a string"
}

object_notation:
     OPEN_BRACES statements CLOSE_BRACES
     ;

statements:
    statement COMMA statements
    |
    statement
    ;

statement:
    left_side COLON right_side
    ;

left_side:
    STRING_LITERAL
    ;

right_side:
    STRING_LITERAL
    |
    NUMBER_LITERAL
    ;

%%
void yyerror(char *s){
	fprintf(stderr,"Error: %d\n",linenum);
}
int yywrap(){
	return 1;
}
int main(int argc, char *argv[])
{
    /* Call the lexer, then quit. */
    yyin=fopen(argv[1],"r");
    yyparse();
    fclose(yyin);
    return 0;
}
