# 2) Escribir un programa que genere los primeros n términos de la serie de Fibonacci.
'''
def fibonacci(n):
    """
    Genera los primeros n términos de la serie de Fibonacci.

    Parámetros:
    - n: El número de términos de la serie de Fibonacci que se desea generar.

    Retorna:
    - Una lista que contiene los primeros n términos de la serie de Fibonacci.
    """
    # Inicializamos la lista para almacenar los términos de Fibonacci
    fibonacci_list = []

    # Los primeros dos términos de la serie de Fibonacci son 0 y 1
    a, b = 0, 1

    # Agregamos los primeros dos términos a la lista
    fibonacci_list.append(a)
    fibonacci_list.append(b)

    # Generamos los términos restantes de la serie de Fibonacci
    for _ in range(2, n):
        # Calculamos el siguiente término sumando los dos términos anteriores
        next_term = a + b
        # Actualizamos los valores de a y b para el siguiente cálculo
        a, b = b, next_term
        # Agregamos el siguiente término a la lista
        fibonacci_list.append(next_term)

    return fibonacci_list

# Solicitar al usuario el número de términos de Fibonacci que desea generar
n = int(input("Ingrese el número de términos de Fibonacci que desea generar: "))

# Generar los primeros n términos de la serie de Fibonacci
fibonacci_sequence = fibonacci(n)

# Imprimir la serie de Fibonacci generada
print("Los primeros", n, "términos de la serie de Fibonacci son:")
print(fibonacci_sequence)
'''
#=============================================
#=============================================
    
    
def lista_f(m,init=[0],contador=0,a=0,b=1):
    actual=a+b
    init.append(actual)
    if contador>m: 
        return init
    contador+=1
    return lista_f(m, init, contador, b , actual)

m = int(input("Ingrese el número de términos de Fibonacci que desea generar: "))

print(F'''Los primeros {m} términos de la serie de Fibonacci son:''')

print(lista_f(m))

# Hacer por lista por compresion.
    