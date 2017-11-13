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
%token OPEN_BRACES CLOSE_BRACES COLON  COMMA OPEN_BRACKETS CLOSE_BRACKETS STRING_LITERAL DOT INTEGER DOUBLEVAL TRUE FALSE
%%


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
    INTEGER
    |
    DOUBLEVAL
    |
    array
    |
    boolean
    ;

array:
    OPEN_BRACKETS array_elements CLOSE_BRACKETS
    ;

array_elements:
    array_element COMMA array_elements
    |
    array_element
    ;

array_element:
    INTEGER
    |
    DOUBLEVAL
    |
    STRING_LITERAL
    |
    boolean
    ;

boolean:
    TRUE
    |
    FALSE
    ;

%%
void yyerror(char *s){
	fprintf(stderr,"Error on Line Number: %d\n",linenum);
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
