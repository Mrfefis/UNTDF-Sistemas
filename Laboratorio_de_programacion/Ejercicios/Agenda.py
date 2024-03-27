class Agenda:
  
    def __init__(self):
        self.agenda={}

    def __iter__(self):
      self.agenda_iter=iter(self.agenda.values())
      return self
    
    def __next__(self):
        return next(self.agenda_iter)['Nombre']


    def insertar(self, dni, datos, agenda):
        self.agenda[dni] = datos

    
    def borrar(self, dni):
        self.agenda.delete(dni)

    def modificar(self, dni, columna, dato):
        self.agenda[dni][columna] = dato


agenda = Agenda()

agenda.insertar(10010010, {'Nombre': 'Franco',     'Apellido': 'Gomez',        'direccion': '640viv 3B, 1D'}, agenda)
agenda.insertar(12312312, {'Nombre': 'Juan',       'Apellido': 'Raprel',       'direccion': 'al lado de la vieja'}, agenda)
agenda.insertar(22331133, {'Nombre': 'Raul',       'Apellido': 'Sanchez',      'direccion': 'por alla'}, agenda)
agenda.insertar(11223344, {'Nombre': 'Miguel',     'Apellido': 'Coso',         'direccion': 'alla te voy a dar mi direccion'}, agenda)
agenda.insertar(55443322, {'Nombre': 'Samsom',     'Apellido': 'OtroCoso',     'direccion': 'que te importa'}, agenda)

#agenda.imprimir_agenda()
for i in agenda:
    print(i)

