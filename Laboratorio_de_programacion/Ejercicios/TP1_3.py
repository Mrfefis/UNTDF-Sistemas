'''
3. Escribir un programa que calcule el factorial de un número entero n. 
'''

def factorial_n(n):
    lista = []
    resultado = 1
    for i in range(1,n+1):
        resultado = resultado * i
        lista.append(resultado)
    print(lista)
    print(resultado)


n = int(input("Ingrese el número de entero: "))

factorial_n(n)
