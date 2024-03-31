'''
22.  Crear una función que tome una lista de números y devuelva un diccionario con el número 
de veces que aparece cada número en la lista, y un método para imprimir los resultados 
en un formato especificado. 

'''

def contar_numeros(lista):
    conteo = {}  # Creamos un diccionario vacío para almacenar el conteo de cada número
    for numero in lista:  # Iteramos sobre cada número en la lista
        if numero in conteo:  # Si el número ya está en el diccionario, incrementamos su conteo
            conteo[numero] += 1
        else:  # Si el número no está en el diccionario, lo agregamos con un conteo de 1
            conteo[numero] = 1
    return conteo  # Devolvemos el diccionario con el conteo de cada número


def imprimir_resultados(conteo, formato):
    if formato == "simple":
        for numero, cantidad in conteo.items():
            print(f"Número: {numero}, Veces que apareció: {cantidad}.")
    elif formato == "detallado":
        print("Resultados detallados:")
        for numero, cantidad in conteo.items():
            print(f"Número: {numero} - Veces que apareció: {cantidad}.")
    else:
        print("Formato no válido. Por favor, elija 'simple' o 'detallado'.")


# Ejemplo de uso de la función y el método
numeros = [1, 2, 3, 4, 1, 2, 3, 1, 2, 1]
resultado = contar_numeros(numeros)
imprimir_resultados(resultado, formato="simple")
print()
imprimir_resultados(resultado, formato="detallado")


'''

En esta implementación, la función contar_numeros toma una lista de números como entrada y 
devuelve un diccionario con el número de veces que aparece cada número en la lista.

La función imprimir_resultados toma el diccionario de conteo como entrada y 
un parámetro opcional formato para especificar cómo se deben imprimir los resultados. 
Puede imprimir los resultados en formato simple o detallado.

El ejemplo de uso muestra cómo contar los números en una lista y luego imprimir los 
resultados en formato simple. 
Puedes cambiar el formato pasando "detallado" como argumento a la función imprimir_resultados si 
deseas ver los resultados en un formato más detallado.
'''