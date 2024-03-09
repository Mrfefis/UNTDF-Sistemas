program main;
uses crt, Ulist;
{
	Consigna:
	Escríbase un programa que imprima los elementos de una lista.
}

// ---------------------------------SUBPROGRAMAS---------------------------------

procedure Inicializar(var lista: Tlist);
var
	i: integer;
begin
	initlist(lista);
	for i:= 1 to 10 do
		addlist(lista, fin(lista), Random(80))
end;

procedure ImprimirLista(lista: Tlist);
var
	i: Tindex;
	c, total: integer;
begin
	i:= first(lista);
	c:= 1;
	total:= lenlist(lista);
	write('[');
	while (c<total) do begin
		write(recovlist(i), ', ');
		inc(c);
		i:= next(i)
	end;
	if (total>0) then
		write(recovlist(i));
	writeln(']')
end;

// ------------------------------PROGRAMA PRINCIPAL------------------------------

var
	lista: Tlist;
begin
	Inicializar(lista);
	ImprimirLista(lista);
	readkey
end.