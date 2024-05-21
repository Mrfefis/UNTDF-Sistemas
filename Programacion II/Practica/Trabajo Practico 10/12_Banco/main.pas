program main;
uses crt, Ucliente, Ucola, Uinterfaz;
{
	Consigna:
	Suponga tener armada una Cola dinámica, con datos de personas que están en un
	banco. (Los datos son nro. de cliente y si es cliente preferencial o no). Le han pedido
	que, a partir de cola anterior, genere una nueva donde las clientes preferenciales
	pasen delante de la cola. (Siempre deberá tener en cuenta el orden en que cada tipo
	de cliente llegó a la Cola).
}
type
	Tclientes = Tcola;

procedure Ordenar(var clientes, clientesPreferenciales: Tclientes);
var
	aux: Tclientes;
	cliente: Tcliente;
begin
	iniciar(aux);
	while not vacia(clientes) do
	begin
		eliminar(clientes, cliente);
		if cliente.preferencial then
			insertar(clientesPreferenciales, cliente)
		else
			insertar(aux, cliente)
	end;
	clientes:= aux;
end;

var
	clientes, clientesPreferenciales: Tclientes;
	opcion: char;
begin
	iniciar(clientes);
	iniciar(clientesPreferenciales);
	repeat
		clrscr;
		Opciones(opcion);
		case opcion of
			'1': Cargar(clientes);
			'2': begin
				clrscr;
				writeln('Clientes del Banco: ');
				Imprimir(clientes);
				writeln('Clientes Preferenciales del Banco: ');
				Imprimir(clientesPreferenciales);
				Pausa;
			end;
			'3': Ordenar(clientes, clientesPreferenciales);
		end;
	until(opcion='0');
	destruir(clientes);
	destruir(clientesPreferenciales);
end.