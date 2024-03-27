program Conjuntos;
{
	Consigna:
	Cuál es el error en la siguiente definición
	 TYPE
	 DECIMALES = SET OF REAL;
	 NUMEROS = SET OF INTEGER;
}
type
	// no se puede hacer un conjunto con elementos no ordinales.
	// Decimales = set of real;
	// no se puede hacer un conjunto que acepte valores mayores a 256.
	// numeros = set of integer;

	Tnumeros = set of byte;

var
	bytes: Tnumeros;
	i: integer;
begin
	bytes:= [1,2,3,4,5,6];
	bytes:= [1..2];
	write('Conjunto de numeros: ');
	// Muestra los elementos del conjunto entre {}
	write('{ ');
	for i in bytes do
		write(i, ' ');
	writeln('}');
	writeln;
end.