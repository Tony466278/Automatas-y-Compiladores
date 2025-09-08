import re

def clasificar_lexemas(texto):
    tokens = texto.split()
    palabras = []
    numeros = []
    compuestas = []
    for t in tokens:
        if re.fullmatch(r"[a-zA-ZáéíóúÁÉÍÓÚñÑ]+", t):
            palabras.append(t)
        elif re.fullmatch(r"\d+", t):
            numeros.append(t)
        else:
            compuestas.append(t)
    return palabras, numeros, compuestas

def main():
    archivo = "Texto Programa.txt"  # Cambia al nombre de tu archivo
    with open(archivo, encoding="utf-8") as f:
        data = f.read()

    palabras, numeros, compuestas = clasificar_lexemas(data)

    print("Palabras:", palabras)
    print("Números:", numeros)
    print("Compuestas:", compuestas)

if __name__ == "__main__":
    main()
