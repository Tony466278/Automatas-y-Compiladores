%option noyywrap
%{
#include<stdio.h>
#include<string.h>
%}

%%
[a-z]+    { 
        char *reservadas[] = {"if","for","while","return","int","float","char"};
        char *tipos[] = {"int","float","double","char","void"};
        int i, encontrado = 0;
        
        // Palabras reservadas
        for(i=0; i<7; i++) {
            if(strcmp(yytext, reservadas[i]) == 0) {
                printf("[RESERVADA C: %s] ", yytext);
                encontrado = 1;
                break;
            }
        }
        // Tipos de datos
        if(!encontrado) {
            for(i=0; i<5; i++) {
                if(strcmp(yytext, tipos[i]) == 0) {
                    printf("[TIPO DATO: %s] ", yytext);
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