program main;
uses crt, Uhash;
{
	Consigna:
	Implemente las 4 funciones de hash más utilizadas (mostradas en la teoría) y luego
	visualice, por medio de una tabla, los valores que retorna c/una. Utilice como clave 20
	valores aleatorios comprendidos entre el 1.000.000 y 1.999.999.
}
var
	tabla: Tmapa;
	i: integer;
	extra: Tclave;
begin
	Randomize;
	iniciar(tabla, 't');
	for i:= 1 to 20 do
	begin
		extra:= random(1000000)+1000000;
		insertar(tabla, extra, extra);
	end;
	listar(tabla);
	writeln;
	write('Clave a Buscar: ');
	readln(extra);
	extra:= buscar(tabla, extra);
	if extra=0 then
		writeln('No se encuentra en la tabla')
	else
		writeln('Se encuentra en la tabla');
	readkey
end.