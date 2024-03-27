''' Bueno vamos a ver que hacemos hoy

ayer vimos cosas de python

unas sentencias simples, etc.

orientada a testing, pass, funcionales, la idea es escribir un conjunto de testing como metodo, 
la idea es que no se rompa, armando formas basicas.



'''

agenda = { }


def Insertar(dni, datos, diccionario):
   '''
    Args:
        dni(int): _Descripcion_
        datos(diccionario): _descripcion_
        diccionario(diccionario):   _descripcion_
    '''
   diccionario[dni] = datos

   

def borrar(dni, diccionario):
    diccionario.delete(dni)

def modificar(dni, columna, dato, diccionario):
    diccionario[dni][columna] = dato

Insertar(10010010, {'Nombre': 'Franco',     'Apellido': 'Gomez',        'direccion': '640viv 3B, 1D'}, agenda)
Insertar(12312312, {'Nombre': 'Juan',       'Apellido': 'Raprel',       'direccion': 'al lado de la vieja'}, agenda)
Insertar(22331133, {'Nombre': 'Raul',       'Apellido': 'Sanchez',      'direccion': 'por alla'}, agenda)
Insertar(11223344, {'Nombre': 'Miguel',     'Apellido': 'Coso',         'direccion': 'alla te voy a dar mi direccion'}, agenda)
Insertar(55443322, {'Nombre': 'Samsom',     'Apellido': 'OtroCoso',     'direccion': 'que te importa'}, agenda)


'''
una manera dura de imprimir los datos de la agenda:

for x in agenda:
    print(agenda[x])
'''



def imprimir_agenda(agenda):
    print("##############################  Agenda  ##############################")
    print("")
    
    print("{:<15} {:<15} {:<30} {:<20}".format("DNI:", "Nombre:", "Apellido:", "Dirección:"))
    for dni, datos in agenda.items():
        nombre = datos['Nombre']
        apellido = datos['Apellido']
        direccion = datos['direccion']
        print("{:<15} {:<15} {:<30} {:<20}".format(dni, nombre, apellido, direccion))


imprimir_agenda(agenda)

#Ahora vamos a usar un temple

import string

def imprimir_agenda_template(agenda):
    template = string.Template("DNI: $dni\nNombre: $nombre\nApellido: $apellido\nDirección: $direccion\n")
    print("Agenda:")
    for dni, datos in agenda.items():
        print(template.substitute(dni=dni, nombre=datos['Nombre'], apellido=datos['Apellido'], direccion=datos['direccion']))

imprimir_agenda_template(agenda)

''' 
Cual es la diferencia?

Ambos métodos, tanto el uso de format() como el uso de string.
Template, son formas válidas de formatear cadenas en Python, 
pero tienen algunas diferencias importantes en cuanto a su sintaxis y funcionalidad:

Sintaxis:

format(): Utiliza el método format() de las cadenas de Python, 
donde se definen los marcadores de posición {} en la cadena y luego se reemplazan con los valores proporcionados.
string.Template: Utiliza la clase Template del módulo string de Python, 
donde las variables a reemplazar en la cadena están precedidas por el símbolo de dólar $.

Flexibilidad:
format(): Es muy flexible y potente, ya que permite realizar operaciones de formateo más avanzadas, 
como alineación, especificación de ancho, conversión de tipo, etc. Además, es parte del núcleo del lenguaje Python.
string.Template: Es más simple y seguro que format(), 
ya que no evalúa expresiones complejas ni permite la ejecución de código Python en la cadena de formato. 
Esto lo hace más adecuado cuando se trabaja con cadenas de formato proporcionadas por usuarios no confiables.

Legibilidad:
format(): Puede ser menos legible cuando se trabaja con cadenas de formato largas o complejas, 
especialmente si se utilizan muchos marcadores de posición.
string.Template: Puede ser más legible, ya que los marcadores de posición en la plantilla son más fáciles de 
identificar y no se mezclan con el texto circundante.
En resumen, format() es más versátil y poderoso, mientras que string.Template es más seguro y legible, 
especialmente en situaciones donde se trabaja con cadenas de formato dinámicas o proporcionadas por el usuario. 
La elección entre los dos métodos depende de las necesidades específicas del proyecto y de la preferencia 
del desarrollador en cuanto a flexibilidad y seguridad.


Ok vamos a tener que saber algo de HTML.


La idea de la materia seria, es que entiendan a buscar, y como apoyarse en herramientas.

'''
