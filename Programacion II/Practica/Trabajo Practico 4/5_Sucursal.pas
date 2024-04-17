program Sucursal;
uses crt;
{
	Consigna:
	5- Tres sucursales de una empresa generan, cada una, un archivo con la siguiente
	estructura: producto vendido, cantidad vendida. Dicho archivo es enviado a la casa
	central donde son procesados y se genera un archivo resumen donde por cada producto
	figura la cantidad vendida. Realizar dicho proceso sabiendo que el archivo de cada
	sucursal está ordenado por producto vendido.
}
type
	Tarticulo = record
		producto: string;
		cantidad: word;
	end;

	Tarchivo = file of Tarticulo;

	Tarchivos = file of string;

	Tcolores = (Rojo, Verde, Amarillo, Azul, Blanco, Gris, Cian, Morado);

// ------------------------------------------ Decoracion ------------------------------------------

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
		Morado: textcolor(magenta)
	end;
end;

procedure Mensaje(mensaje: string; color1, color2: Tcolores);
begin
	CambiarColor(color1);
	write(Mensaje);
	CambiarColor(color2);
end;

procedure Separador;
var
	i: integer;
begin
	for i:=1 to 23 do
		write('- ');
	writeln;
end;

// ------------------------------------------ Archivo ------------------------------------------

procedure AbrirArchivo(var Archi: Tarchivo; ruta: string);
begin
	Assign(Archi, ruta);
	{$I-}
	Reset(Archi);
	{$I+}
	if (IOResult<>0) then
		rewrite(Archi)
end;

procedure AbrirArchivoNombres(var Archi: Tarchivos; ruta: string);
begin
	Assign(Archi, ruta);
	{$I-}
	Reset(Archi);
	{$I+}
	if (IOResult<>0) then
		rewrite(Archi)
end;


function Buscar(var Archi: Tarchivos; elemento: string): integer;
var
	i: word;
	encontrado: boolean;
	aux: string;
begin
	i:= 0;
	Seek(Archi, 0);
	encontrado:= false;
	while not EOF(Archi) and not encontrado do begin
		read(Archi, aux);
		if (aux=elemento) then
			encontrado:= true
		else inc(i)
	end;
	if encontrado then
		Buscar:= i
	else
		Buscar:= -1;
end;

function BuscarProductos(var Archi: Tarchivo; elemento: Tarticulo): integer;
var
	i: word;
	encontrado: boolean;
	aux: Tarticulo;
begin
	i:= 0;
	Seek(Archi, 0);
	encontrado:= false;
	while not EOF(Archi) and not encontrado do begin
		read(Archi, aux);
		if (aux.producto=elemento.producto) then
			encontrado:= true
		else inc(i)
	end;
	if encontrado then
		BuscarProductos:= i
	else
		BuscarProductos:= -1;
end;

// ------------------------------------------ Interfaz de Producto ------------------------------------------

procedure Cargar(var archivo: Tarchivo);
var
	articulo, acumulador: Tarticulo;
	posicion: integer;
	opcion: char;
begin
	Mensaje('Cargando Datos de la Empresa', Amarillo, Blanco);
	writeln;
	Mensaje('Producto: ', Azul, Blanco);
	readln(articulo.producto);
	posicion:= BuscarProductos(archivo, articulo);
	if posicion=-1 then begin
		Mensaje('Cantidad: ', Rojo, Blanco);
		readln(articulo.cantidad);
		Seek(archivo, FileSize(archivo));
		write(archivo, articulo);
	end
	else begin
		Mensaje('El elemento ya se encuentra en el archivo', Rojo, Blanco);
		writeln;
		Mensaje('Reemplazar (R) Acumular (A) Cancelar(Cualquier otra tecla)', Rojo, Blanco);
		writeln;
		Mensaje('Opcion: ', Verde, Blanco);
		readln(opcion);
		case opcion of
			'R', 'r': begin
				Mensaje('Cantidad: ', Rojo, Blanco);
				readln(articulo.cantidad);
				Seek(archivo, posicion);
				write(archivo, articulo);
			end;
			'A', 'a': begin
				Mensaje('Cantidad: ', Rojo, Blanco);
				readln(articulo.cantidad);
				Seek(archivo, posicion);
				read(archivo, acumulador);
				acumulador.cantidad:= acumulador.cantidad + articulo.cantidad;
				Seek(archivo, posicion);
				write(archivo, acumulador);
			end;
		end
	end
end;

procedure ListarArchivo(var Archivo: Tarchivo);
var
	articulo: Tarticulo;
begin
	Seek(Archivo, 0);
	while not EOF(Archivo) do begin
		read(Archivo, articulo);
		with articulo do begin
			Mensaje('Producto: ', Azul, Blanco);
			write(producto);
			Mensaje(' - Total: ', Verde, Blanco);
			write(cantidad);
			writeln;
			textcolor(lightgray);
			Separador;
		end
	end
end;

procedure ListarNombres(var Archivo: Tarchivos);
var
	nombre: string;
	i: integer;
begin
	Seek(Archivo, 0);
	i:= 1;
	while not EOF(Archivo) do begin
		read(Archivo, nombre);
		write(i);
		Mensaje(' Empresa: ', Azul, Blanco);
		writeln(nombre);
		textcolor(lightgray);
		Separador;
		inc(i)
	end
end;

procedure ListarArchivos(var Archivos: Tarchivos);
var
	aux: Tarchivo;
	nombre: string;
begin
	Seek(Archivos, 0);
	read(Archivos, nombre);
	AbrirArchivo(aux, '5_' + nombre + '.dat');
	ListarArchivo(aux);
	readkey;
	Close(aux)
end;

procedure Agregar(var archivo: Tarchivo; var articulo: Tarticulo);
var
	posicion: integer;
	aux: Tarticulo;
begin
	posicion:= BuscarProductos(archivo, articulo);
	if posicion=-1 then begin
		Seek(archivo, FileSize(archivo));
		write(archivo, articulo);
	end
	else begin
		Seek(archivo, posicion);
		read(archivo, aux);
		aux.cantidad:= aux.cantidad + articulo.cantidad;
		Seek(archivo, posicion);
		write(archivo, aux)
	end
end;

procedure JuntarArchivos(var archivo: Tarchivo; var archivos: Tarchivos);
var
	aux: Tarchivo;
	nombre: string;
	articulo: Tarticulo;
begin
	Seek(archivos, 0);
	read(archivos, nombre);
	AbrirArchivo(aux, '5_' + nombre + '.dat');
	while not EOF(archivos) do begin
		read(archivos, nombre);
		AbrirArchivo(archivo, '5_' + nombre + '.dat');
		while not EOF(archivo) do begin
			read(archivo, articulo);
			Agregar(aux, articulo);
		end;
		Close(archivo);
	end;
	Close(aux)
end;

// ------------------------------------------ Menu Principal ------------------------------------------

procedure Opciones(var opcion: char; login: boolean);
begin
	if not login then begin
		Mensaje('1. Ingresar', Amarillo, Blanco);
		writeln;
		Mensaje('2. Crear', Rojo, Blanco);
		writeln;
		Mensaje('3. Ver Empresas', Verde, Blanco);
		writeln;
		Mensaje('4. Juntar todos los productos', Morado, Blanco);
		writeln;
		Mensaje('5. Listar todos los productos', Cian, Blanco);
	end
	else begin
		Mensaje('1. Cerrar Sesion', Amarillo, Blanco);
		writeln;
		Mensaje('2. Cargar', Rojo, Blanco);
		writeln;
		Mensaje('3. Listar', Verde, Blanco);
	end;
	writeln;
	Mensaje('0. Terminar', Azul, Blanco);
	writeln;
	write('Opcion: ');
	readln(opcion);
end;

procedure Login(var archivo: Tarchivo; var archivos: Tarchivos; var login: boolean);
var
	nombre: string;
	posicion: integer;
begin
	if login then begin
		Close(archivo);
		login:= false
	end
	else begin
		write('Nombre de la Empresa: ');
		readln(nombre);
		if nombre<>'Central' then begin
			posicion:= Buscar(archivos, nombre);
			if posicion<>-1 then begin
				AbrirArchivo(archivo, '5_' + nombre + '.dat');
				login:= true;
			end
			else begin
				writeln('El archivo no existe');
				writeln('Pulsa cualquier tecla para continuar...');
				readkey
			end
		end
		else begin
			writeln('Ese nombre esta reservado');
			writeln('Pulsa cualquier tecla para continuar...');
			readkey
		end
	end;
end;

procedure SignUp(var archivos: Tarchivos);
var
	nombre: string;
	posicion: integer;
begin
	Mensaje('Creando Nueva Empresa', Amarillo, Blanco);
	writeln;
	writeln;
	Mensaje('Nombre: ', Azul, Blanco);
	readln(nombre);
	posicion:= Buscar(archivos, nombre);
	if posicion=-1 then begin
		Seek(archivos, FileSize(archivos));
		write(archivos, nombre);
	end
	else begin
		writeln('Ya existe el archivo');
		writeln('Pulsa cualquier tecla para continuar...');
		readkey
	end
end;

procedure Inicializar(var archivos: Tarchivos);
begin
	Seek(archivos, 0);
	if EOF(archivos) then
		write(archivos, 'Central')
end;

var
	archivo: Tarchivo;
	archivos: Tarchivos;
	estado: boolean;
	opcion: char;
begin
	estado:= false;
	AbrirArchivoNombres(archivos, '5_Empresas.dat');
	Inicializar(archivos);
	repeat
		clrscr;
		Opciones(opcion, estado);
		clrscr;
		case opcion of
			'1': Login(archivo, archivos, estado);
			'2': begin
				if estado then Cargar(archivo)
				else SignUp(archivos);
			end;
			'3': begin
				if estado then ListarArchivo(archivo)
				else ListarNombres(archivos);
				readkey
			end;
			'4': if not estado then begin
				JuntarArchivos(archivo, archivos);
			end;
			'5': if not estado then begin
				ListarArchivos(Archivos);
			end;
		end
	until (opcion='0');
	if estado then Close(archivo);
	Close(archivos);
end.