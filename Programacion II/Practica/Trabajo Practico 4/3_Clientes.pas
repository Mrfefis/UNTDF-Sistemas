program Clientes;
uses crt;
{
	Consigna:
	Generar un archivo con los datos personales de los clientes de un comercio. Estos datos
	son: Nombre, Dirección, Teléfono, Tope de Crédito.
	a) Realizar un subprograma que reciba el archivo generado e imprima su contenido.
	b) Actualizar el archivo anteriormente generado aumentando en un 20 % el tope de
	crédito.
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

	Tarchivo = file of Tcliente;

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
	cliente.codigo:= 100 + FileSize(Archi);
	cliente.nombre:= '0';
	cliente.direccion:= '0';
	cliente.telefono:= '0';
	cliente.topecredito:= MaxCredito;
	cliente.saldo:= 0;
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
	Comercio: Tarchivo;
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