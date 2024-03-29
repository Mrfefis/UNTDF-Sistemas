'''
11.  Crear una clase Biblioteca que tenga como atributos una lista de libros y un método para 
imprimir todos los libros. 
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

class Biblioteca:
    def __init__(self, lista_libros):  # Constructor de la clase Biblioteca
        self.lista_libros = lista_libros  # Asignamos la lista de libros recibida al atributo lista_libros
        
    def imprimir_libros(self):  # Método para imprimir todos los libros de la biblioteca
        print("Libros en la biblioteca:")
        for libro in self.lista_libros:  # Iteramos sobre cada libro en la lista de libros
            libro.imprimir_datos()  # Llamamos al método para imprimir los datos del libro
            print()  # Imprimimos una línea en blanco después de cada libro


# Ejemplo de uso de la clase Biblioteca
libro1 = Libro("El Señor de los Anillos", "J.R.R. Tolkien", 1954)  # Creamos instancias de la clase Libro
libro2 = Libro("Harry Potter y la piedra filosofal", "J.K. Rowling", 1997)
libro3 = Libro("Cien años de soledad", "Gabriel García Márquez", 1967)

biblioteca = Biblioteca([libro1, libro2, libro3])  # Creamos una instancia de la clase Biblioteca con una lista de libros
biblioteca.imprimir_libros()  # Llamamos al método para imprimir todos los libros de la biblioteca
