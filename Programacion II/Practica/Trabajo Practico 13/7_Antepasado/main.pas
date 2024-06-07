program main;
uses crt, Uarbol, Uarbolpila;
{
	Consigna:
	Escribir un procedimiento NO recursivo, ANTEPASADO, que imprima los antepasados
	de un nodo dado cuyo campo INFO tenga el valor NUM. (NUM sólo se encuentra UNA vez
	en el árbol). No imprimir NUM. RAÍZ no está vacío, y suponer
	a) el nodo está;
	b) el nodo puede no estar.
	Use la siguiente cabecera de procedimiento:
	PROCEDURE ANTEPASADO ( RAÍZ : PTR ; NUM : INTEGER ) ;
}

procedure Inicializar(var arbol: Tarbol);
begin
	Uarbol.insertar(arbol, 43);
	Uarbol.insertar(arbol, 9);
	Uarbol.insertar(arbol, 49);
	Uarbol.insertar(arbol, 2);
	Uarbol.insertar(arbol, 20);
	Uarbol.insertar(arbol, 47);
	Uarbol.insertar(arbol, 57);
	Uarbol.insertar(arbol, 1);
	Uarbol.insertar(arbol, 4);
	Uarbol.insertar(arbol, 32);
	Uarbol.insertar(arbol, 33);
	Uarbol.insertar(arbol, 58);
end;

procedure antepasado(arbol: Tarbol; numero: integer);
var
	antepasados: Uarbolpila.Tpila;
begin
	init(antepasados);
	while (arbol<>nil) and (recuperar(arbol)<>numero) do
	begin
		push(antepasados, arbol);
		if recuperar(arbol)>numero then
			arbol:= izquierda(arbol)
		else
			arbol:= derecha(arbol)
	end;
	if (arbol=nil) then
	begin
		writeln('El nodo no existe');
		while not empty(antepasados) do
			pop(antepasados, arbol)
	end
	else
	begin
		write('[ ');
		while not empty(antepasados) do
		begin
			pop(antepasados, arbol);
			write(recuperar(arbol), ' ')
		end;
		writeln(']')
	end
end;

var
	arbol: Tarbol;
begin
	iniciar(arbol);
	Inicializar(arbol);
	antepasado(arbol, 58);
	readkey
end.