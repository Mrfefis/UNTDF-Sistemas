'''
23.  Crear una función que tome un diccionario y devuelva una lista con las claves del 
diccionario ordenadas por valor, de mayor a menor.
'''

def claves_por_valor(diccionario):
    # Creamos una lista de tuplas (clave, valor) a partir del diccionario
    items = list(diccionario.items())
    # Ordenamos la lista de tuplas por el valor (en orden descendente)
    items.sort(key=lambda x: x[1], reverse=True)
    # Extraemos las claves ordenadas de la lista de tuplas
    claves_ordenadas = [clave for clave, valor in items]
    return claves_ordenadas


# Ejemplo de uso de la función
diccionario = {'a': 10, 'b': 5, 'c': 20, 'd': 15}
resultado = claves_por_valor(diccionario)
print(resultado)

'''
Ahora, vamos a explicar cada parte del código:

items = list(diccionario.items()): Aquí creamos una lista de tuplas (clave, valor) 
a partir del diccionario utilizando el método items(). 
Esto nos da una lista de todas las parejas clave-valor del diccionario.

items.sort(key=lambda x: x[1], reverse=True): 
Luego, ordenamos esta lista de tuplas por el valor (es decir, x[1], donde x representa cada 
tupla en la lista) en orden descendente. 
Esto se hace utilizando la función sort() de la lista y especificando una función de clave (key) 
que extrae el valor de cada tupla. La opción reverse=True hace que se ordene en orden descendente.

claves_ordenadas = [clave for clave, valor in items]: Finalmente, extraemos las claves ordenadas 
de la lista de tuplas utilizando una comprensión de lista. Esto nos da una lista de claves ordenadas 
por valor de mayor a menor.

La función claves_por_valor toma un diccionario como entrada y devuelve una lista con las 
claves del diccionario ordenadas por valor, de mayor a menor.
'''