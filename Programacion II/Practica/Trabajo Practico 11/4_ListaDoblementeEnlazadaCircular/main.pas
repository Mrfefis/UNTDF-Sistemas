program main;
uses crt, UlistDEC;
{
	Consigna:
	- Dada una doble lista enlazada circular como la de la figura, donde ND es la abreviatura de
	NODO.
	a- Expresar el campo INFO del nodo 1 referenciado a partir del puntero A.
	b- Expresar el campo INFO del nodo 1 referenciado a partir del puntero C.
	c- Expresar el campo SIG del nodo 4 referenciado a partir del puntero B.
	d- Expresar el campo SIG del nodo 4 referenciado a partir del puntero C.
	e- Expresar el nodo 1 referenciado a partir del puntero B.
	f- Expresar el campo ANT del nodo 3 referenciado a partir del puntero B.
	g- Expresar el campo ANT del nodo 2 referenciado a partir del puntero B.
}
var
	lista: Tlista;
	A, B, C: Tpuntero;
	i: integer;
begin
	iniciar(lista);
	for i:=1 to 5 do
		insertar(lista, i);
	A:= lista^.sig;
	B:= A^.sig^.sig;
	C:= lista;
	listar(lista);
	writeln('a- Expresar el campo INFO del nodo 1 referenciado a partir del puntero A.');
	writeln('A^.info = ', A^.info);
	writeln('b- Expresar el campo INFO del nodo 1 referenciado a partir del puntero C.');
	writeln('C^.sig^.info = ', C^.sig^.info);
	writeln('c- Expresar el campo SIG del nodo 4 referenciado a partir del puntero B.');
	writeln('B^.sig^.info = ', B^.sig^.info);
	writeln('d- Expresar el campo SIG del nodo 4 referenciado a partir del puntero C.');
	writeln('C^.ant^.info = ', C^.ant^.info);
	writeln('e- Expresar el nodo 1 referenciado a partir del puntero B.');
	writeln('B^.ant^.ant^.info = ', B^.ant^.ant^.info);
	writeln('f- Expresar el campo ANT del nodo 3 referenciado a partir del puntero B.');
	writeln('B^.ant^.info = ', B^.ant^.info);
	writeln('g- Expresar el campo ANT del nodo 2 referenciado a partir del puntero B.');
	writeln('B^.ant^.ant^.info = ', B^.ant^.ant^.info);
	readkey
end.