%option noyywrap
%{
#include <stdio.h>

long contador_lineas=0;
long contador_palabras=0;
long contador_caracteres=0;
long palabras_ni=0;
long palabras_num=0;
long palabras_bto=0;
long palabras_jo=0;
%}

%%
\n { contador_lineas++; contador_caracteres += yyleng; }
[ \t\r]+ { contador_caracteres += yyleng; }
[0-9]+ { contador_palabras++; contador_caracteres += yyleng; }
[nN][iI][a-zA-Z0-9]* { contador_palabras++; contador_caracteres += yyleng; palabras_ni++; }
[nN][uU][mM][a-zA-Z0-9]* { contador_palabras++; contador_caracteres += yyleng; palabras_num++; }
[bB][a-zA-Z0-9][tT][oO] { contador_palabras++; contador_caracteres += yyleng; palabras_bto++; }
[a-zA-Z0-9][jJ][oO] { contador_palabras++; contador_caracteres += yyleng; palabras_jo++; }
[a-zA-Z0-9]+ { contador_palabras++; contador_caracteres += yyleng; }
. { contador_caracteres += yyleng; }
%%

int main(){
yylex();
printf("Total de lineas: %ld\n", contador_lineas);
printf("Total de palabras: %ld\n", contador_palabras);
printf("Total de caracteres (incluidos espacios y saltos): %ld\n", contador_caracteres);
printf("Palabras que inician con ni: %ld\n", palabras_ni);
printf("Palabras que inician con num: %ld\n", palabras_num);
printf("Palabras que inician con b y terminan con to: %ld\n", palabras_bto);
printf("Palabras que terminan con jo: %ld\n", palabras_jo);
return 0;
}