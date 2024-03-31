'''
12.  Crear una función que tome una lista de números y devuelva un diccionario con el número 
de veces que aparece cada número en la lista. 


Puedes crear una función en Python que tome una lista de números como entrada y 
devuelva un diccionario donde las claves sean los números y los valores sean el 
número de veces que aparece cada número en la lista. Aquí tienes una posible implementación:
'''

def contar_numeros(lista):
    conteo = {}  # Creamos un diccionario vacío para almacenar el conteo de cada número
    for numero in lista:  # Iteramos sobre cada número en la lista
        if numero in conteo:  # Si el número ya está en el diccionario, incrementamos su conteo
            conteo[numero] += 1
        else:  # Si el número no está en el diccionario, lo agregamos con un conteo de 1
            conteo[numero] = 1
    return conteo  # Devolvemos el diccionario con el conteo de cada número



# Ejemplo de uso de la función
numeros = [1, 2, 3, 4, 1, 2, 3, 1, 2, 1]
resultado = contar_numeros(numeros)
print(resultado)


'''
En este código, la función contar_numeros toma una lista de números como entrada y 
crea un diccionario vacío llamado conteo. Luego, itera sobre cada número en la lista y 
actualiza el diccionario conteo con el número de veces que aparece cada número. 
Finalmente, devuelve el diccionario con el conteo de cada número.

El resultado del ejemplo de uso será un diccionario que contiene el número de veces 
que cada número aparece en la lista de entrada. Por ejemplo, 
para la lista [1, 2, 3, 4, 1, 2, 3, 1, 2, 1], 
el diccionario resultante sería {1: 4, 2: 3, 3: 2, 4: 1}.
'''