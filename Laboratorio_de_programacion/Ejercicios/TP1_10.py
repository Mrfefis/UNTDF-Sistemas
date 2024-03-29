'''
10.  Crear una clase Libro que tenga como atributos título, autor y año de publicación, y un 
método para imprimir los datos del libro.
'''

class Libro:
    def __init__(self, titulo, autor, ano_publicacion):  # Constructor de la clase Libro
        self.titulo = titulo  # Asignamos el título recibido al atributo título
        self.autor = autor  # Asignamos el autor recibido al atributo autor
        self.ano_publicacion = ano_publicacion  # Asignamos el año de publicación recibido al atributo año de publicación
        
    def imprimir_datos(self):  # Método para imprimir los datos del libro
        print("Título:", self.titulo)  # Imprimimos el título del libro
        print("Autor:", self.autor)  # Imprimimos el autor del libro
        print("Año de publicación:", self.ano_publicacion)  # Imprimimos el año de publicación del libro
        

# Ejemplo de uso de la clase Libro
libro1 = Libro("El Señor de los Anillos", "J.R.R. Tolkien", 1954)  # Creamos una instancia de la clase Libro
libro1.imprimir_datos()  # Llamamos al método para imprimir los datos del libro

