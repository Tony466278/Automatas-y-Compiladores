%option noyywrap
%{
#include<stdio.h>
#include<string.h>
%}

%%
[a-z]+    { 
        char *analizar[] = {"analizar","comparar","investigar","organizar"};
        char *adjetivos[] = {"bueno","excelente","perfecto","hermoso"};
        char *conjunciones[] = {"y","pero","porque","pues"};
        int i, encontrado = 0;
        
        // Verbos analizar
        for(i=0; i<4; i++) {
            if(strcmp(yytext, analizar[i]) == 0) {
                printf("[VERBO ANALIZAR: %s] ", yytext);
                encontrado = 1;
                break;
            }
        }
        // Adjetivos
        if(!encontrado) {
            for(i=0; i<4; i++) {
                if(strcmp(yytext, adjetivos[i]) == 0) {
                    printf("[ADJETIVO: %s] ", yytext);
                    encontrado = 1;
                    break;
                }
            }
        }
        // Conjunciones
        if(!encontrado) {
            for(i=0; i<4; i++) {
                if(strcmp(yytext, conjunciones[i]) == 0) {
                    printf("[CONJUNCION: %s] ", yytext);
                    encontrado = 1;
                    break;
                }
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