def es_entero(cadena):
    for c in cadena:
        if c < '0' or c > '9':
            return False
    return len(cadena) > 0

def es_palabra(cadena):
    for c in cadena:
        if not (('a' <= c <= 'z') or ('A' <= c <= 'Z')):
            return False
    return len(cadena) > 0

def es_compuesta(cadena):
    for c in cadena:
        if not (('a' <= c <= 'z') or ('A' <= c <= 'Z') or ('0' <= c <= '9')):
            return False
    return len(cadena) > 0

def clasificar(cadena):
    if es_entero(cadena):
        return "entero"
    elif es_palabra(cadena):
        return "palabra"
    elif es_compuesta(cadena):
        return "compuesta"
    else:
        return "no clasificada"

print("Programa 1")
print("Escribe 'Salir' para cerrar el programa")

while True:
    entrada = input("Escribe algo: ")
    if entrada.lower() == "salir":
        print("saliendo")
        break

    palabras = entrada.split()


    total = len(palabras)
    enteros = 0
    palabras_alpha = 0
    compuestas = 0

    for palabra in palabras:
        tipo = clasificar(palabra)
        print(f"{palabra}: {tipo}")
        if tipo == "entero":
            enteros += 1
        elif tipo == "palabra":
            palabras_alpha += 1
        elif tipo == "compuesta":
            compuestas += 1

    #
    resumen = f"{total} -"
    if enteros > 0:
        resumen += f" {enteros} entero" + ("s" if enteros > 1 else "")
    if palabras_alpha > 0:
        resumen += f", {palabras_alpha} palabra" + ("s" if palabras_alpha > 1 else "")
    if compuestas > 0:
        resumen += f", {compuestas} compuesta" + ("s" if compuestas > 1 else "")
    print(resumen)