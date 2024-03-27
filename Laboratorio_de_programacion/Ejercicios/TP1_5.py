'''
5. Escribir un programa que encuentre el número máximo y mínimo 
en una lista de números. 
'''

import random

def CargarLista(n):
    for i in range(n):
        aux = random.randrange(100)
        Lista.append(aux)
    print(Lista)

def CalcularMaximoMinimo(Lista):
    Maximo = 0
    Minimo = 10000
    for i in Lista:
        if i < Minimo:
            Minimo = i
        if i > Maximo:
            Maximo = i
    print("El valor Maximo de tu lista es: ", Maximo)
    print("El valor Minimo de tu lista es: ", Minimo)
    


Lista = []

n = int(input("Ingrese el maximo de su lista: "))

CargarLista(n)

CalcularMaximoMinimo(Lista)