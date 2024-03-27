program main;
uses crt;
{
	Consigna:
	Diseñe y codifique en Pascal un programa que dado un vector de N elementos imprima sus
	elementos en orden inverso. No debe generarse otro vector. 
}
const
	n = 10;
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

procedure MostrarInverso(vector: Tvector; n: integer);
var
	i: integer;
begin
	write('[');
	for i:= n downto 2 do
		write(vector[i], ', ');
	writeln(vector[1], ']');
	writeln;
end;


var
	vector: Tvector;
begin
	Randomize;
	InicializarRandom(vector);
	write('Dado el vector: ');
	MostrarVector(vector, n);
	write('El vector en orden inverso es: ');
	MostrarInverso(vector, n)
end.