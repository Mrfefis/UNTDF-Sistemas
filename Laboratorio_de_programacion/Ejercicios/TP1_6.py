'''
6. Escribir un programa que calcule el producto punto de dos vectores.  
'''
import random


def CargarVectores(n, VectorA, VectorB):
    for i in range(n):
        aux = random.randrange(10)
        VectorA.append(aux)
        aux = random.randrange(10)
        VectorB.append(aux)

def ImprimoVectores(VectorA, VectorB):
    print("Vector A: ", VectorA)
    print("Vector B: ", VectorB)

def ProductoPuntoAxB(VectorA, VectorB):
    aux = 0
    for i in range(n):
        aux += VectorA[i] * VectorB[i]
        print("Paso ", i+1, ": ", VectorA[i], " * ", VectorB[i], " = ", aux)
    print("El producto punto de los Vectores AxB, es: ", aux)
    


#Defino los vectores:
VectorA = []
VectorB = []


#Aca el User define el largo de los vectores con n:
n = int(input("Ingrese el largo del que quiere que sean los vectores: "))

#Cargo aleatoriamente los vectores de n largo:
CargarVectores(n, VectorA, VectorB)

#Presento los vectores:
ImprimoVectores(VectorA, VectorB)

#Hago producto punto y muestro por pantalla los resultados:
ProductoPuntoAxB(VectorA, VectorB)