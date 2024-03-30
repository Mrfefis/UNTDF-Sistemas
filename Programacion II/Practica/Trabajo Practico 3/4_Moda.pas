program ModaVector;
{
	Consigna:
	La MODA de un arreglo es el elemento que aparece más veces en el arreglo. Si distintos
	elementos son repetidos con la misma frecuencia máxima, no hay moda. Escribir un
	programa en Pascal que acepte un arreglo e imprima su MODA o un mensaje si no la hay.
}
const
	n = 20;
type
	Tvector = array[1..n] of integer;

procedure InicializarRandom(var vector: Tvector);
var
	i: integer;
begin
	for i:= 1 to n do
		vector[i]:= Random(11)
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

function Frecuencia(const vector: Tvector; min, max: integer; elemento: integer): integer;
var
	i: integer;
begin
	Frecuencia:= 0;
	for i:= min to max do if vector[i]=elemento then inc(Frecuencia)
end;

function ModaVector(const vector: Tvector; n: integer): integer;
var
	elemento, moda, nuevamoda: integer;
	i, j: integer;
	haymoda: boolean;
begin
	elemento:= 1;
	moda:= Frecuencia(vector, 1, n, vector[elemento]);
	haymoda:= true;
	for i:= 2 to n do begin
		j:= 1;
		while (j<i) and (vector[j]<>vector[i]) do inc(j);
		if (j=i) then begin
			nuevamoda:= Frecuencia(vector, i, n, vector[i]);
			if nuevamoda>moda then begin
				elemento:= i;
				moda:= nuevamoda;
				haymoda:= true;
			end
			else if (nuevamoda=moda) then
				haymoda:=false;
		end
	end;
	if haymoda then ModaVector:= elemento
	else ModaVector:= -1 
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
	if moda=-1 then
		writeln('No hay moda')
	else
		writeln('La moda es: ', vector[moda]);
end.