int base; 
%} 
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
} 
; 
expr: &#39;(&#39; expr &#39;)&#39; 
{ 
$$ = $2; 
} 
| 
expr &#39;*&#39; expr 
{ 
$$.a = $1.a * $3.a; 
} 
| 
expr &#39;/&#39; expr 
15 
{ 
$$.a = $1.a / $3.a; 
} 
| 
expr &#39;%&#39; expr 
{ 
$$.a = $1.a % $3.a; 
} 
| 
expr &#39;+&#39; expr 
{ 
$$.a = $1.a + $3.a; 
} 
| 
expr &#39;-&#39; expr 
{ 
$$.a = $1.a - $3.a; 
} 
| 
expr &#39;&amp;&#39; expr 
{ 
$$.a = $1.a &amp; $3.a; 
} 
| 
expr &#39;|&#39; expr 
{ 
$$.a = $1.a | $3.a; 
} 
| 
&#39;-&#39; expr %prec UMINUS 
{ 
$$.a = -$2.a; 
} 
| 
LETTER 
{ 
$$.a = regs[$1.a]; 
} 
| 
number 
; 
number: DIGIT 
{ 
16 
$$ = $1; 
base = ($1.a==0) ? 8 : 10; 
} | 
number DIGIT 
{ 
$$.a = base * $1.a + $2.a; 
} 
; 
%% 
main() 
{ 
return(yyparse()); 
} 
yyerror(s) 
char *s; 
{ 
fprintf(stderr, &quot;%s\n&quot;,s); 
} 
yywrap() 
{ 
return(1); 
} 
LEX FILE 
#include &lt;stdio.h&gt; 
#include &quot;y.tab.h&quot; 
int c; 
%} 
%% 
&quot; &quot; ; 
[a-z] { 
c = yytext[0]; 
yylval.a = c - &#39;a&#39;; 
return(LETTER); 
} 
[0-9] { 
c = yytext[0]; 
yylval.a = c - &#39;0&#39;; 
return(DIGIT); 
} 
[^a-z0-9\b] { 
c = yytext[0]; 
return(c); 
17 
18  
} 
%%