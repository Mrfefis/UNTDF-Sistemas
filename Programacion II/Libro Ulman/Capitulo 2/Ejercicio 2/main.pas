program main;
uses crt, UlistaApuntadores;
{
	Consigna:
	Escríbanse programas para insertar, suprimir y localizar un elemento en una
	lista clasificada, usando realizaciones de
	a) Arreglos
	b) Apuntadores
	¿Cuál es el tiempo de ejecución de cada uno de estos programas?
}
const
	randlim = 15;

// ---------------------------------SUBPROGRAMAS---------------------------------

// a) Implementacion con Arreglos.
{
procedure MostrarLista(var lista: Tlista);
var
	i: Tindice;
begin
	write('Lista: ');
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

procedure AgregarLista(var lista: Tlista);
var
	aux: string;
	elemento: Telemento;
	funciono: integer;
begin
	writeln;
	write('Elemento: ');
	readln(aux);
	Val(aux, elemento, funciono);
	if (funciono<>0) then
		elemento:= random(randlim);
	agregar(lista, fin(lista), elemento);
end;

procedure EliminarLista(var lista: Tlista);
var
	aux: string;
	posicion: Tindice;
	funciono: integer;
begin
	writeln;
	write('Posicion: ');
	readln(aux);
	Val(aux, posicion, funciono);
	if (funciono<>0) then
		posicion:= fin(lista);
	eliminar(lista, posicion);
end;

procedure LocalizarLista(var lista: Tlista);
var
	aux: Telemento;
	posicion: Tindice;
begin
	write('Elemento: '); readln(aux);
	posicion:= localizar(lista, aux);
	if posicion=-1 then
		writeln(aux, ' no esta en la lista')
	else writeln(aux, ' esta en la posicion ', posicion);
	writeln('Presiona cualquier tecla para continuar...');
	readkey
end;
}
// b) Implementacion con Punteros.

procedure MostrarLista(var lista: Tlista);
var
	i: Tindice;
begin
	write('Lista: ');
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

procedure AgregarLista(var lista: Tlista);
var
	aux: string;
	elemento: Telemento;
	funciono: integer;
begin
	writeln;
	write('Elemento: ');
	readln(aux);
	Val(aux, elemento, funciono);
	if (funciono<>0) then
		elemento:= random(randlim);
	agregar(lista, fin(lista), elemento);
end;

function posiciondenumero(lista: Tlista; indice: integer): Tindice;
var
	i: Tindice;
	contador: integer;
begin
	i:= primero(lista);
	contador:= 1;
	if indice>0 then begin
		while (contador<indice) and (i<>fin(lista)) do begin
			inc(contador);
			i:= siguiente(i)
		end;
		posiciondenumero:= i;
	end
	else posiciondenumero:= fin(lista)
end;

procedure EliminarLista(var lista: Tlista);
var
	aux: string;
	posicion: Tindice;
	indice, funciono: integer;
begin
	writeln;
	write('Posicion: ');
	readln(aux);
	Val(aux, indice, funciono);
	if (funciono<>0) then
		posicion:= fin(lista)
	else posicion:= posiciondenumero(lista, indice);
	eliminar(lista, posicion);
end;

function numerodeposicion(lista: Tlista; posicion: Tindice): integer;
var
	i: Tindice;
begin
	i:= primero(lista);
	numerodeposicion:= 1;
	while (i<>posicion) do begin
		i:= siguiente(i);
		inc(numerodeposicion);
	end;
end;

procedure LocalizarLista(var lista: Tlista);
var
	aux: Telemento;
	posicion: Tindice;
begin
	write('Elemento: '); readln(aux);
	posicion:= localizar(lista, aux);
	if posicion=fin(lista) then
		writeln(aux, ' no esta en la lista')
	else writeln(aux, ' esta en la posicion ', numerodeposicion(lista, posicion));
	writeln('Presiona cualquier tecla para continuar...');
	readkey
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
			'1': AgregarLista(lista);
			'2': EliminarLista(lista);
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