'''
16.  Crear una función que tome una lista de números y devuelva una lista con los números 
impares elevados al cuadrado.

Para crear una función que tome una lista de números y devuelva una lista con 
los números impares elevados al cuadrado, puedes seguir estos pasos:

Iterar sobre cada número en la lista.
Verificar si el número es impar.
Si el número es impar, elevarlo al cuadrado.
Agregar el resultado a una nueva lista.
Aquí tienes una implementación en Python:
'''

def impares_cuadrado(lista_numeros):
    impares_cuadrado = []  # Creamos una lista vacía para almacenar los cuadrados de los números impares
    for numero in lista_numeros:  # Iteramos sobre cada número en la lista
        if numero % 2 != 0:  # Verificamos si el número es impar
            impares_cuadrado.append(numero ** 2)  # Elevamos al cuadrado el número impar y lo agregamos a la lista
    return impares_cuadrado  # Devolvemos la lista con los cuadrados de los números impares


# Ejemplo de uso de la función
numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
resultado = impares_cuadrado(numeros)
print(resultado)


'''
En este código, la función impares_cuadrado toma una lista de números como entrada. 
Itera sobre cada número en la lista y verifica si es impar. 
Si el número es impar, eleva al cuadrado ese número y lo agrega a una lista llamada impares_cuadrado. 
Finalmente, devuelve esta lista con los cuadrados de los números impares.

El resultado del ejemplo de uso será una lista con los cuadrados de los números impares en la 
lista de entrada. En este caso, el resultado será [1, 9, 25, 49, 81], 
ya que son los cuadrados de los números impares 1, 3, 5, 7 y 9.
'''