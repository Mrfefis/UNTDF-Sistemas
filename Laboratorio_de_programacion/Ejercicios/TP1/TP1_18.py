'''
18.  Crear una clase Persona que tenga como atributos nombre, edad y género, y un método 
para imprimir los datos de la persona en un formato especificado.  

Aquí tienes una posible implementación de la clase Persona con los atributos 
nombre, edad y género, junto con un método para imprimir los datos de la persona 
en un formato especificado:
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


# Ejemplo de uso de la clase Persona
persona1 = Persona("Juan", 30, "Masculino")
persona1.imprimir_datos()  # Imprime los datos en formato simple
print()
persona1.imprimir_datos("detallado")  # Imprime los datos en formato detallado


'''
En esta implementación, la clase Persona tiene un constructor __init__ que inicializa los 
atributos nombre, edad y género. 
Además, tiene un método imprimir_datos que acepta un parámetro opcional formato, 
que puede ser "simple" o "detallado", y luego imprime los datos de la persona en el formato especificado.

El método imprimir_datos utiliza una estructura condicional para determinar qué formato de 
impresión utilizar. Si no se proporciona un formato válido, se imprime un mensaje indicando que el 
formato no es válido.

El ejemplo de uso muestra cómo crear una instancia de la clase Persona y luego imprimir sus 
datos en formatos simple y detallado.
'''