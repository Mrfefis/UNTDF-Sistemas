'''
8. Escribir un programa que implemente el algoritmo de ordenamiento de burbuja en una 
lista de números. 
Crear una clase Persona que tenga como atributos nombre y edad, y un 
método para imprimir los datos de la persona. 
'''

class Persona:
    def __init__(self, nombre, edad):  # Definimos la clase Persona con un constructor que recibe nombre y edad como parámetros
        self.nombre = nombre  # Asignamos el nombre recibido al atributo nombre de la instancia
        self.edad = edad  # Asignamos la edad recibida al atributo edad de la instancia
        
    def imprimir_datos(self):  # Método para imprimir los datos de la persona
        print("Nombre:", self.nombre)  # Imprimimos el nombre de la persona
        print("Edad:", self.edad)  # Imprimimos la edad de la persona
        

def ordenamiento_burbuja(lista):
    n = len(lista)  # Obtenemos la longitud de la lista
    for i in range(n):  # Iteramos sobre la lista
        for j in range(0, n-i-1):  # Iteramos sobre los elementos de la lista
            if lista[j] > lista[j+1]:  # Comparamos elementos adyacentes
                lista[j], lista[j+1] = lista[j+1], lista[j]  # Intercambiamos si el elemento actual es mayor que el siguiente


# Ejemplo de uso del ordenamiento de burbuja
numeros = [64, 34, 25, 12, 22, 11, 90]  # Creamos una lista de números desordenados
ordenamiento_burbuja(numeros)  # Llamamos a la función de ordenamiento de burbuja
print("Lista ordenada:", numeros)  # Imprimimos la lista ordenada

# Ejemplo de uso de la clase Persona
persona1 = Persona("Juan", 30)  # Creamos una instancia de la clase Persona con nombre "Juan" y edad 30
persona1.imprimir_datos()  # Llamamos al método para imprimir los datos de la persona
