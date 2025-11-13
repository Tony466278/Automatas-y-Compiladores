%{
#include <stdio.h>
#include <string.h>
%}

%%
"pa'"               { fprintf(yyout, "para"); }
"mija"              { fprintf(yyout, "amiga"); }
"charra"            { fprintf(yyout, "ingenua"); }
"camellar"          { fprintf(yyout, "trabajar"); }
"mecatear"          { fprintf(yyout, "gastar"); }
"tinto"             { fprintf(yyout, "cafe"); }
"manes"             { fprintf(yyout, "hombres"); }
"ama"               { fprintf(yyout, "mama"); }
"buchipluma"        { fprintf(yyout, "quejumbrosa"); }
"berraca"           { fprintf(yyout, "valiente"); }
"pelado"            { fprintf(yyout, "chico"); }
"pispo"             { fprintf(yyout, "atractivo"); }
"mata"              { fprintf(yyout, "aguafiestas"); }
"loliar"            { fprintf(yyout, "pasear"); }
"chichiguita"       { fprintf(yyout, "propina"); }
"checheres"         { fprintf(yyout, "adornos"); }
"trapito"           { fprintf(yyout, "chico"); }
"guaros"            { fprintf(yyout, "tragos"); }
"chichipato"        { fprintf(yyout, "tacano"); }
"nea"               { fprintf(yyout, "oye"); }
"parchese"          { fprintf(yyout, "calmate"); }
"sizas"             { fprintf(yyout, "si"); }
"jetota"            { fprintf(yyout, "boca"); }
"bacano"            { fprintf(yyout, "genial"); }
"guayabo"           { fprintf(yyout, "resaca"); }
"ome"               { fprintf(yyout, "hombre"); }
"empinando"         { fprintf(yyout, "bebiendo"); }
"amanyada"          { fprintf(yyout, "acostumbrada"); }
"berracas"          { fprintf(yyout, "valientes"); }
"palante"           { fprintf(yyout, "para adelante"); }
[·¡]                { fprintf(yyout, "a"); }
[È…]                { fprintf(yyout, "e"); }
[ÌÕ]                { fprintf(yyout, "i"); }
[Û”]                { fprintf(yyout, "o"); }
[˙⁄]                { fprintf(yyout, "u"); }
[Ò—]                { fprintf(yyout, "n"); }
.                   { fprintf(yyout, "%s", yytext); }
%%

int main() {
    yyin = fopen("Echadas.txt", "r");
    yyout = fopen("texto_neutral.txt", "w");
    
    if (!yyin || !yyout) {
        printf("Error abriendo archivos\n");
        return 1;
    }
    
    yylex();
    
    fclose(yyin);
    fclose(yyout);
    return 0;
}

int yywrap() {
    return 1;
}