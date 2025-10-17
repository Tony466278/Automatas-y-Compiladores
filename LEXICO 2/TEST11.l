%option noyywrap
%{
#include<stdio.h>
%}

%%
"//".*    { printf("[COMENTARIO: %s] ", yytext); }
printf.*\) { printf("[PRINTF: %s] ", yytext); }
.|\n      { printf("%s", yytext); }
%%

int main(){
    yylex();
    return 0;
}