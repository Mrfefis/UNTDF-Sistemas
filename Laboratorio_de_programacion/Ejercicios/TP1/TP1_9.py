'''
9. Crear una clase Estudiante que herede de Persona y tenga como atributos el número de 
estudiante y la lista de notas, y un método para calcular el promedio de notas.
'''

class Persona:
    def __init__(self, nombre, edad):  # Definimos la clase Persona con un constructor que recibe nombre y edad como parámetros
        self.nombre = nombre  # Asignamos el nombre recibido al atributo nombre de la instancia
        self.edad = edad  # Asignamos la edad recibida al atributo edad de la instancia
        
    def imprimir_datos(self):  # Método para imprimir los datos de la persona
        print("Nombre:", self.nombre)  # Imprimimos el nombre de la persona
        print("Edad:", self.edad)  # Imprimimos la edad de la persona
        print("Número de estudiante:", estudiante1.numero_estudiante)  # Imprimimos el número de estudiante
        print("Notas:", estudiante1.notas)  # Imprimimos la lista de notas
        print("Promedio de notas:", estudiante1.calcular_promedio())  # Llamamos al método para calcular el promedio de las notas


class Estudiante(Persona):  # Definimos la clase Estudiante que hereda de la clase Persona
    def __init__(self, nombre, edad, numero_estudiante, notas):  # Constructor de la clase Estudiante
        super().__init__(nombre, edad)  # Llamamos al constructor de la clase base (Persona)
        self.numero_estudiante = numero_estudiante  # Asignamos el número de estudiante recibido al atributo numero_estudiante
        self.notas = notas  # Asignamos la lista de notas recibida al atributo notas
        
    def calcular_promedio(self):  # Método para calcular el promedio de las notas
        if self.notas:  # Verificamos si la lista de notas no está vacía
            promedio = sum(self.notas) / len(self.notas)  # Calculamos el promedio de las notas
            return promedio  # Devolvemos el promedio
        else:
            return "No hay notas disponibles"  # Si la lista de notas está vacía, devolvemos un mensaje indicando que no hay notas


# Ejemplo de uso de la clase Estudiante
estudiante1 = Estudiante("Pedro", 20, 12345, [85, 90, 75, 88, 92])  # Creamos una instancia de la clase Estudiante
estudiante1.imprimir_datos()  # Llamamos al método de la clase base para imprimir los datos de la persona
