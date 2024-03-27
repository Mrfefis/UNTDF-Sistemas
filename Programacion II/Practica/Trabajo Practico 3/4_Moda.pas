program ModaVector;
{
	Consigna:
	La MODA de un arreglo es el elemento que aparece más veces en el arreglo. Si distintos
	elementos son repetidos con la misma frecuencia máxima, no hay moda. Escribir un
	programa en Pascal que acepte un arreglo e imprima su MODA o un mensaje si no la hay.
}
const
	n = 5;
type
	Tvector = array[1..n] of integer;

procedure InicializarRandom(var vector: Tvector);
var
	i: integer;
begin
	for i:= 1 to n do
		vector[i]:= Random(20)
end;

procedure MostrarVector(const vector: Tvector; n: integer);
var
	i: integer;
begin
	write('[');
	for i:= 1 to n-1 do
		write(vector[i], ', ');
	writeln(vector[n], ']');
	writeln;
end;

function ModaVector(const vector: Tvector; n: integer): integer;
var
	moda, total, totalmoda, i, j: integer;
	paso: boolean;
begin
	moda:= vector[1];
	totalmoda:= ;
	for i:=2 to n do begin
		for j:=1 to n do begin
			total:=
		end;
	end
end;

var
	vector: Tvector;
	moda: integer;
begin
	Randomize;
	InicializarRandom(vector);

	writeln('Calculo de la moda':30); writeln;
	write('Dado el vector: ');
	MostrarVector(vector, n);

	moda:= ModaVector(vector, n);
	writeln('La moda es: ', moda);
end.