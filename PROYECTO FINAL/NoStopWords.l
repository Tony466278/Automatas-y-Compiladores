%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

#define MAX_STOPWORDS 1000
#define MAX_WORD_LEN 100

char stopwords[MAX_STOPWORDS][MAX_WORD_LEN];
int num_stopwords = 0;

void cargar_stopwords() {
    FILE* file = fopen("Echadas.txt", "r");
    if (!file) {
        printf("Error: No se pudo abrir stopwords.txt\n");
        exit(1);
    }
    
    char palabra[MAX_WORD_LEN];
    int i;
    while (fscanf(file, "%99s", palabra) == 1) {
        for(i = 0; palabra[i]; i++) {
            palabra[i] = tolower(palabra[i]);
        }
        strcpy(stopwords[num_stopwords], palabra);
        num_stopwords++;
        if(num_stopwords >= MAX_STOPWORDS) break;
    }
    fclose(file);
}

int es_stopword(char* palabra) {
    char temp[MAX_WORD_LEN];
    int i;
    
    for(i = 0; palabra[i] && i < MAX_WORD_LEN-1; i++) {
        temp[i] = tolower(palabra[i]);
    }
    temp[i] = '\0';
    
    for(i = 0; i < num_stopwords; i++) {
        if(strcmp(temp, stopwords[i]) == 0) {
            return 1;
        }
    }
    return 0;
}
%}

%option noyywrap

LETRA [a-zA-ZáéíóúÁÉÍÓÚñÑ]
PALABRA {LETRA}+

%%

{PALABRA} {
    if(!es_stopword(yytext)) {
        ECHO;
    }
}

.|\n { ECHO; }

%%

int main() {
    cargar_stopwords();
    
    yyin = fopen("Echadas.txt", "r");
    yyout = fopen("salida.txt", "w");

    if (!yyin) {
        printf("Error: No se pudo abrir entrada.txt\n");
        return 1;
    }
    
    if (!yyout) {
        printf("Error: No se pudo crear salida.txt\n");
        fclose(yyin);
        return 1;
    }

    yylex();

    fclose(yyin);
    fclose(yyout);
    
    printf("Procesamiento completado. Resultado en salida.txt\n");
    return 0;
}