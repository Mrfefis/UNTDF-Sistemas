'''
24.  Crear una función que tome una lista de palabras y devuelva un diccionario con la 
cantidad de veces que aparece cada letra en las palabras, y un método para imprimir los 
resultados en un formato especificado. 


'''

def contar_letras(palabras):
    conteo_letras = {}  # Creamos un diccionario vacío para almacenar el conteo de cada letra
    for palabra in palabras:  # Iteramos sobre cada palabra en la lista de palabras
        for letra in palabra:  # Iteramos sobre cada letra en la palabra
            if letra in conteo_letras:  # Si la letra ya está en el diccionario, incrementamos su conteo
                conteo_letras[letra] += 1
            else:  # Si la letra no está en el diccionario, la agregamos con un conteo de 1
                conteo_letras[letra] = 1
    return conteo_letras  # Devolvemos el diccionario con el conteo de cada letra


def imprimir_resultados(conteo, formato):
    if formato == "simple":
        for letra, cantidad in conteo.items():
            print(f"Letra: {letra}, Veces que apareció: {cantidad}")
    elif formato == "detallado":
        print("Resultados detallados:")
        for letra, cantidad in conteo.items():
            print(f"Letra: {letra} - Veces que apareció: {cantidad}")
    else:
        print("Formato no válido. Por favor, elija 'simple' o 'detallado'.")


# Ejemplo de uso de la función y el método
palabras = ["hola", "mundo", "python", "hola"]
resultado = contar_letras(palabras)
imprimir_resultados(resultado, formato="simple")
print()
imprimir_resultados(resultado, formato="detallado")



'''
En esta implementación, la función contar_letras toma una lista de palabras como entrada y 
devuelve un diccionario con la cantidad de veces que aparece cada letra en las palabras.

La función imprimir_resultados toma el diccionario de conteo como entrada y un parámetro opcional 
formato para especificar cómo se deben imprimir los resultados. 
Puede imprimir los resultados en formato simple o detallado.

El ejemplo de uso muestra cómo contar las letras en una lista de palabras y 
luego imprimir los resultados en formato simple. Puedes cambiar el formato pasando 
"detallado" como argumento a la función imprimir_resultados si deseas ver los resultados
en un formato más detallado.
'''