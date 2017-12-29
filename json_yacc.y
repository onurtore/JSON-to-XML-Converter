/*
YACC file for JSON
Onur Berk Töre Yeditepe University
*/


%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
#include "myClass.h"
void yyerror(char *);
int yylex(void);
extern FILE *yyin;
extern int linenum;
int leftSide_index = 0;

%}


%union
{
    int number;
    char *string;
}


%type <string> statements statement left_side right_side array array_elements array_element boolean
%token <string> OPEN_BRACES CLOSE_BRACES COLON  COMMA OPEN_BRACKETS CLOSE_BRACKETS STRING_LITERAL DOT INTEGER DOUBLEVAL TRUE FALSE
%%


object_notation:
    OPEN_BRACES statements CLOSE_BRACES
    {
        strcpy(program,"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
        strcat(program,"<object1>\n");
        strcat(program,$2);
        strcat(program,"</object1>\n");
        PrintToFile();
    }
    ;

statements:
    statement COMMA statements
    {
        strcpy($$,$1);
        strcat($$,"\n");
        strcat($$,$3);

    }
    |
    statement
    {
        strcpy($$,$1);
        strcat($$,"\n");
    }
    ;

statement:
    left_side COLON right_side
    {
        strcpy($$,$1);
        strcat($$,$3);

        char new_string[400];
        new_string[0] = '<';
        new_string[1] = '/';

        int index = 1;
        char * str = $1;

        while(str[index] != '>'){
            new_string[index+1] = str[index];
            index++;
        }
        new_string[index+1] = '>';
        new_string[index+2] = '\0';
    
        strcat($$,new_string);
    }
    ;

left_side:
    STRING_LITERAL
    {
        int i = 0;
        for(; i < leftSide_index ; i++){
            if(!strcmp(left_side_arr[i],$1)){
                printf("%s,%s\n",left_side_arr[i],$1);
                printf("Error:Defined Variable Used\n");
                exit(1);
            }
        }

        strcpy(left_side_arr[leftSide_index],$1);
        leftSide_index++;

        char new_string[400];
        new_string[0] = '<';
        char * str  = $1;
        int index = 1;
        while(str[index] != '\"')
        {
            new_string[index] = str[index];
            index++; 
        }
        new_string[index] = '>';
        new_string[++index] = '\0';
        strcpy($$,new_string);
    }
    ;

right_side:
    STRING_LITERAL
    {
        char new_string[400];
        char * str = $1;
        int index = 1;
        while(str[index] != '\"'){
            new_string[index-1] = str[index];
            index++;
        }
        new_string[--index] = '\0';


        strcpy($$,new_string);
    }
    |
    INTEGER
    {
        strcpy($$,$1);
    }
    |
    DOUBLEVAL
    {
        strcpy($$,$1);
    }
    |
    array
    {
        strcpy($$,$1);
    }
    |
    boolean
    {
        strcpy($$,$1);
    }
    ;

array:
    OPEN_BRACKETS array_elements CLOSE_BRACKETS
    {
        strcpy($$,"\n");
        strcat($$,$2);
    }
    ;

array_elements:
    array_element COMMA array_elements
    {
        

        int index  = 0;
        char  * str = $1;
        int count = 0;
        while(count != 2 ){
            if(str[index] == '>'){
                count++;
            }
            index++;
        }


        str[index] = '\0';        

        strcpy($$,$1);
        
        strcat($$,"\n");
        
        
        strcat($$,$3);
    }
    |
    array_element
    {
        strcpy($$,$1);
        strcat($$,"\n\0");
    }
    ;

array_element:
    INTEGER
    {
        char  new_string2[500];
        strcpy(new_string2,"<integer>");
        strcat(new_string2,$1);
        strcat(new_string2,"</integer>");
        strcpy($$,new_string2);
    }
    |
    DOUBLEVAL
    {
        char  new_string2[500];
        strcpy(new_string2,"<double>");
        strcat(new_string2,$1);
        strcat(new_string2,"</double>");
        strcpy($$,new_string2);

    }
    |
    STRING_LITERAL
    {
        char  new_string2[500];
        strcpy(new_string2,"<string>");


        char new_string[400];
        char * str = $1;
        int index = 1;
        while(str[index] != '\"'){
            new_string[index-1] = str[index];
            index++;
        }
        new_string[index-1] = '\0';


        strcat(new_string2,new_string);



        strcat(new_string2,"</string>");
        strcpy($$,new_string2);
        char * str2 = $$;
    }
    |
    boolean
    {
        char  new_string2[500];
        strcpy(new_string2,"<boolean>");
        strcat(new_string2,$1);
        strcat(new_string2,"</boolean>");
        strcpy($$,new_string2);
    }
    ;

boolean:
    TRUE
    {
        strcpy($$,"true");
    }
    |
    FALSE
    {
        strcpy($$,"false");
    }
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
