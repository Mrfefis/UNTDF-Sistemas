'''
17.  Crear una función que tome dos listas y devuelva una lista con los elementos comunes a 
ambas listas. 


Puedes crear una función en Python que tome dos listas como entrada y 
devuelva una lista con los elementos comunes a ambas listas. 
Aquí tienes una posible implementación:
'''

def elementos_comunes(lista1, lista2):
    return list(set(lista1) & set(lista2))  # Intersección de conjuntos


# Ejemplo de uso de la función
lista1 = [1, 2, 3, 4, 5]
lista2 = [4, 5, 6, 7, 8]
resultado = elementos_comunes(lista1, lista2)
print("Aquellos elementos mutuos, son: ", resultado)


'''
En este código, la función elementos_comunes toma dos listas como entrada y 
utiliza la operación de intersección de conjuntos (&) para encontrar los elementos 
comunes entre ambas listas. Luego, convierte el conjunto resultante de elementos 
comunes de nuevo a una lista y la devuelve.

El resultado del ejemplo de uso será una lista con los elementos comunes a ambas listas de entrada. 
En este caso, el resultado será [4, 5], ya que son los elementos comunes entre las dos listas proporcionadas.
'''