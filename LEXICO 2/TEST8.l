%option noyywrap
%{
#include<stdio.h>
#include<string.h>
%}

%%
[a-z]+    { 
        char *verbos[] = {"aplicar","usar","ejecutar","implementar","emplear",
                         "practicar","demostrar","operar","utilizar","desarrollar"};
        int i, encontrado = 0;
        
        for(i=0; i<10; i++) {
            if(strcmp(yytext, verbos[i]) == 0) {
                printf("[VERBO APLICACION: %s] ", yytext);
                encontrado = 1;
                break;
            }
        }
        if(!encontrado) printf("%s", yytext);
     }
.|\n      { printf("%s", yytext); }
%%

int main(){
    yylex();
    return 0;
}