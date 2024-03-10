program main;
uses crt, UlistaArreglo;
{
	Consigna:
	Escríbanse programas para insertar, suprimir y localizar un elemento en una
	lista clasificada, usando realizaciones de
	a) Arreglos
	b) Apuntadores
	c) Cursores
	¿Cuál es el tiempo de ejecución de cada uno de estos programas?
}
const
	randlim = 15;

// ---------------------------------SUBPROGRAMAS---------------------------------

procedure MostrarLista(var lista: Tlista);
var
	i: Tindice;
begin
	write('[');
	i:= primero(lista);
	if (i<>fin(lista)) then begin
		while (siguiente(i)<>fin(lista)) do begin
			write(recuperar(lista, i), ', ');
			i:= siguiente(i)
		end;
		write(recuperar(lista, i))
	end;
	writeln(']');
end;

procedure LocalizarLista(var lista: Tlista);
var
	i: integer;
	aux: Telemento;
	posicion: Tindice;
begin
	write('Elemento: '); readln(aux);
	posicion:= localizar(lista, aux);
	if posicion=-1 then
		writeln(aux, ' no esta en la lista')
	else writeln(aux, ' esta en la posicion ', posicion)
end;

procedure Presentacion;
begin
	clrscr;
	writeln;
	writeln('-----------------------------------------------------');
	writeln('Operaciones de listas con Diferentes Implementaciones');
	writeln('-----------------------------------------------------');
	writeln;
end;

procedure Opciones(var opcion: char);
begin
	writeln;
	writeln('1. Cargar Elementos.');
	writeln('2. Suprimir elemento.');
	writeln('3. Localizar elemento.');
	writeln('4. Terminar.');
	writeln;
	write('Opcion: '); readln(opcion)
end;

// ------------------------------PROGRAMA PRINCIPAL------------------------------

var
	lista: Tlista;
	opcion: char;
begin
	Randomize;
	crear(lista);
	repeat
		Presentacion;
		MostrarLista(lista);
		Opciones(opcion);
		case opcion of
			'1': agregar(lista, fin(lista), random(randlim));
			'2': eliminar(lista, fin(lista));
			'3': LocalizarLista(lista);
			'4': ;
			else begin
				writeln('Error: elige una opcion correcta');
				writeln('Presiona cualquier tecla para continuar...');
				readkey;
			end
		end
	until (opcion='4')
end.