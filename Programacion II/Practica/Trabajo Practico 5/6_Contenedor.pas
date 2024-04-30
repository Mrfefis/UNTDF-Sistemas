program Container;
uses crt, Ucontenedor;
{
	Consigna:
	Escribir un TDA tipo contenedor. El propósito es poder almacenar una cantidad de
	elementos arbitraria Por simplimplicidad considere que pueden almacenarse hasta
	1.000.000 de elementos enteros.
	El TDA-Contenedor deberá permitir las siguientes operaciones:
	- iniciar : deja en un estado inicial al contenedor.
	- agregar: agrega un elemento entero al contenedor.
	- cantidad: retorna la cantidad de elementos del contenedor.
	- obtener: retorna el elemento que se encuentra en una determinada posición.
}

procedure cargar(var contenedor: Tcontenedor);
var
	i: Tindice;
	elemento: integer;
begin
	i:= 0;
	write('Elemento(0 para terminar): ');
	readln(elemento);
	while (i<n) and (elemento<>0) do begin
		clrscr;
		agregar(contenedor, elemento);
		write('Elemento(0 para terminar): ');
		readln(elemento);
	end;
end;

procedure mostrar(var contenedor: Tcontenedor);
var
	i: Tindice;
begin
	for i:=1 to cantidad(contenedor) do
		write(obtener(contenedor, i), ', ');
end;

var
	contenedor: Tcontenedor;
begin
	iniciar(contenedor);
	cargar(contenedor);
	mostrar(contenedor);
	readkey
end.