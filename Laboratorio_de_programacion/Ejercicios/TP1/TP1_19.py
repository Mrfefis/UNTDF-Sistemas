'''
19.  Crear una clase Estudiante que herede de Persona y tenga como atributos el número de 
estudiante, la lista de notas y el promedio de notas, y métodos para agregar notas, 
calcular el promedio y mostrar el promedio en una escala de calificaciones. 
'''

class Persona:
    def __init__(self, nombre, edad, genero):
        self.nombre = nombre
        self.edad = edad
        self.genero = genero
    
    def imprimir_datos(self, formato="simple"):
        if formato == "simple":
            print(f"Nombre: {self.nombre}, Edad: {self.edad}, Género: {self.genero}")
        elif formato == "detallado":
            print("Detalles de la persona:")
            print(f"Nombre: {self.nombre}")
            print(f"Edad: {self.edad}")
            print(f"Género: {self.genero}")
        else:
            print("Formato no válido. Por favor, elija 'simple' o 'detallado'.")


class Estudiante(Persona):
    def __init__(self, nombre, edad, genero, numero_estudiante):
        super().__init__(nombre, edad, genero)
        self.numero_estudiante = numero_estudiante
        self.notas = []
        self.promedio = None

    def agregar_nota(self, nota):
        self.notas.append(nota)

    def calcular_promedio(self):
        if self.notas:
            self.promedio = sum(self.notas) / len(self.notas)
        else:
            self.promedio = None

    def mostrar_promedio(self):
        if self.promedio is not None:
            if self.promedio >= 90:
                escala = "A"
            elif self.promedio >= 80:
                escala = "B"
            elif self.promedio >= 70:
                escala = "C"
            elif self.promedio >= 60:
                escala = "D"
            else:
                escala = "F"
            print(f"El promedio del estudiante {self.nombre} es {self.promedio:.2f}, calificado como '{escala}'.")
        else:
            print("El estudiante no tiene notas registradas.")


# Ejemplo de uso de la clase Estudiante
estudiante1 = Estudiante("Juan", 20, "Masculino", "E001")
estudiante1.agregar_nota(85)
estudiante1.agregar_nota(78)
estudiante1.agregar_nota(92)
estudiante1.calcular_promedio()
estudiante1.mostrar_promedio()

'''
En esta implementación, la clase Estudiante hereda de la clase Persona y agrega nuevos 
atributos como numero_estudiante, notas y promedio. 
Tiene métodos adicionales como agregar_nota para agregar notas, 
calcular_promedio para calcular el promedio de notas y mostrar_promedio para mostrar el promedio 
en una escala de calificaciones.

El ejemplo de uso crea una instancia de la clase Estudiante, agrega algunas notas, 
calcula el promedio y muestra el promedio en una escala de calificaciones.
'''