program Temp;
uses crt, Ucontenedor;
{
	Consigna:
	Realizar un programa que permita al usuario guardar las temperaturas que se produjeron
	durante un cierto periodo. El usuario puede solicitar un informe que visualice cúal fue la
	mayor, la menor y el promedio de las temperaturas registradas.
}
const
	periodo = 6;

function Mayor(const temperaturas: Tcontenedor): longint;
var
	i: Tindice;
begin
	Mayor:= obtener(temperaturas, 1);
	for i:=2 to cantidad(temperaturas) do
		if Mayor<obtener(temperaturas, i) then
			Mayor:= obtener(temperaturas, i)
end;

function Menor(const temperaturas: Tcontenedor): longint;
var
	i: Tindice;
begin
	Menor:= obtener(temperaturas, 1);
	for i:=2 to cantidad(temperaturas) do
		if Menor>obtener(temperaturas, i) then
			Menor:= obtener(temperaturas, i)
end;

function Promedio(const temperaturas: Tcontenedor): longint;
var
	i: Tindice;
begin
	Promedio:= 0;
	for i:= 1 to cantidad(temperaturas) do
		Promedio:= Promedio + obtener(temperaturas, i);
	Promedio:= Promedio div cantidad(temperaturas);
end;

var
	temperaturas: Tcontenedor;
	elemento: Telemento;
	i: Tindice;
begin
	iniciar(temperaturas);
	for i:= 1 to periodo do begin
		write('Temperatura (', i, '): ');
		readln(elemento);
		agregar(temperaturas, elemento);
	end;

	for i:= 1 to cantidad(temperaturas) do
		write(obtener(temperaturas, i), ', ');

	writeln;
	writeln('Temperatura Mayor: ', Mayor(temperaturas));
	writeln('Temperatura Menor: ', Menor(temperaturas));
	writeln('Temperatura Promedio: ', Promedio(temperaturas));
	readkey
end.