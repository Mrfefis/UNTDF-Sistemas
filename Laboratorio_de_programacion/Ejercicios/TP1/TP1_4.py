'''
4. Escribir un programa que calcule el promedio de una lista de números.
'''

import random

def CargarLista(n):
    for i in range(n):
        aux = random.randrange(100)
        Lista.append(aux)
    print(Lista)

def CalcularPromedio(Lista):
    valorTotal = 0
    for i in Lista:
        valorTotal += i
    print(valorTotal/len(Lista))


Lista = []

n = int(input("Ingrese el maximo de su lista: "))

CargarLista(n)

print("El promedio de su Lista es: ")

CalcularPromedio(Lista)