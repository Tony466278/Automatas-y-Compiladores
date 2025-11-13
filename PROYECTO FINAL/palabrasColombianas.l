%option noyywrap
%{
#include <stdio.h>

int lineas = 1;
int palabras = 0;
int caracteres = 0;


int mija = 0;
int pa = 0;
int charra = 0;
int filo = 0;
int camellar = 0;
int mecatear = 0;
int manes = 0;
int vole = 0;
int porra = 0;
int buchipluma = 0;
int berraca = 0;
int pispo = 0;
int tragada = 0;
int mata_pasiones = 0;
int loliar = 0;
int chichiguita = 0;
int checheres = 0;
int pieza = 0;
int trapito = 0;
int guaros = 0;
int ome = 0;
int chichipato = 0;
int parchese = 0;
int primita = 0;
int mor = 0;
int sizas = 0;
int jetota = 0;
int bacano = 0;
int sinverguenzas = 0;
int guayabo = 0;
int empinando = 0;
int amanada = 0;
int echada_palante = 0;

void imprimirResultado();
%}

LETRAS [a-zA-Z\xC3\x81\xC3\x89\xC3\x8D\xC3\x93\xC3\x9A\xC3\xA1\xC3\xA9\xC3\xAD\xC3\xB3\xC3\xBA\xC3\x91\xC3\xB1]

%%

[Mm]ija                     { mija++; palabras++; caracteres += yyleng; }
[Pp]a[\']                   { pa++; palabras++; caracteres += yyleng; }
[Cc]harra                   { charra++; palabras++; caracteres += yyleng; }
[Ff]ilo                     { filo++; palabras++; caracteres += yyleng; }
[Cc]amellar                 { camellar++; palabras++; caracteres += yyleng; }
[Mm]ecatear                 { mecatear++; palabras++; caracteres += yyleng; }
[Mm]anes                    { manes++; palabras++; caracteres += yyleng; }
[Vv]ol[\xC3\xA9]            { vole++; palabras++; caracteres += yyleng; }
[Pp]orra                    { porra++; palabras++; caracteres += yyleng; }
[Bb]uchipluma               { buchipluma++; palabras++; caracteres += yyleng; }
[Bb]erraca                  { berraca++; palabras++; caracteres += yyleng; }
[Pp]ispo                    { pispo++; palabras++; caracteres += yyleng; }
[Tt]ragada                  { tragada++; palabras++; caracteres += yyleng; }
[Mm]ata[ \t]+[Pp]asiones    { mata_pasiones++; palabras++; caracteres += yyleng; }
[Ll]oliar                   { loliar++; palabras++; caracteres += yyleng; }
[Cc]hichig[\xC3\xBC]ita     { chichiguita++; palabras++; caracteres += yyleng; }
[Cc]h[\xC3\xA9]cheres       { checheres++; palabras++; caracteres += yyleng; }
[Pp]ieza                    { pieza++; palabras++; caracteres += yyleng; }
[Tt]rapito                  { trapito++; palabras++; caracteres += yyleng; }
[Gg]uaros                   { guaros++; palabras++; caracteres += yyleng; }
[Oo]me                      { ome++; palabras++; caracteres += yyleng; }
[Cc]hichipato               { chichipato++; palabras++; caracteres += yyleng; }
[Pp]archese                 { parchese++; palabras++; caracteres += yyleng; }
[Pp]rimita                  { primita++; palabras++; caracteres += yyleng; }
[Mm]or                      { mor++; palabras++; caracteres += yyleng; }
[Ss]izas                    { sizas++; palabras++; caracteres += yyleng; }
[Jj]etota                   { jetota++; palabras++; caracteres += yyleng; }
[Bb]acano                   { bacano++; palabras++; caracteres += yyleng; }
[Ss]inverg[\xC3\xBC]enzas   { sinverguenzas++; palabras++; caracteres += yyleng; }
[Gg]uayabo                  { guayabo++; palabras++; caracteres += yyleng; }
[Ee]mpinando                { empinando++; palabras++; caracteres += yyleng; }
[Aa]ma[\xC3\xB1]ada         { amanada++; palabras++; caracteres += yyleng; }

[Ee]chada[ \t]+[Pp]a[\'][ \t]*[Ll]ante    { echada_palante++; palabras++; caracteres += yyleng; }

{LETRAS}+                   { palabras++; caracteres += yyleng; }
\n                          { lineas++; caracteres++; }
.                           { caracteres++; }

%%

void imprimirResultado() {
    printf("\n=== PALABRAS DEL LEXICO COLOMBIANO ENCONTRADAS ===\n\n");
    
    printf("Expresiones comunes:\n");
    printf("Mija/Mijita: %d\n", mija);
    printf("Pa': %d\n", pa);
    printf("Charra: %d\n", charra);
    printf("Aguantar filo: %d\n", filo);
    printf("Camellar: %d\n", camellar);
    printf("Mecatear: %d\n", mecatear);
    printf("Manes: %d\n", manes);
    printf("Vole (faltar el respeto): %d\n", vole);
    printf("Largar pa' la porra: %d\n", porra);
    printf("Buchipluma: %d\n", buchipluma);
    printf("Berraca: %d\n", berraca);
    
    printf("\nTerminos de relaciones y apariencia:\n");
    printf("Pispo: %d\n", pispo);
    printf("Tragada (enamorada): %d\n", tragada);
    printf("Mata pasiones: %d\n", mata_pasiones);
    printf("Primita: %d\n", primita);
    printf("Mor (amor): %d\n", mor);
    
    printf("\nActividades y objetos:\n");
    printf("Loliar: %d\n", loliar);
    printf("Chichiguita: %d\n", chichiguita);
    printf("Checheres: %d\n", checheres);
    printf("Pieza: %d\n", pieza);
    printf("Trapito: %d\n", trapito);
    printf("Guaros: %d\n", guaros);
    printf("Empinando el codo: %d\n", empinando);
    
    printf("\nExpresiones varias:\n");
    printf("Ome: %d\n", ome);
    printf("Chichipato: %d\n", chichipato);
    printf("Parchese: %d\n", parchese);
    printf("Sizas: %d\n", sizas);
    printf("Jetota: %d\n", jetota);
    printf("Bacano: %d\n", bacano);
    printf("Sinverguenzas: %d\n", sinverguenzas);
    printf("Guayabo: %d\n", guayabo);
    printf("Amanada: %d\n", amanada);
    printf("Echada pa'lante: %d\n", echada_palante);
    
    printf("\n=== ESTADISTICAS GENERALES ===\n");
    printf("Total de lineas: %d\n", lineas);
    printf("Total de palabras: %d\n", palabras);
    printf("Total de caracteres: %d\n", caracteres);
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Uso: %s <archivo.txt>\n", argv[0]);
        return 1;
    }

    FILE *archivo = fopen(argv[1], "r");
    if (!archivo) {
        printf("Error: No se pudo abrir el archivo '%s'\n", argv[1]);
        return 1;
    }

    yyin = archivo;
    yylex();
    fclose(archivo);

    imprimirResultado();

    return 0;
}