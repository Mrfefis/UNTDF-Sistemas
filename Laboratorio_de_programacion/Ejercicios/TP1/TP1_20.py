'''
20.  Crear una clase Libro que tenga como atributos título, autor, año de publicación y género, 
y métodos para imprimir los datos del libro en un formato especificado y buscar libros por 
género.


Aquí tienes una posible implementación de la clase Libro, que tiene atributos como 
título, autor, año de publicación y género, junto con métodos para imprimir los datos del libro en un 
formato especificado y para buscar libros por género:
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


# Ejemplo de uso de la clase Libro
libro1 = Libro("Cien años de soledad", "Gabriel García Márquez", 1967, "Realismo mágico")
libro2 = Libro("1984", "George Orwell", 1949, "Ciencia ficción")
libro3 = Libro("El Señor de los Anillos", "J.R.R. Tolkien", 1954, "Fantasía")

# Imprimir datos en formato simple
libro1.imprimir_datos()
libro2.imprimir_datos()

# Buscar libros por género
libros = [libro1, libro2, libro3]
libros_ciencia_ficcion = Libro.buscar_por_genero(libros, "Ciencia ficción")
print("\nLibros de ciencia ficción encontrados:")
for libro in libros_ciencia_ficcion:
    libro.imprimir_datos("simple") # O "detallado", seria la otra opcion.


'''
En esta implementación, la clase Libro tiene un constructor __init__ que inicializa los atributos 
titulo, autor, ano_publicacion y genero. 
También tiene un método imprimir_datos que acepta un parámetro opcional formato y 
imprime los datos del libro en el formato especificado.

Además, la clase Libro tiene un método estático buscar_por_genero que recibe una lista de libros y
 un género como entrada, y devuelve una lista de libros que pertenecen al género especificado.

El ejemplo de uso muestra cómo crear instancias de la clase Libro, imprimir sus datos en diferentes 
formatos y buscar libros por género.
'''