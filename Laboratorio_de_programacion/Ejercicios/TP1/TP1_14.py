'''
14.  Crear una función que tome una lista de palabras y devuelva un diccionario con la 
cantidad de veces que aparece cada letra en las palabras.

Para crear una función que tome una lista de palabras y devuelva un diccionario con la 
cantidad de veces que aparece cada letra en esas palabras, puedes seguir estos pasos:

Iterar sobre cada palabra en la lista.
Iterar sobre cada letra en la palabra.
Contar la cantidad de veces que aparece cada letra y almacenarla en un diccionario.
Devolver el diccionario con la cantidad de veces que aparece cada letra.
Aquí te muestro cómo puedes implementar esto en Python:
'''

def contar_letras(lista_palabras):
    conteo_letras = {}  # Creamos un diccionario vacío para almacenar el conteo de cada letra
    for palabra in lista_palabras:  # Iteramos sobre cada palabra en la lista de palabras
        for letra in palabra:  # Iteramos sobre cada letra en la palabra
            if letra in conteo_letras:  # Si la letra ya está en el diccionario, incrementamos su conteo
                conteo_letras[letra] += 1
            else:  # Si la letra no está en el diccionario, la agregamos con un conteo de 1
                conteo_letras[letra] = 1
    return conteo_letras  # Devolvemos el diccionario con el conteo de cada letra


# Ejemplo de uso de la función
palabras = ['hola', 'como', 'estas']
resultado = contar_letras(palabras)
print(resultado)

'''
En este código, la función contar_letras toma una lista de palabras como entrada y 
crea un diccionario vacío llamado conteo_letras. Luego, itera sobre cada palabra en la lista y 
luego sobre cada letra en esa palabra, contando la cantidad de veces que aparece cada letra y 
almacenándola en el diccionario conteo_letras.

El resultado del ejemplo de uso será un diccionario con la cantidad de veces que aparece 
cada letra en la lista de palabras de entrada. Por ejemplo, para la lista ['hola', 'como', 'estas'], 
el diccionario resultante será {'h': 1, 'o': 2, 'l': 1, 'a': 2, 'c': 1, 'm': 1, 'e': 1, 's': 3, 't': 1}.
'''