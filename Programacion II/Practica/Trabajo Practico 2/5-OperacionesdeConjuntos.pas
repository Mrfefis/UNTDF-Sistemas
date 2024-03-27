program OperarconConjuntos;
uses crt;
{
	Consigna:
	Escribir un esquema y programa que inicialice con valores enteros a cuatro conjuntos : C1, 
	C2 , C3 , C4 y calcule:
	1- C1 U C2
	2- C1 - C2
	3- C3 U C2 U C1 
	4- C2 ^ C1
	5- C1 U C2 ^ C3
}
type
	Tnumeros = set of byte;
	Tconjunto = Tnumeros;

procedure InicializarRandom(var conjunto: Tconjunto);
var
	i, limite: byte;
begin
	limite:= Random(10) + 1;
	conjunto:= [];
	for i:=1 to limite do
		conjunto:= conjunto + [Random(10)];
end;

procedure MostrarConjunto(conjunto: Tconjunto);
var
	i: byte;
begin
	write('{ ');
	for i in conjunto do
		write(i, ' ');
	writeln('}');
	writeln;
end;

var
	Conjunto1, Conjunto2, Conjunto3, Resultado: Tnumeros;
begin
	Randomize;
	InicializarRandom(Conjunto1);
	InicializarRandom(Conjunto2);
	InicializarRandom(Conjunto3);

	writeln('Operaciones con Conjuntos':40);
	writeln;
	writeln('Datos de los operadores: ');
	writeln;
	write('C1 = ');
	MostrarConjunto(Conjunto1);
	write('C2 = ');
	MostrarConjunto(Conjunto2);
	write('C3 = ');
	MostrarConjunto(Conjunto3);

	write('Operacion: C1 U C2 = ');
	MostrarConjunto(Conjunto1 + Conjunto2);

	write('Operacion: C1 - C2 = ');
	MostrarConjunto(Conjunto1 - Conjunto2);

	write('Operacion: C1 U C2 U C3 = ');
	MostrarConjunto(Conjunto1 + Conjunto2 + Conjunto3);
	
	write('Operacion: C1 ^ C2 = ');
	MostrarConjunto(Conjunto1 * Conjunto2);
	
	write('Operacion: C1 U C2 ^ C3 = ');
	MostrarConjunto((Conjunto1 + Conjunto2) * Conjunto3);
end.