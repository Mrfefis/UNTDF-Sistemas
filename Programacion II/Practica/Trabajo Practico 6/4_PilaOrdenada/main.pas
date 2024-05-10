program Main;
uses crt, Upila, interfaz;
{
	Consigna:
	Definir un procedimiento que reciba una pila de enteros ordenada de menor a mayor y un
	valor N y que devuelva la pila a la cual se agrega el valor N, de forma tal que la misma
	quede ordenada. Discuta la estructura auxiliar a utilizar
}
type
	Tpila = Tstack;
// ---------------------------------SUBPROGRAMAS---------------------------------

procedure Cargar(var pila: Tpila);
var
	numero: Telement;
begin
	write('Ingresa un Numero Entero: ');
	readln(numero);
	push_ordenado(pila, numero)
end;

procedure Listar(pila: Tpila);
begin
	while not empty(pila) do
	begin
		write(top(pila), ' ');
		pop(pila)
	end;
	readkey
end;

// ------------------------------PROGRAMA PRINCIPAL------------------------------

var
	pila: Tpila;
	opcion: char;
	ultimo: Telement;
begin
	init(pila);
	repeat
		clrscr;
		Mensaje('Pila ordenada', Rojo);
		writeln;
		Opciones(opcion);
		clrscr;
		case opcion of
			'1': Cargar(pila);
			'2': Listar(pila);
		end
	until (opcion='0');
end.