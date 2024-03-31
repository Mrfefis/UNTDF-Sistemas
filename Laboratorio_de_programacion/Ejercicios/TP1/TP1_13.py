'''
13.  Crear una función que tome un diccionario y devuelva una lista con las claves del 
diccionario ordenadas alfabéticamente.  

Puedes crear una función en Python que tome un diccionario como entrada y 
devuelva una lista con las claves del diccionario ordenadas alfabéticamente. 
Aquí tienes una posible implementación utilizando la función sorted():
'''

def ordenar_claves(diccionario):
    claves_ordenadas = sorted(diccionario.keys())  # Ordenamos las claves del diccionario alfabéticamente
    return claves_ordenadas  # Devolvemos la lista de claves ordenadas


# Ejemplo de uso de la función
diccionario = {'b': 2521, 'c': 3456, 'a': 178930}
claves_ordenadas = ordenar_claves(diccionario)
print(claves_ordenadas)

'''
En este código, la función ordenar_claves toma un diccionario como entrada y 
utiliza la función sorted() para ordenar las claves del diccionario alfabéticamente. 
Luego, devuelve la lista de claves ordenadas.

El resultado del ejemplo de uso será una lista con las claves del diccionario 
diccionario ordenadas alfabéticamente. 
Por ejemplo, para el diccionario  {'b': 2521, 'c': 3456, 'a': 178930}, 
la lista resultante será ['a', 'b', 'c'].
'''