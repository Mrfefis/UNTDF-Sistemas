program main;
uses crt, UlistaDE;
{
	Consigna:
	3- Escribir un procedimiento para suprimir un nodo
	de una lista doblemente enlazada, lineal, cuyo apuntador
	apunta a cualquier nodo de la lista, no necesariamente a un extremo.
}

// ---------------------------------SUBPROGRAMAS---------------------------------

// ------------------------------PROGRAMA PRINCIPAL------------------------------

var
	lista: Tlista;
	i: integer;
begin
	iniciar(lista);
	for i:=1 to 20 do
		insertar(lista, i*i);
	listar(lista);
	writeln;
	listarReves(lista);
end.