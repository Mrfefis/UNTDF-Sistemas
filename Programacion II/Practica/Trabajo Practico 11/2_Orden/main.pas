program main;
uses crt, Ulista, UlistaOrdenada, Uinterfaz;
{
	Consigna:
	Realice un procedimiento ORDEN que reciba una LISTA y un parámetro ASCENDENTE que
	vale verdadero si se quiere ordenar la lista ascendentemente y falso si se desea ordenar
	descendentemente. Use una lista desordenada.
}


procedure Ordenar(var lista: Ulista.Tlista;
	var listaOrdenada: UlistaOrdenada.Tlista; Ascendente: boolean);
var
	aux: integer;
	copia: Ulista.Tlista;
begin
	UlistaOrdenada.destruir(listaOrdenada);
	Ulista.iniciar(copia);
	copia:= copiar(lista);
	while not Ulista.vacia(copia) do
	begin
		Ulista.eliminar(copia, aux);
		UlistaOrdenada.insertar(listaOrdenada, aux, Ascendente);
	end;
end;

var
	lista: Ulista.Tlista;
	listaOrdenada: UlistaOrdenada.Tlista;
	opcion: char;
begin
	Ulista.iniciar(lista);
	UlistaOrdenada.iniciar(listaOrdenada);
	repeat
		clrscr;
		writeln('Lista Enteros positivos');
		Imprimir(lista, listaOrdenada);
		Opciones(opcion);
		case opcion of
			'1': begin
				clrscr;
				Cargar(lista);
			end;
			'2': begin
				Ulista.destruir(lista);
				UlistaOrdenada.destruir(listaOrdenada);
			end;
			'3': Ordenar(lista, listaOrdenada, true);
			'4': Ordenar(lista, listaOrdenada, false);
		end;
	until(opcion='0');
	Ulista.destruir(lista);
	UlistaOrdenada.destruir(listaOrdenada);
end.