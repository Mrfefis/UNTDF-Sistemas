program main;
uses crt, UlistaSimple, UlistaOrdenada, Uinterfaz;
{
	Consigna:
	Realice un procedimiento ORDEN que reciba una LISTA y un parámetro ASCENDENTE que
	vale verdadero si se quiere ordenar la lista ascendentemente y falso si se desea ordenar
	descendentemente. Use una lista desordenada.
}
var
	lista: Tlista;
	listaOrdenada: UlistaOrdenada.Tlista;
	opcion: char;
begin
	iniciar(lista);
	iniciar(listaOrdenada);
	repeat
		clrscr;
		writeln('Lista Enteros positivos');
		Opciones(opcion);
		if 
		case opcion of
			'1': begin
				clrscr;
				Cargar(lista);
			end;
			'2': destruir(lista);
			'3': begin
				clrscr;
				writeln('Lista Ordenada = ');
				Imprimir(lista);
				Pausa;
			end;
		end;
	until(opcion='0');
	destruir(lista);
	destruir(listaOrdenada);
end.