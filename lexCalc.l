%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int a,flag,ans;
char b;
%}

digit [0-9]+
op "+"|"-"|"*"|"/"

%%

{digit} { a=atoi(yytext);
	if(flag==0)
	{
		ans=a;
		flag=1;
	}
	else
	{
	switch(b)
	{
		case '+':ans=ans+a;
		break;
		case '-':ans=ans-a;
		break;
		case '*':ans=ans*a;
		break;
		case '/':ans=ans/a;
		break;
		}
	}
}

{op} {

	if(strcmp(yytext,"+")==0)
	b='+';
	else if(strcmp(yytext,"-")==0)
	b='-';
	else if(strcmp(yytext,"*")==0)
	b='*';
	else
	b='/';
}

"=" {printf("The result is = %d",ans);}

%%

main()
{
	a=flag=0;
	printf("Enter the expression");
	yylex();
	exit(0);
	return 0;
}

int yywrap()
{return 1;}
