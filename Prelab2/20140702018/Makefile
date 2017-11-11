all: yacc lex
	cc lex.yy.c y.tab.c -o example3

yacc: example3.y
	yacc -d example3.y

lex: example3.l
	lex example3.l


