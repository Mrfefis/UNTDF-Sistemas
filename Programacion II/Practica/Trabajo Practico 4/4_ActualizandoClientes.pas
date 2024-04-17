program Transacciones;
uses crt;
{
	Consigna:
	Realizar un subprograma que actualice el archivo de clientes en función de los
	movimientos.
	El archivo de cliente contiene el código de cliente, nombre y saldo.
	El archivo de movimientos contiene el código de cliente, tipo de operación
	(1: crédito,2: débito) y monto de la operación.
	Actualice el archivo de clientes teniendo en cuenta los movimientos que se han producido.
	Precondiciones:
	▪ los archivos, en todos los casos se encuentran ordenados por el código de cliente.
	▪ los clientes del archivo de movimientos existen en el de clientes.
}
type
	Tcolores = (Rojo, Verde, Amarillo, Azul, Blanco, Gris, Cian);

	Tcliente = record
		codigo: longword;
		nombre: string[50];
		direccion: string;
		telefono: string[15];
		saldo, topecredito: real;
	end;

	Toperacion = record
		codigo: longword;
		tipo: byte;
		monto: real;
	end;

	Tclientes = file of Tcliente;

	Tmovimientos = file of Toperacion;

procedure AbrirClientes(var Archi: Tclientes; ruta: string);
begin
	Assign(Archi, ruta);
	{$I-}
	Reset(Archi);
	{$I+}
	if (IOResult<>0) then
		rewrite(Archi)
end;

procedure AbrirMovimientos(var Archi: Tmovimientos; ruta: string);
begin
	Assign(Archi, ruta);
	{$I-}
	Reset(Archi);
	{$I+}
	if (IOResult<>0) then
		rewrite(Archi)
end;

function BuscarDesordenado(var Archi: Tclientes; elemento: longword): integer;
var
	i: integer;
	encontrado: boolean;
	aux: Tcliente;
begin
	i:= 0;
	Seek(Archi, 0);
	encontrado:= false;
	while not EOF(Archi) and not encontrado do begin
		read(Archi, aux);
		if (aux.codigo=elemento) then
			encontrado:= true
		else inc(i)
	end;
	if encontrado then
		BuscarDesordenado:= i
	else
		BuscarDesordenado:= -1;
end;

procedure CambiarColor(color: Tcolores);
begin
	case color of
		Azul: textcolor(lightblue);
		Verde: textcolor(lightgreen);
		Rojo: textcolor(lightred);
		Blanco: textcolor(white);
		Amarillo: textcolor(yellow);
		Cian: textcolor(lightcyan);
		Gris: textcolor(lightgray);
	end;
end;

procedure Mensaje(mensaje: string; color1, color2: Tcolores);
begin
	CambiarColor(color1);
	write(Mensaje);
	CambiarColor(color2);
end;

procedure PedidoDatos(var movimiento: Toperacion; var valido: boolean);
begin
	valido:= false;
	with movimiento do begin
		textcolor(yellow);
		writeln('':10, 'Cargando Transacciones');
		writeln('Ingresa 0 en cualquier campo para terminar');
		writeln;
		Mensaje('Codigo de Cliente: ', Azul, Blanco);
		readln(codigo);
		if (codigo<>0) then begin
			Mensaje('Tipo de Transaccion: ', Verde, Blanco);
			readln(tipo);
			if tipo<>0 then begin
				Mensaje('Monto: ', Rojo, Blanco);
				readln(monto);
				if monto>0.5 then valido:= true;
			end
		end
	end
end;

procedure CargarMovimiento(var Movimientos: Tmovimientos; var Clientes: Tclientes);
var
	movimiento: Toperacion;
	cliente: Tcliente;
	posicion: integer;
	valido: boolean;
begin
	Seek(Movimientos, FileSize(Movimientos));
	with movimiento do begin
		codigo:= 1;
		tipo:= 1;
		monto:= 1.0;
	end;
	with movimiento do while (codigo<>0) and (tipo<>0) and (monto>0.5) do begin
		clrscr;
		PedidoDatos(movimiento, valido);
		posicion:= BuscarDesordenado(Clientes, codigo);
		if valido and (posicion<>-1) then begin
			Seek(Clientes, posicion);
			read(Clientes, cliente);
			with cliente do case tipo of
				1: begin
					saldo:= saldo + monto;
					if saldo<=topecredito then begin
						Seek(Clientes, posicion);
						write(Clientes, cliente);
						Seek(Movimientos, FileSize(Movimientos));
						write(Movimientos, movimiento);
					end
					else begin
						writeln;
						writeln('Credito Maximo alcanzado');
						writeln('Pulsa cualquier tecla para continuar');
						readkey;
					end;
				end;
				2: begin
					saldo:= saldo - monto;
					if saldo>0 then begin
						Seek(Clientes, posicion);
						write(Clientes, cliente);
						Seek(Movimientos, FileSize(Movimientos));
						write(Movimientos, movimiento);
					end
					else begin
						writeln;
						writeln('No tiene saldo suficiente');
						writeln('Pulsa cualquier tecla para continuar');
						readkey;
					end
				end
			end
		end
		else if (posicion=-1) then begin
			writeln('Error, el cliente no existe');
			writeln('Pulsa cualquier tecla para continuar...');
			readkey
		end
	end
end;

procedure MostrarMovimientos(var Movimientos: Tmovimientos; codigo: longword);
var
	movimiento: Toperacion;
begin
	Seek(Movimientos, 0);
	while not EOF(Movimientos) do begin
		read(Movimientos, movimiento);
		if movimiento.codigo=codigo then begin
			writeln;
			textcolor(lightblue);
			write('Tipo: ');
			textcolor(white);
			if movimiento.tipo=1 then write('Credito ')
			else write('Debito ');
			textcolor(lightgreen);
			write(' - Monto: ');
			textcolor(white);
			writeln(movimiento.monto:0:2);
		end
	end
end;

procedure ListarArchivos(var Movimientos: Tmovimientos; var Clientes: Tclientes);
var
	cliente: Tcliente;
begin
	Seek(Clientes, 0);
	while not EOF(Clientes) do begin
		read(Clientes, cliente);
		with cliente do begin
			Mensaje('Nombre: ', Azul, Blanco);
			write(nombre);
			Mensaje(' - Saldo: ', Verde, Blanco);
			write(saldo:0:2);
			Mensaje(' - Codigo: ', Rojo, Blanco);
			writeln(codigo);
			Mensaje(' - Movimientos: ', Cian, Blanco);
			MostrarMovimientos(Movimientos, codigo);
			writeln;
			textcolor(lightgray);
			writeln('-  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -');
		end
	end
end;

var
	Clientes: Tclientes;
	Movimientos: Tmovimientos;
begin
	Randomize;
	AbrirClientes(Clientes, '3_Clientes.dat');
	AbrirMovimientos(Movimientos, '4_Movimientos.dat');
	CargarMovimiento(Movimientos, Clientes);
	clrscr;
	textcolor(yellow);
	writeln('':10,'Transacciones de Clientes');
	writeln;
	textcolor(white);
	ListarArchivos(Movimientos, Clientes);
	readkey;
	Close(Movimientos);
	Close(Clientes);
end.