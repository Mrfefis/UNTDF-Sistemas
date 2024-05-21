unit Uinterfaz;

interface

	uses Ucola, Ucliente, crt;

	type
		Tclientes = Tcola;

	procedure Pausa;

	procedure Opciones(var opcion: char);

	procedure Cargar(var clientes: Tclientes);

	procedure Imprimir(var clientes: Tclientes);

implementation

	procedure Cargar(var clientes: Tclientes);
	var
		cliente: Tcliente;
		preferencia: char;
	begin
		clrscr;
		writeln('Carga de clientes');
		write('Numero de cliente: ');
		readln(cliente.nrocliente);
		write('Preferencia(A-B): ');
		readln(preferencia);
		if (preferencia='A') or (preferencia='a') then
			cliente.preferencial:= true
		else
			cliente.preferencial:= false;
		Ucola.insertar(clientes, cliente);
	end;

	procedure Copiar(var origen, destino: Tcola);
	var
		elemento: Tinfo;
		aux: Tcola;
	begin
		Ucola.iniciar(aux);
		while not Ucola.vacia(origen) do
		begin
			Ucola.eliminar(origen, elemento);
			Ucola.insertar(destino, elemento);
			Ucola.insertar(aux, elemento);
		end;
		origen:= aux;
	end;

	procedure Imprimir(var clientes: Tclientes);
	var
		elemento: Tinfo;
		aux: Tcola;
	begin
		Ucola.iniciar(aux);
		Copiar(clientes, aux);
		while not Ucola.vacia(aux) do
		begin
			Ucola.eliminar(aux, elemento);
			write('Nro: ', elemento.nrocliente:4, '':4, 'Preferencia: ');
			if elemento.preferencial then
				writeln('Alta')
			else
				writeln('Baja')
		end;
	end;

	procedure Pausa;
	begin
		writeln('Pulsa cualquier tecla para continuar...');
		readkey
	end;

	procedure Opciones(var opcion: char);
	begin
		writeln('Banco Nacional de Carlitos');
		writeln;
		writeln('1. Cargar clientes');
		writeln('2. Mostrar clientes');
		writeln('3. Ordenar por preferencia');
		writeln('0. Salir');
		opcion:= readkey;
	end;


end.