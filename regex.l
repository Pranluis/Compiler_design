Goal ::= MainClass ( TypeDeclaration )* <EOF> 
MainClass ::= "class" Identifier "{" "public" "static" "void" "main" "(" "String" "[" 
"]" Identifier ")" "{" PrintStatement "}" "}" 
TypeDeclaration ::= ClassDeclaration 
| ClassExtendsDeclaration 
ClassDeclaration ::= "class" Identifier "{" ( VarDeclaration )* ( MethodDeclaration 
)* "}" 
ClassExtendsDeclaration ::= "class" Identifier "extends" Identifier "{" ( 
VarDeclaration )* 
( MethodDeclaration )* "}" 
VarDeclaration ::= Type Identifier ";" 
MethodDeclaration ::= "public" Type Identifier "(" ( FormalParameterList )? ")" "{" 
( VarDeclaration )* 
( Statement )* "return" Expression ";" "}" 
FormalParameterList ::= FormalParameter ( FormalParameterRest )* 
FormalParameter ::= Type Identifier 
FormalParameterRest ::= "," FormalParameter 
Type ::= ArrayType 
| BooleanType 
| IntegerType 
| Identifier 
ArrayType ::= "int" "[" "]" 
BooleanType ::= "boolean" 
IntegerType ::= "int" 
Statement ::= Block 
| AssignmentStatement  
| ArrayAssignmentStatement 
| IfStatement 
| WhileStatement 
| PrintStatement 
Block ::= "{" ( Statement )* "}" 
AssignmentStatement ::= Identifier "=" Expression ";" 
ArrayAssignmentStatement ::= Identifier "[" Expression "]" "=" Expression ";" 
IfStatement ::= "if" "(" Expression ")" Statement "else" Statement 
WhileStatement ::= "while" "(" Expression ")" Statement 
PrintStatement ::= "System.out.println" "(" Expression ")" ";" 
Expression ::= AndExpression 
| CompareExpression 
| PlusExpression 
| MinusExpression 
| TimesExpression 
| ArrayLookup 
| ArrayLength 
| MessageSend 
| PrimaryExpression 
AndExpression ::= PrimaryExpression "&" PrimaryExpression 
CompareExpression ::= PrimaryExpression "<" PrimaryExpression 
PlusExpression ::= PrimaryExpression "+" PrimaryExpression 
MinusExpression ::= PrimaryExpression "-" PrimaryExpression 
TimesExpression ::= PrimaryExpression "*" PrimaryExpression 
ArrayLookup ::= PrimaryExpression "[" PrimaryExpression "]" 
ArrayLength ::= PrimaryExpression "." "length" 
MessageSend ::= PrimaryExpression "." Identifier "(" ( ExpressionList )? ")" 
ExpressionList ::= Expression ( ExpressionRest )* 
ExpressionRest ::= "," Expression 
PrimaryExpression ::= IntegerLiteral 
| TrueLiteral 
| FalseLiteral 
| Identifier 
| ThisExpression 
| ArrayAllocationExpression 
| AllocationExpression 
| NotExpression 
| BracketExpression 
IntegerLiteral ::= <INTEGER_LITERAL> 
TrueLiteral ::= "true" 
FalseLiteral ::= "false" 
Identifier ::= <IDENTIFIER> 
ThisExpression ::= "this" 
9 
ArrayAllocationExpression ::= "new" "int" "[" Expression "]" 
AllocationExpression ::= "new" Identifier "(" ")" 
NotExpression ::= "!" Expression 
BracketExpression ::= "(" Expression ")" 
The content for P1.tab.h 
/* A Bison parser, made by GNU Bison 2.5. */ 
/* Bison interface for Yacc-like parsers in C 
Copyright (C) 1984, 1989-1990, 2000-2011 Free Software Foundation, Inc. 
This program is free software: you can redistribute it and/or modify 
it under the terms of the GNU General Public License as published by 
the Free Software Foundation, either version 3 of the License, or 
(at your option) any later version. 
This program is distributed in the hope that it will be useful, 
but WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the 
GNU General Public License for more details. 
You should have received a copy of the GNU General Public License 
along with this program. If not, see <http://www.gnu.org/licenses/>. */ 
/* As a special exception, you may create a larger work that contains 
part or all of the Bison parser skeleton and distribute that work 
under terms of your choice, so long as that work isn't itself a 
parser generator using the skeleton or a modified version thereof 
as a parser skeleton. Alternatively, if you modify or redistribute 
the parser skeleton itself, you may (at your option) remove this 
special exception, which will cause the skeleton and the resulting 
Bison output files to be licensed under the GNU General Public 
License without this special exception. 
This special exception was added by the Free Software Foundation in 
version 2.2 of Bison. */ 
/* Tokens. */ 
#ifndef YYTOKENTYPE 
# define YYTOKENTYPE 
/* Put the tokens into the symbol table, so that GDB and other debuggers 
know about them. */ 
enum yytokentype { 
HASHDEFINE = 258, 
NOT = 259, 
CURLY_OPEN = 260, 
CURLY_CLOSE = 261, 
PAR_OPEN = 262, 
PAR_CLOSE = 263, 
10 
SQR_CLOSE = 264, 
IF = 265, 
WHILE = 266, 
CLASS = 267, 
PUBLIC = 268, 
STATIC = 269, 
VOID = 270, 
MAIN = 271, 
STR = 272, 
PRINTLN = 273, 
EXTENDS = 274, 
THIS = 275, 
NEW = 276, 
SEMI_COLON = 277, 
COMMA = 278, 
LENGTH = 279, 
TRUE = 280, 
FALSE = 281, 
NUMBER = 282, 
RET = 283, 
BOOL = 285, 
INT = 286, 
IDENTIFIER = 287, 
ADD = 288, 
SUB = 289, 
MUL = 290, 
DIV = 291, 
MOD = 292, 
BIT_AND = 293, 
LESSTHAN = 294, 
SQR_OPEN = 295, 
DOT = 296, 
ASSIGNMENT = 297, 
ELSE = 298, 
lab1 = 299, 
newlabel = 300, 
label = 301 
}; 
#endif 
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED 
typedef union YYSTYPE 
{ 
/* Line 2068 of yacc.c */ 
#line 25 "P1.y" 
11 
char* str; 
/* Line 2068 of yacc.c */ 
#line 102 "P1.tab.h" 
} YYSTYPE; 
# define YYSTYPE_IS_TRIVIAL 1 
# define yystype YYSTYPE /* obsolescent; will be withdrawn */ 
# define YYSTYPE_IS_DECLARED 1 
#endif 
extern YYSTYPE yylval; 
Template of the lex (P1.l) file with code for one operator and one keyword. 
%{ 
#include "P1.tab.h" 
#include<stdio.h> 
#include<stdlib.h> 
%} 
%% 
/* Write code to ignore empty spaces and newlines. */ 
/* Write code to ignore comments (single line and multiline). */ 
/* Write code to scan all the operators, paranthesis etc. Example shown for 
assignment. */ 
"=" {char* str=yytext;printf ("%s %d\n", str, ASSIGNMENT);} 
/* Write code to scan all the keywords. Example shown for if */ 
"if" {char* str=yytext;printf ("%s %d\n", str, IF);} 
* Write code to scan all the punctuations. */ 
/* Write code to scan numbers and identifiers. */ 
/* Write code to throw error if you encounter any invalid token. */ 
%% 
int main(){ 
yylex(); 
} 
int yywrap(){} 
The content for Factorial.java 
class Factorial{ 
public static void main(String[] a){ 
System.out.println(new Fac().ComputeFac((10))); 
} 
} 
class Fac { // Test 
public int ComputeFac(int num){ 
int num_aux ; 
if (num < 2) 
num_aux = 1 ; 
else 
12 
num_aux = num * (this.ComputeFac(num-1)) ; 
return num_aux ; 
}} 