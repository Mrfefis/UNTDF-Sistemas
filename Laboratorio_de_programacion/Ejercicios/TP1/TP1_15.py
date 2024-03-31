'''
15.  Crear una función que tome una lista de diccionarios y devuelva una lista con las claves 
comunes a todos los diccionarios.



Para crear una función que tome una lista de diccionarios y 
devuelva una lista con las claves comunes a todos los diccionarios, puedes seguir estos pasos:

Obtener todas las claves de cada diccionario en la lista.
Utilizar un conjunto (set) para encontrar la intersección de las claves de todos los diccionarios.
Convertir el conjunto resultante de claves comunes de nuevo a una lista.
Aquí tienes una implementación en Python:
'''

def claves_comunes(lista_diccionarios):
    if not lista_diccionarios:  # Verificar si la lista está vacía
        return []  # Devolver una lista vacía si la lista de diccionarios está vacía

    claves = set(lista_diccionarios[0].keys())  # Obtener las claves del primer diccionario como conjunto
    for diccionario in lista_diccionarios[1:]:  # Iterar sobre los diccionarios restantes en la lista
        claves = claves.intersection(diccionario.keys())  # Encontrar la intersección de claves comunes

    return list(claves)  # Convertir el conjunto de claves comunes a una lista y devolverla


# Ejemplo de uso de la función
lista_diccionarios = [
    {'a': 1, 'b': 2, 'c': 3, 'f':15},
    {'b': 4, 'c': 5, 'd': 6, 'f':20},
    {'c': 7, 'd': 8, 'e': 9, 'f':25}
]
resultado = claves_comunes(lista_diccionarios)
print(resultado)

'''
En este código, la función claves_comunes toma una lista de diccionarios como entrada:

1) Primero, obtiene las claves del primer diccionario en la lista y las convierte en un conjunto. 

2) Luego, itera sobre los diccionarios restantes en la lista y encuentra la intersección de claves 
comunes utilizando el método intersection() de los conjuntos. 

3) Finalmente, convierte el conjunto de claves comunes de nuevo a una lista y la devuelve.

El resultado del ejemplo de uso será una lista con las claves comunes a todos los diccionarios 
en la lista de entrada. En este ejemplo, el resultado será ['f', c'], ya que la clave 'c' y 'f' es común a 
todos los diccionarios.
'''