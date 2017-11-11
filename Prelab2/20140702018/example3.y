/*
Şu an saat 3:00 AM şu anda bitirdiğim düşünülürse,benden başka kimsenin bu kodu 
yazmış olacağını zannetmiyorum,ayrıca sizin adınıza 500 satır yazı yazacak bir öğrenci
bulursanız bana da haber verin
*/


%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
extern FILE *yyin;
extern int linenum;
%}
%token MAIN INCLUDE CHAR FLOAT RETURN CONST DELETE WHILE NEW INT DOUBLE ASSIGNOP SEMICOLON COMMA DOT LITTLE_THAN GREATER_THAN OPEN_PARANTHESIS CLOSE_PARANTHESIS OPEN_BRACKETS CLOSE_BRACKETS OPEN_BRACES CLOSE_BRACES HASH_SYMBOL STAR_SYMBOL POINT_SYMBOL NAMESPACE_SYMBOL IO_IN_SYMBOL IO_OUT_SYMBOL INCREMENT_SYMBOL COMMENT IDENTIFIER INTEGER_VAL DOUBLE_VAL CHARACTER_LITERAL STRING_LITERAL STD CIN DO COUT DECREMENT_SYMBOL IF CONTINUE BREAK FOR AUTO ADD MINUS DIVIDE MOD ENDL
%%


program:
	preprocessor_statements  statements  
	;

main:
	main_start main_body main_end
	;	
	
main_start:
	INT MAIN function_parameter  OPEN_BRACES
	;
	
function_parameter:
	OPEN_PARANTHESIS INT IDENTIFIER COMMA CONST CHAR STAR_SYMBOL IDENTIFIER OPEN_BRACKETS CLOSE_BRACKETS CLOSE_PARANTHESIS 
	|
	OPEN_PARANTHESIS CLOSE_PARANTHESIS
	|
	OPEN_PARANTHESIS IDENTIFIER CLOSE_PARANTHESIS
	|
	OPEN_PARANTHESIS STRING_LITERAL CLOSE_PARANTHESIS
	|
	OPEN_PARANTHESIS CHARACTER_LITERAL CLOSE_PARANTHESIS
	|
	OPEN_PARANTHESIS INTEGER_VAL CLOSE_PARANTHESIS
	|
	OPEN_PARANTHESIS DOUBLE_VAL CLOSE_PARANTHESIS
	|
	OPEN_PARANTHESIS float CLOSE_PARANTHESIS
	;	
	

		



main_body:
	statements
	
	;

	
main_end:
	CLOSE_BRACES
	
preprocessor_statements:
	preprocessor_statement preprocessor_statements
	|
	preprocessor_statement
	;
	
preprocessor_statement:
	include_statement
	;
	
include_statement:
    HASH_SYMBOL INCLUDE LITTLE_THAN IDENTIFIER GREATER_THAN
	|
	HASH_SYMBOL INCLUDE STRING_LITERAL
	;
	
statements:
	statement statements
	|
	statement
	;

statement:
	assignment_block
	|
	print_block //Print block değil :( Ters yazmışım ama değiştirmeye de üşeniyorum 
	|
	main
	|
	class_function_call
	|
	do_while_block
	|
	in_print_block
	|
	if_statement
	|
	loop_keywords
	|
	for_loop
	|
	delete_statement
	|
	return_statement
	;

	
return_statement:
	RETURN value SEMICOLON
	
delete_statement:
	DELETE value SEMICOLON
	;
	
for_loop:
	FOR OPEN_PARANTHESIS for_condition CLOSE_PARANTHESIS OPEN_BRACES statements CLOSE_BRACES
	|
	FOR OPEN_PARANTHESIS for_condition CLOSE_PARANTHESIS OPEN_BRACES CLOSE_BRACES
	;
	
for_condition:
	first_for_part  second_for_part SEMICOLON last_for_part
	|
	SEMICOLON second_for_part SEMICOLON last_for_part
	|
	SEMICOLON second_for_part SEMICOLON
	;
	
first_for_part:
	assignment_block
	;
	
second_for_part:
	condition_statement
	;
	
last_for_part:
	assignment_block
	;
	
loop_keywords:
	BREAK SEMICOLON
	|
	CONTINUE SEMICOLON
	;
		
	
if_statement:

	IF OPEN_PARANTHESIS condition_statement CLOSE_PARANTHESIS OPEN_BRACES statements CLOSE_BRACES
	|
	IF OPEN_PARANTHESIS condition_statement CLOSE_PARANTHESIS OPEN_BRACES CLOSE_BRACES
	;

condition_statement:
	value equality value
	|
	value LITTLE_THAN value
	|
	value 
	|
	value LITTLE_THAN ASSIGNOP value
	|
	value GREATER_THAN ASSIGNOP value
	;
	
	
value:
	INTEGER_VAL
	|
	float
	|
	double
	|
	CHARACTER_LITERAL
	|
	variable_name
	|
	class_function_call
	;
	
equality:
	ASSIGNOP ASSIGNOP
	;

do_while_block:
//Do-while' ile While aslında tek olmalı ama ben profesyonel değilim ve saat geç oldu
	DO OPEN_BRACES statements CLOSE_BRACES while_part
	|
	DO OPEN_BRACES CLOSE_BRACES while_part
	;

while_part:
	WHILE OPEN_PARANTHESIS condition_statement CLOSE_PARANTHESIS SEMICOLON
	;


assignment_block:
	integer_assignment_block
	| 
	double_assignment_block
	|
	char_assignment_block
	|
	float_assigment_block
	|
	class_assignment_block
	|
	auto_assignment_block
	|
	unary_operations
	|
	dort_islem_operation
	;

dort_islem_operation:
	value dort_islem_operators value
	;

dort_islem_operators:
	STAR_SYMBOL
	|
	ADD
	|
	MINUS
	|
	DIVIDE
	|
	MOD
	;
	
variable_name:
	IDENTIFIER
	;
	
unary_operations:
	value unary_operator SEMICOLON
	|
	//example for loop
	value unary_operator 
	;
	
unary_operator:
	INCREMENT_SYMBOL
	|
	DECREMENT_SYMBOL
	;
	
class_function_call:
	
	class_instance_name DOT function_call SEMICOLON
	|
	//Bunu farklı bir call da yaparsam olmaz.Generality bozulmuş olur.
	class_instance_name DOT function_call 
	;

	
function_call:
	function_name function_parameter
	;
	
function_name:	
	IDENTIFIER
	;
	



class_name:
	IDENTIFIER
	;
	

class_assignment_block:
	class_name class_assignment_list SEMICOLON
	;
	
	
auto_assignment_block:
	AUTO auto_assignment_list SEMICOLON
	;

	
integer_assignment_block:
	INT integer_assignment_list SEMICOLON
	;

double_assignment_block:
	DOUBLE double_assignment_list SEMICOLON
	;

char_assignment_block:
	CHAR char_assignment_list SEMICOLON
	;

float_assigment_block:
	FLOAT float_assigment_list SEMICOLON
	;
	
class_assignment_list:
	class_assignment
	|
	class_assignment_list COMMA class_assignment
	;
	
auto_assignment_list:
	auto_assigment
	|
	auto_assignment_list COMMA auto_assigment
	;
	
integer_assignment_list:
	integer_assignment
	|
	integer_assignment_list COMMA integer_assignment
	;

double_assignment_list:
	double_assignment
	|
	double_assignment_list COMMA double_assignment
	;

char_assignment_list:
	char_assignment
	|
	char_assignment_list COMMA char_assignment
	;


	
float_assigment_list:
	float_assignment
	|
	float_assigment_list COMMA float_assignment
	;

auto_assigment:
	IDENTIFIER ASSIGNOP INTEGER_VAL
	|
	IDENTIFIER ASSIGNOP double
	|
	IDENTIFIER ASSIGNOP float
	|
	IDENTIFIER ASSIGNOP CHARACTER_LITERAL
	|
	IDENTIFIER
	
class_assignment:
	class_instance_name ASSIGNOP class_instance_name
	|
	class_instance_name
	;
	
class_instance_name:
	IDENTIFIER
	;
	
integer_assignment:
	IDENTIFIER ASSIGNOP INTEGER_VAL
	|
	IDENTIFIER
	;

double_assignment:
	IDENTIFIER ASSIGNOP double
	|
	IDENTIFIER
	;

char_assignment:
	IDENTIFIER ASSIGNOP CHARACTER_LITERAL
	|
	IDENTIFIER
	;
float_assignment:
	IDENTIFIER ASSIGNOP float
	|
	IDENTIFIER
	;

double:
	INTEGER_VAL
	|
	DOUBLE_VAL	
	;

float:
	double
	;
	
print_block:
	STD NAMESPACE_SYMBOL CIN output_block
	;
	
in_print_block:
	STD NAMESPACE_SYMBOL COUT input_block
	;	
	
input_block:
	IO_OUT_SYMBOL input_var SEMICOLON
	|
	IO_OUT_SYMBOL input_var input_block
	;
	
	
output_block:
	IO_IN_SYMBOL output_var SEMICOLON
	|
	IO_IN_SYMBOL output_var output_block
	;
	
input_var:
	IDENTIFIER
	|
	STRING_LITERAL
	|
	class_val_call
	|
	STD NAMESPACE_SYMBOL ENDL
	;
	
	
output_var:
	IDENTIFIER
	|
	class_val_call
	;

class_val_call:
	class_instance_name DOT class_variable_name
	;
	
class_variable_name:
	variable_name
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
