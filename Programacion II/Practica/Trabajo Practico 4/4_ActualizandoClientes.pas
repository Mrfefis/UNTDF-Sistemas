program Clientes;
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
const
	MaxCredito = 2000;
type
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

procedure AbrirArchivo(var Archi: Tarchivo; ruta: string);
begin
	Assign(Archi, ruta);
	{$I-}
	Reset(Archi);
	{$I+}
	if (IOResult<>0) then
		rewrite(Archi)
end;

procedure ListarArchivo(var Archi: Tarchivo);
var
	cliente: Tcliente;
begin
	Seek(Archi, 0);
	while not EOF(Archi) do begin
		read(Archi, cliente);
		with cliente do begin
			textcolor(lightblue);
			write('Nombre: ');
			textcolor(white);
			write(nombre);
			textcolor(lightgreen);
			write(' - Direccion: ');
			textcolor(white);
			write(direccion);
			textcolor(lightred);
			write(' - Telefono: ');
			textcolor(white);
			writeln(telefono);
			textcolor(yellow);
			write('Credito maximo = ');
			textcolor(white);
			writeln(topecredito:0:2);
			textcolor(lightgray);
			writeln('-  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -');
			textcolor(white);
		end
	end
end;

procedure CargarArchivo(var Archi: Tarchivo);
var
	cliente: Tcliente;
begin
	cliente.nombre:= '0';
	cliente.direccion:= '0';
	cliente.telefono:= '0';
	cliente.topecredito:= MaxCredito;
	Seek(Archi, FileSize(Archi));
	with cliente do while ((nombre<>'') and (direccion<>'') and (telefono<>'')) do begin
		clrscr;
		textcolor(yellow);
		writeln('':10,'Realizando la Carga de Clientes');
		writeln('':5,'Deja cualquier campo vacio para cancelar');
		textcolor(lightblue);
		write('Nombre del Cliente: ');
		textcolor(white);
		readln(nombre);
		if nombre<>'' then begin
			textcolor(lightgreen);
			write('Direccion: ');
			textcolor(white);
			readln(direccion);
			if direccion<>'' then begin
				textcolor(lightred);
				write('Telefono: ');
				textcolor(white);
				readln(telefono);
				if telefono<>'' then
					write(Archi, cliente)
			end
		end
	end
end;

function tomar(var Archi: Tarchivo; indice: word): Tcliente;
begin
	Seek(Archi, indice);
	read(Archi, tomar);
	Seek(Archi, indice);
end;

procedure SubirCredito(var Archi: Tarchivo);
var
	cliente: Tcliente;
begin
	Seek(Archi, 0);
	while not EOF(Archi) do begin
		read(Archi, cliente);
		cliente.topecredito:= cliente.topecredito*(1.2);
		Seek(Archi, FilePos(Archi)-1);
		write(Archi, cliente);
	end
end;

var
	Comercio: Tclientes;
	aumentar: char;
begin
	Randomize;
	AbrirArchivo(Comercio, '3_Clientes.dat');
	CargarArchivo(Comercio);
	clrscr;
	textcolor(lightred);
	writeln('Los clientes guardados en el archivo son:');
	writeln;
	ListarArchivo(Comercio);
	writeln;
	writeln('Desea aumentar el tope de credito? (S/N): ');
	readln(aumentar);
	if (aumentar='S') or (aumentar='s') then begin
		SubirCredito(Comercio);
		clrscr;
		writeln('Los clientes guardados en el archivo ahora son:');
		writeln;
		ListarArchivo(Comercio);
		writeln;
	end;
	writeln('Ahora fuera de aqui');
	readkey;
	Close(Comercio);
end.