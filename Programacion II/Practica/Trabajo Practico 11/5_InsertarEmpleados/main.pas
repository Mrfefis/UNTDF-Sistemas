program main;
uses crt, UlistaOrdenadaDE;
{
	Consigna:
	Suponiendo que las declaraciones para NODO del ejercicio "1" incluyen el campo ANT, de
	tipo PTR y la lista es doblemente enlazada con un nodo cabecera y un nodo final, escribir
	un procedimiento para insertar un nodo empleado en la lista, ordenada por nro. de
	empleado.
}

procedure Cargar(var lista: Tlista; empleado: Templeado);
begin
	write('Nombre: ');
	readln(empleado.nombre);
	empleado.nro:= random(1000);
	writeln(empleado.nro);
	insertar(lista, empleado);
end;

var
	lista: Tlista;
	empleado: Templeado;
	i: integer;
begin
	Randomize;
	iniciar(lista);
	for i:=1 to 5 do
		Cargar(lista, empleado);
	listar(lista);
	destruir(lista);
	readkey;
end.