program MedianaVector;
{
	Consigna:
	La mediana de un arreglo de números es el elemento M tal que la mitad de los números en
	el arreglo son menores o iguales a M, y la otra mitad son mayores o iguales a M. Si el arreglo
	tiene un número par de elementos, la mediana es el promedio entre los números M1 y M2
	tales que la mitad de los restantes son mayores o iguales a M1 y la mitad menores o iguales
	a M2. Escribir un programa en Pascal que acepte un arreglo de números y retorne la
	MEDIANA.
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

function MedianaVector(const vector: Tvector; n: integer): integer;
var
	cantidad: integer;
begin
	cantidad:= n mod 2;
	if cantidad=1 then
		MedianaVector:= vector[n div 2 + 1]
	else
		MedianaVector:= (vector[n div 2] + vector[n div 2 + 1]) div 2
end;

var
	vector: Tvector;
	mediana: integer;
begin
	Randomize;
	InicializarRandom(vector);

	writeln('Calculo de la mediana':30); writeln;
	write('Dado el vector: ');
	MostrarVector(vector, n);

	mediana:= MedianaVector(vector, n);
	writeln('La mediana es: ', mediana);
end.