
    #Buscar operadores, a la hora de construir cosas.

# 1) Escribir un programa que calcule la suma de los números enteros desde 1 hasta n.

def suma_enteros(n):
    suma = 0
    for i in range(1, n + 1):
        suma += i
    return suma

# Solicitar al usuario el valor de n
n = int(input("Ingresa un número entero positivo: "))

# Calcular la suma de los enteros desde 1 hasta n
resultado = suma_enteros(n)

# Imprimir el resultado
print("La suma de los enteros desde 1 hasta", n, "es:", resultado)


'''
Explicación del programa:

Definimos una función suma_enteros(n) que toma un argumento n.
Inicializamos una variable suma a cero, que se utilizará para almacenar la suma de los enteros.
Utilizamos un bucle for para iterar sobre los números desde 1 hasta n (incluyendo n).
En cada iteración del bucle, agregamos el valor de i a la variable suma.
Al final, devolvemos el valor de suma.
Solicitamos al usuario que ingrese un número entero positivo n.
Llamamos a la función suma_enteros(n) con el valor ingresado por el usuario y almacenamos 
el resultado en la variable resultado.
Imprimimos el resultado.
Este programa calculará la suma de todos los enteros desde 1 hasta 
el número ingresado por el usuario.

'''