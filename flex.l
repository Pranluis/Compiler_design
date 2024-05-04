%{ 
int lineNum = 0; 
%} 
%% 
"(" { printf("(\n"); } 
")" { printf(")\n"); } 
"+" { printf("+\n"); } 
"*" { printf("*\n"); } 
\n { lineNum++; } 
[ \t]+ { } 
[0-9]+ { printf("%s\n", yytext); } 
%% 
int yywrap() { 
return 1; 
} 
int main () { 
yylex(); 
return 0; 
} 
Here is the Makefile used to build the scanner: 
p1: lex.yy.o 
gcc -g -o p1 lex.yy.o 
lex.yy.o: cal1.l 
flex cal1.l; gcc -g -c lex.yy.c 
clean: 
rm -f p1 *.o lex.yy.c 
Simple calculator program in bison 
//yacc file 
#include&lt;stdio.h&gt; 
int regs[26]; 
int base; 
%} 
6 
%start list 
%union { int a; } 
%token DIGIT LETTER 
%left &#39;|&#39; 
%left &#39;&amp;&#39; 
%left &#39;+&#39; &#39;-&#39; 
%left &#39;*&#39; &#39;/&#39; &#39;%&#39; 
%left UMINUS /*supplies precedence for unary minus */ 
%% /* beginning of rules section */ 
list: /*empty */ 
| 
list stat &#39;\n&#39; 
| 
list error &#39;\n&#39; 
{ 
yyerrok; 
} 
; 
stat: expr 
{ 
printf(&quot;%d\n&quot;,$1); 
} 
| 
LETTER &#39;=&#39; expr 
{ 
regs[$1.a] = $3.a; 
};