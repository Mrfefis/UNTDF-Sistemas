program Archivos;
uses crt;
{
	Consigna:
	Dada la definición del ejercicio anterior se pide.
	a) Permitir la carga de números, puede utilizar un valor específico para terminar.
	b) Listar los elementos del archivo.
	c) Buscar un elemento en el archivo e indicar que posición que ocupa dentro del
	mismo o -1 en caso de no estar.
	1. suponiendo un archivo desordenado.
	2. suponiendo el archivo ordenado en forma creciente. En ambos casos se
	considera que no hay registros repetidos dentro del archivo.
	d) Localizar el elemento de mayor valor dentro del archivo (los elementos no están
	ordenados) e imprimirlo junto con la posición que ocupa.
	e) Generar otro archivo, ArchiPares, con los elementos pares de Archi.
}
type
	Tarchivo = file of integer;
	Tposicion = 0..MaxInt;

procedure AbrirArchivo(var Archi: Tarchivo; ruta: string);
begin
	Assign(Archi, ruta);
	{$I-}
	Reset(Archi);
	{$I+}
	if (IOResult<>0) then
		rewrite(Archi)
end;

procedure CargarArchivo(var Archi: Tarchivo);
var
	i: integer;
begin
	Seek(Archi, FileSize(Archi));
	write('Dato: ');
	readln(i);
	while (i<>0) do begin
		write(Archi, i);
		write('Dato: ');
		readln(i);
	end
end;

procedure ListarArchivo(var Archi: Tarchivo);
var
	i: integer;
begin
	Seek(Archi, 0);
	while not EOF(Archi) do begin
		read(Archi, i);
		write(i, ', ');
	end
end;

function tomar(var Archi: Tarchivo; indice: Tposicion): integer;
begin
	Seek(Archi, indice);
	read(Archi, tomar);
end;

procedure Intercambiar(var Archi: Tarchivo; indice1, indice2: Tposicion);
var
	elemento1, elemento2: integer;
begin
	Seek(Archi, indice1);
	read(Archi, elemento1);
	Seek(Archi, indice2);
	read(Archi, elemento2);
	Seek(Archi, indice1);
	write(Archi, elemento2);
	Seek(Archi, indice2);
	write(Archi, elemento1);
end;

procedure Ordenar(var Archi: Tarchivo);
var
	elemento1, elemento2: integer;
	i, j: integer;
begin
	for i:= 1 to FileSize(Archi)-1 do begin
		for j:= 0 to FileSize(Archi)-i-1 do begin
			elemento1:= tomar(Archi, j);
			elemento2:= tomar(Archi, j+1);
			if elemento1>elemento2 then
				Intercambiar(Archi, j, j+1);
		end;
	end
end;

function BuscarDesordenado(var Archi: Tarchivo; elemento: integer): integer;
var
	i: Tposicion;
	encontrado: boolean;
	aux: integer;
begin
	i:= 0;
	Seek(Archi, 0);
	encontrado:= false;
	while not EOF(Archi) and not encontrado do begin
		read(Archi, aux);
		if (aux=elemento) then
			encontrado:= true
		else inc(i)
	end;
	if encontrado then
		BuscarDesordenado:= i+1
	else
		BuscarDesordenado:= -1;
end;

function BuscarOrdenado(var Archi: Tarchivo; elemento: integer): integer;
var
	minimo, maximo, medio: Tposicion;
	encontrado: boolean;
	aux: integer;
begin
	minimo:= 0;
	maximo:= FileSize(Archi)-1;
	encontrado:= false;
	while (minimo<=maximo) and not encontrado do begin
		medio:= (minimo + maximo) div 2;
		aux:= tomar(Archi, medio);
		if (aux=elemento) then
			encontrado:= true
		else if (elemento>aux) then
			minimo:= medio+1
		else
			maximo:= medio-1;
	end;
	if encontrado then
		BuscarOrdenado:= medio+1
	else
		BuscarOrdenado:= -1;
end;

procedure AgregarPares(var Archi, ArchiPares: Tarchivo);
var
	aux: integer;
begin
	Seek(Archi, 0);
	while not EOF(Archi) do begin
		read(Archi, aux);
		if (aux mod 2)=0 then
			write(ArchiPares, aux);
	end
end;

var
	Archi, ArchiPares: Tarchivo;
	posicion: integer;
	elemento: integer;
begin
	AbrirArchivo(Archi, '2_Enteros.dat');
	writeln('Ingrese valores enteros (0 para terminar)');
	CargarArchivo(Archi);
	clrscr;
	writeln('Los elementos del Archivo son:');
	ListarArchivo(Archi);
	writeln;
	writeln('Ahora vamos a ver la posicion de uno de ellos');
	write('Ingresa el dato a buscar: ');
	readln(elemento);
	posicion:= BuscarDesordenado(Archi, elemento);
	writeln('El dato esta en la posicion: ', posicion);
	writeln('Para ORDENARLOS pulsa una tecla...');
	readkey;
	clrscr;
	Ordenar(Archi);
	ListarArchivo(Archi);
	writeln;
	writeln('Ahora vamos a hacer lo mismo pero con el archivo ordenado');
	write('Ingresa el dato a buscar: ');
	readln(elemento);
	posicion:= BuscarOrdenado(Archi, elemento);
	writeln('El dato esta en la posicion: ', posicion);
	writeln('Ademas ahora hay otro archivo con los elementos pares del original:');
	Assign(ArchiPares, '2_EnterosPares.dat');
	Rewrite(ArchiPares);
	AgregarPares(Archi, ArchiPares);
	ListarArchivo(ArchiPares);
	writeln;
	writeln('Magia, no hay mas. Fuera');
	readkey;
	Close(ArchiPares);
	Close(Archi);
end.