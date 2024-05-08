program main;
uses crt, pila;
{
	Consigna:
	Escriba un programa que lea una sucesión de números enteros, que finaliza con 0, y los
	imprima en orden inverso.
}

// ---------------------------------SUBPROGRAMAS---------------------------------

procedure Cargar(var sucesion: Tpila; var longitud: integer);
var
	valor: Telemento;
begin
	write('Numero ', longitud+1,':');
	readln(valor);
	while (valor<>0) and not full(sucesion) do begin
		push(sucesion, valor);
		inc(longitud);
		write('Numero ', longitud+1,':');
		readln(valor);
	end;
end;

procedure Imprimir(sucesion: Tpila; longitud: integer);
var
	elemento: Telemento;
begin
	write('[');
	while not empty(sucesion) and (longitud>1) do
	begin
		dec(longitud);
		pop(sucesion, elemento);
		write(elemento, ', ');
	end;
	if not empty(sucesion) and (longitud=1) then begin
		pop(sucesion, elemento);
		write(elemento);
	end;
	writeln(']');
end;

// ------------------------------PROGRAMA PRINCIPAL------------------------------

var
	sucesion: Tpila;
	longitud: integer;
begin
	init(sucesion);
	longitud:= 0;
	writeln('Ingresa una sucesion de numeros enteros(finalizar con 0)');
	Cargar(sucesion, longitud);
	writeln('Suficiente...');
	writeln('pulsa cualquier tecla para imprimir la sucesion en orden inverso');
	readkey;
	clrscr;
	writeln('La sucesion es: ');
	Imprimir(sucesion, longitud);
end.