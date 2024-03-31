'''
21.  Crear una clase Biblioteca que tenga como atributos una lista de libros, un diccionario de 
préstamos y métodos para prestar y devolver libros, y para imprimir todos los libros 
prestados y no prestados.


Aquí tienes una posible implementación de la clase Biblioteca, 
que tiene atributos como una lista de libros y un diccionario de préstamos, 
junto con métodos para prestar y devolver libros, y para imprimir todos los libros prestados y 
no prestados:
'''
class Libro:
    def __init__(self, titulo, autor, ano_publicacion, genero):
        self.titulo = titulo
        self.autor = autor
        self.ano_publicacion = ano_publicacion
        self.genero = genero

    def imprimir_datos(self, formato="simple"):
        if formato == "simple":
            print(f"Título: {self.titulo}, Autor: {self.autor}, Año de Publicación: {self.ano_publicacion}, Género: {self.genero}")
        elif formato == "detallado":
            print("Detalles del libro:")
            print(f"Título: {self.titulo}")
            print(f"Autor: {self.autor}")
            print(f"Año de Publicación: {self.ano_publicacion}")
            print(f"Género: {self.genero}")
        else:
            print("Formato no válido. Por favor, elija 'simple' o 'detallado'.")

    @staticmethod
    def buscar_por_genero(libros, genero):
        libros_encontrados = []
        for libro in libros:
            if libro.genero == genero:
                libros_encontrados.append(libro)
        return libros_encontrados

class Biblioteca:
    def __init__(self, libros):
        self.libros = libros
        self.prestamos = {}

    def prestar_libro(self, libro, usuario):
        if libro in self.libros:
            self.libros.remove(libro)
            self.prestamos[libro] = usuario
            print(f"El libro '{libro.titulo}' ha sido prestado al usuario: {usuario}.")
        else:
            print(f"El libro '{libro.titulo}' no está disponible para préstamo.")

    def devolver_libro(self, libro):
        if libro in self.prestamos:
            usuario = self.prestamos.pop(libro)
            self.libros.append(libro)
            print(f"El libro '{libro.titulo}' ha sido devuelto por el usuario: {usuario}.")
        else:
            print("El libro no está registrado como prestado.")

    def imprimir_libros_prestados(self):
        print("Libros prestados:")
        for libro, usuario in self.prestamos.items():
            print(f"'{libro.titulo}' prestado al usuario:  {usuario}.")

    def imprimir_libros_disponibles(self):
        print("Libros disponibles:")
        for libro in self.libros:
            print(f"'{libro.titulo}'")


# Ejemplo de uso de la clase Biblioteca
libro1 = Libro("Cien años de soledad", "Gabriel García Márquez", 1967, "Realismo mágico")
libro2 = Libro("1984", "George Orwell", 1949, "Ciencia ficción")
libro3 = Libro("El Señor de los Anillos", "J.R.R. Tolkien", 1954, "Fantasía")

biblioteca = Biblioteca([libro1, libro2, libro3])

# Préstamo de libros
biblioteca.prestar_libro(libro1, "Usuario1")
biblioteca.prestar_libro(libro2, "Usuario2")

# Devolución de libros
biblioteca.devolver_libro(libro1)

# Impresión de libros prestados y disponibles
biblioteca.imprimir_libros_prestados()
biblioteca.imprimir_libros_disponibles()

'''
En esta implementación, la clase Biblioteca tiene un constructor __init__ que inicializa 
los atributos libros y prestamos. 
Tiene métodos como prestar_libro para prestar un libro a un usuario, 
devolver_libro para devolver un libro prestado, imprimir_libros_prestados para imprimir todos 
los libros prestados y imprimir_libros_disponibles para imprimir todos los libros disponibles.

El ejemplo de uso muestra cómo crear una instancia de la clase Biblioteca, prestar y devolver libros, 
e imprimir los libros prestados y disponibles.
'''