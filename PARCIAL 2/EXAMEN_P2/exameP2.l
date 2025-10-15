%option noyywrap
%{
    #include <stdio.h>
    #include <string.h>
    
    int comment_count = 0;
    int line_count = 1;
    int variable_count = 0;
    
    void print_token(const char* tipo, const char* valor) {
        printf("%s: %s\n", tipo, valor);
    }
%}

LETRA        [a-zA-Z]
DIGITO       [0-9]
ID           {LETRA}({LETRA}|{DIGITO})*
NUMERO       {DIGITO}+
COMENTARIO   "//".*
COMENTARIO_MULTI "/*"

%%

{COMENTARIO} {
    comment_count++;
    printf("COMENTARIO DE LINEA: %s\n", yytext);
}

{COMENTARIO_MULTI} {
    char c;
    comment_count++;
    printf("COMENTARIO MULTILINEA INICIADO\n");
    while((c = input()) != 0) {
        if(c == '*') {
            if((c = input()) == '/') {
                printf("COMENTARIO MULTILINEA TERMINADO\n");
                break;
            } else {
                unput(c);
            }
        } else if (c == '\n') {
            line_count++;
        }
    }
}

"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"|"asm"|"bool"|"catch"|"class"|"const_cast"|"delete"|"dynamic_cast"|"explicit"|"export"|"false"|"friend"|"inline"|"mutable"|"namespace"|"new"|"operator"|"private"|"protected"|"public"|"reinterpret_cast"|"static_cast"|"template"|"this"|"throw"|"true"|"try"|"typeid"|"typename"|"using"|"virtual"|"wchar_t"|"cout"|"cin"|"endl"|"main"|"include"|"iostream" {
    print_token("PALABRA RESERVADA", yytext);
}

{ID} {
    // Verificar que no sea palabra reservada ya identificada
    if(strcmp(yytext, "auto") != 0 && strcmp(yytext, "break") != 0 && strcmp(yytext, "case") != 0) {
        variable_count++;
        print_token("NOMBRE DE VARIABLE", yytext);
    }
}

{NUMERO} {
    print_token("CONSTANTE NUMERICA", yytext);
}

"+"|"-"|"*"|"/"|"%"|"++"|"--" {
    print_token("OPERADOR ARITMETICO", yytext);
}

"&&"|"||"|"!" {
    print_token("OPERADOR LOGICO", yytext);
}

"=="|"!="|"<"|">"|"<="|">=" {
    print_token("OPERADOR RELACIONAL", yytext);
}

"{"|"}"|"("|")"|"["|"]"|";"|","|"."|":"|"#"|"<<"|">>" {
    print_token("SIMBOLO ESPECIAL", yytext);
}

"="|"&"|"|" {
    print_token("OPERADOR/ASIGNACION", yytext);
}

\n { 
    line_count++; 
}

[ \t]+ ; 

. { 
    printf("Caracter no reconocido: %c\n", yytext[0]); 
}

%%

int main() {
    char filename[100];
    
    printf("=== ANALIZADOR LEXICO DE C++ ===\n");
    printf("Ingrese el nombre del archivo .cpp a analizar: ");
    scanf("%s", filename);
    
    
    if(strstr(filename, ".cpp") == NULL && strstr(filename, ".c") == NULL) {
        strcat(filename, ".cpp");
    }
    
    FILE *file = fopen(filename, "r");
    if (!file) {
        printf("Error: No se pudo abrir el archivo '%s'\n", filename);
        printf("Asegurese de que el archivo existe en la misma carpeta.\n");
        printf("Presione Enter para salir...");
        getchar();
        getchar();
        return 1;
    }
    
    yyin = file;

    printf("\n=== RESULTADOS DEL ANALISIS ===\n");
    yylex();

    printf("\n----------------------------------\n");
    printf("ESTADISTICAS FINALES:\n");
    printf("Total de comentarios: %d\n", comment_count);
    printf("Total de lineas: %d\n", line_count);
    printf("Total de variables identificadas: %d\n", variable_count);
    printf("----------------------------------\n");

    fclose(file);
    
    printf("\nAnalisis completado. Presione Enter para salir...");
    getchar();  // Limpiar el buffer del scanf
    getchar();  // Esperar que presione Enter
    
    return 0;
}