program main;
uses crt, UlistaOrdenada, Uinterfaz;
{
	Consigna:
	Escribir un programa en Pascal que forme una lista simplemente encadenada y ordenada
	de enteros positivos que se van leyendo. El proceso finaliza con un entero negativo.
	Escriba el procedimiento que imprima lista anterior.
}

var
	lista: Tlista;
	opcion: char;
begin
	iniciar(lista);
	repeat
		clrscr;
		writeln('Lista Ordenada de enteros positivos');
		Opciones(opcion);
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
end.