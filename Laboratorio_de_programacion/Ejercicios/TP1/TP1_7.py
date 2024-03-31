'''
7. Escribir un programa que encuentre los números primos desde 1 hasta n.  
'''

#Para encontrar todos los números primos del 1 al n
# puedes usar el algoritmo conocido como la "criba de Eratóstenes". 
#Aquí te muestro cómo implementarlo en Python:

def encontrar_primos(n):
    # Creamos una lista para marcar los números compuestos
    compuestos = [False] * (n+1)
    # Creamos una lista para almacenar los números primos
    primos = []
    
    # Iteramos sobre los números desde 2 hasta n
    for i in range(2, n+1):
        # Si el número no ha sido marcado como compuesto, entonces es primo
        if not compuestos[i]:
            primos.append(i)
            # Marcamos los múltiplos de i como compuestos
            for j in range(i*i, n+1, i):
                compuestos[j] = True
                
    return primos

# Pedimos al usuario que ingrese el valor de n
n = int(input("Ingrese el valor de n: "))

# Encontramos los números primos hasta n
primos = encontrar_primos(n)

# Imprimimos los números primos encontrados
print("Los números primos hasta", n, "son:", primos)
