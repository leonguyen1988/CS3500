/*   
	Tho Huu Nguyen
	CS3500
	HW1
*/

%{
/* 
Definitions of constants, variables, & function prototypes go here 
*/

#define T_IDENT      	1
#define T_INTCONST   	2
#define T_FLOATCONST 	3
#define T_STRCONST   	4
#define T_IF 		 	5
#define T_ELSE    	 	6
#define T_WHILE 	 	7
#define T_FUNCTION	 	8
#define T_FOR		 	9
#define T_IN		 	10
#define T_NEXT       	11
#define T_BREAK       	12
#define T_TRUE       	13
#define T_FALSE      	14
#define T_QUIT      	15
#define T_PRINT      	16
#define T_CAT			17
#define T_READ			18
#define T_LIST     		19
#define T_ADD			20
#define T_SUB			21
#define T_MULT			22
#define T_DIV			23
#define T_MOD			24
#define T_POWER			25
#define T_LT			26
#define T_GT			27
#define T_LE			28
#define T_GE			29
#define T_EQ			30
#define T_NE			31
#define T_NOT			32
#define T_AND			33
#define T_OR			34
#define T_ASSIGN		35
#define T_SEMICOLON    	36
#define T_COMMA    		37
#define T_LPAREN    	38
#define T_RPAREN    	39
#define T_LBRACE 		40
#define T_RBRACE 		41
#define T_LBRACKET 		42
#define T_RBRACKET 		43
#define T_COMMENT 		44
#define T_UNKNOWN    	20



void printTokenInfo(const char* tokenType, char* lexeme);

%}

/* Defintions of regular expressions go here */

WSPACE			[ \t\v\r]+
NEWLINE          \n

NEGA			 [-|+]
DIGIT	         [0-9]
LETTER           [a-zA-Z]
FLOAT			[-|+?0-9]*\.[0-9]+

IDENT			(_|{LETTER})({LETTER}|{DIGIT}|_)* 
INTCONST        {NEGA}?({DIGIT}+)
FLOATCONST		{FLOAT}+
/*STR				\"({WSPACE}*{LETTER}+{WSPACE}*)\"*/
STR				\"([^\n\"])*\"

COMMENT			"#"({LETTER}|{DIGIT}|" ")*

%%

"else"      {
				printTokenInfo("ELSE",yytext);
				return T_ELSE ;
			}


"if"	    {
				printTokenInfo("IF",yytext);
				return T_IF;
			}

"while"  	{
				printTokenInfo("WHILE",yytext);
				return T_WHILE;
			}

"function"  {
				printTokenInfo("FUNCTION",yytext);
				return T_FUNCTION;
			}

"for"  		{
				printTokenInfo("FOR",yytext);
				return T_FOR;
			}

"in"  		{
				printTokenInfo("IN",yytext);
				return T_IN;
			}

"next"  	{
				printTokenInfo("NEXT",yytext);
				return T_NEXT;
			}

"break"  	{
				printTokenInfo("BREAK",yytext);
				return T_BREAK;
			}

"TRUE"  	{
				printTokenInfo("TRUE",yytext);
				return T_TRUE;
			}

"FALSE"  	{
				printTokenInfo("FALSE",yytext);
				return T_FALSE;
			}

"quit"  	{
				printTokenInfo("QUIT",yytext);
				return T_QUIT;
			}

"cat"  	{
				printTokenInfo("CAT",yytext);
				return T_CAT;
			}

"read"		{
				printTokenInfo("READ",yytext);
				return T_READ;
			}

"list"  	{
				printTokenInfo("LIST",yytext);
				return T_LIST;
			}

"print"  	{
				printTokenInfo("PRINT",yytext);
				return T_PRINT;
			}

"+"  		{
				printTokenInfo("ADD",yytext);
				return T_ADD;
			}

"-"  		{
				printTokenInfo("SUB",yytext);
				return T_SUB;
			}


"*"  		{
				printTokenInfo("MULT",yytext);
				return T_MULT;
			}

"/"  		{
				printTokenInfo("DIV",yytext);
				return T_DIV;
			}

"%%"  		{
				printTokenInfo("MOD",yytext);
				return T_MOD;
			}

"^"  		{
				printTokenInfo("POWER",yytext);
				return T_POWER;
			}

"<"  		{
				printTokenInfo("LT",yytext);
				return T_LT;
			}

">"  		{
				printTokenInfo("GT",yytext);
				return T_GT;
			}

"<="  		{
				printTokenInfo("LE",yytext);
				return T_LE;
			}

">="  		{
				printTokenInfo("GE",yytext);
				return T_GE;
			}

"=="  		{
				printTokenInfo("EQ",yytext);
				return T_EQ;
			}

"!="  		{
				printTokenInfo("NE",yytext);
				return T_NE;
			}

"!"  		{
				printTokenInfo("NOT",yytext);
				return T_NOT;
			}

"&"  		{
				printTokenInfo("AND",yytext);
				return T_AND;
			}

"|"  		{
				printTokenInfo("OR",yytext);
				return T_OR;
			}

"="  		{
				printTokenInfo("ASSIGN",yytext);
				return T_ASSIGN;
			}

";"  		{
				printTokenInfo("SEMICOLON",yytext);
				return T_SEMICOLON;
			}

","  		{
				printTokenInfo("COMMA",yytext);
				return T_COMMA;
			}

"("  		{
				printTokenInfo("LPAREN",yytext);
				return T_LPAREN;
			}
")"  		{
				printTokenInfo("RPAREN",yytext);
				return T_RPAREN;
			}

"["  	{
				printTokenInfo("LBRACKET",yytext);
				return T_LBRACKET;
			}

"]" 	{
				printTokenInfo("RBRACKET",yytext);
				return T_RBRACKET;
			}

"{"  	{
				printTokenInfo("LBRACE",yytext);
				return T_LBRACE;
			}

"}" 	{
				printTokenInfo("RBRACE",yytext);
				return T_RBRACE;
			}

{COMMENT}  	{
				return T_COMMENT;
			}

{STR}		{
				printTokenInfo("STRCONST",yytext);
				return T_STRCONST;
			}
{FLOATCONST}      {
				printTokenInfo("FLOATCONST", yytext);
				return T_FLOATCONST;
			}
{INTCONST}	{
				printTokenInfo("INTCONST", yytext);
				return T_INTCONST;
			}
{IDENT}		{
				printTokenInfo("IDENT", yytext);
				return T_IDENT;
			}
{NEWLINE}		{
                
                  }
{WSPACE}		{ }

.			{
				printTokenInfo("UNKNOWN", yytext);
				return T_UNKNOWN;
			}

%%

// User-written code goes here

void printTokenInfo(const char* tokenType, char* lexeme) {
  printf("TOKEN: %s  			LEXEME: %s\n", tokenType, lexeme);
}

// You should supply a yywrap function.
// Having it return 1 means only 1 input file will be scanned.
int yywrap(void) { return 1; }

int main(void) 
{
  while ( yylex() ) ;  // Keep processing tokens until 0 returned
  return 0;
}


