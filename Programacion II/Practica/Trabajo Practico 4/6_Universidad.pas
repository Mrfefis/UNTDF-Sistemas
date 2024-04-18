program Universidad;
uses crt;
{
	Consigna:
	6- Se desea mantener la siguiente información relativa a los alumnos de la Universidad
	Nacional de Tierra del Fuego:
	• Apellido y Nombres
	• Legajo
	• Domicilio
	• Teléfono
	• Código de la Carrera (entero entre 1 y 15)
	• Cantidad de Materias aprobadas
	• Fecha de Ingreso
	• Baja (0/1)
	Sobre esta información, se desean realizar las siguientes operaciones:
	a) Asociar al archivo un índice de acceso directo (Legajo, posición). Tener en cuenta
	dicha estructura para desarrollar las siguientes operaciones.
	b) Incorporar un nuevo alumno verificando que ya no estuviese cargado.
	c) Dar de baja lógicamente a un alumno determinado.
	d) Proponga una manera de recuperar el espacio generado por estas bajas lógicas.
	e) Mostrar por pantalla la información sobre un alumno particular, a partir de un
	número de legajo.
	f) Modificar la dirección y/o teléfono de un alumno en caso de cambio de domicilio. 
}
const
	n = 1000;
type
	Talumno = record
		nombre: string[100];
		legajo: longword;
		domicilio: string;
		telefono: string[15];
		codigo: 0..999;
		materias: 0..50;
		fecha: string[6];
		baja: boolean;
	end;

	Tarchivo = file of Talumno;

	Tconexion = record
		legajo: longword;
		baja: boolean;
	end;

	Tuni = record
		elementos: array[1..n] of Tconexion;
		total: integer;
	end;

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

// ------------------------------------------ Archivos ------------------------------------------

procedure AbrirArchivo(var Archi: Tarchivo; ruta: string);
begin
	Assign(Archi, ruta);
	{$I-}
	Reset(Archi);
	{$I+}
	if (IOResult<>0) then
		rewrite(Archi)
end;

// --------------------------------------- Acceso Directo ---------------------------------------

procedure Asociar(var UNTDF: Tarchivo; var acceso: Tuni);
var
	alumno: Talumno;
begin
	Seek(UNTDF, 0);
	acceso.total:= 0;
	while not EOF(UNTDF) and (acceso.total<n) do begin
		read(UNTDF, alumno);
		inc(acceso.total);
		acceso.elementos[acceso.total].legajo:= alumno.legajo;
		acceso.elementos[acceso.total].baja:= alumno.baja;
	end
end;

function Buscar(var acceso: Tuni; elemento: longword): integer;
var
	i: integer;
	encontrado: boolean;
begin
	i:= 1;
	encontrado:= false;
	while (i<=acceso.total) and not encontrado do begin
		if acceso.elementos[i].legajo=elemento then
			encontrado:= true
		else inc(i)
	end;
	if encontrado then Buscar:= i
	else Buscar:= -1
end;

function BuscarBaja(var acceso: Tuni): integer;
var
	i: integer;
	encontrado: boolean;
begin
	i:= 1;
	encontrado:= false;
	while (i<=acceso.total) and not encontrado do begin
		if acceso.elementos[i].baja=true then
			encontrado:= true
		else inc(i)
	end;
	if encontrado then BuscarBaja:= i-1
	else BuscarBaja:= acceso.total
end;

procedure PedirDatos(var alumno: Talumno);
begin
	with alumno do begin
		Mensaje('Nombre: ', Amarillo, Blanco);
		readln(nombre);
		Mensaje('Domicilio: ', Cian, Blanco);
		readln(domicilio);
		Mensaje('telefono: ', Verde, Blanco);
		readln(telefono);
		Mensaje('Codigo: ', Amarillo, Blanco);
		readln(codigo);
		Mensaje('Materias Aprobadas: ', Cian, Blanco);
		readln(materias);
		Mensaje('Fecha de Inscripcion: ', Verde, Blanco);
		readln(fecha);
		baja:= false
	end
end;

procedure InscribirAlumno(var UNTDF: Tarchivo; var acceso: Tuni);
var
	alumno: Talumno;
	posicion: integer;
	opcion: char;
begin
	Mensaje('Legajo: ', Azul, Blanco);
	readln(alumno.legajo);
	posicion:= Buscar(acceso, alumno.legajo);
	if posicion=-1 then begin
		PedirDatos(alumno);
		Seek(UNTDF, BuscarBaja(acceso));
		write(UNTDF, alumno);
		inc(acceso.total);
		acceso.elementos[acceso.total].legajo:= alumno.legajo;
		acceso.elementos[acceso.total].baja:= alumno.baja;
	end
	else begin
		Mensaje('El alumno ya se encuentra inscripto', Rojo, Blanco);
		writeln;
		Mensaje('Reemplazar (R) Cancelar(Cualquier otra tecla)', Rojo, Blanco);
		writeln;
		Mensaje('Opcion: ', Verde, Blanco);
		readln(opcion);
		if (opcion='r') or (opcion='R') then begin
			PedirDatos(alumno);
			Seek(UNTDF, posicion-1);
			write(UNTDF, alumno);
		end;
	end
end;

procedure DardeBaja(var UNTDF: Tarchivo; var acceso: Tuni);
begin
end;

// ------------------------------------------ Interfaz ------------------------------------------

procedure Listar(var UNTDF: Tarchivo);
var
	alumno: Talumno;
begin
	Seek(UNTDF, 0);
	while not EOF(UNTDF) do begin
		read(UNTDF, alumno);
		with alumno do if not baja then begin
			Mensaje('Legajo: ', Verde, Blanco);
			writeln(legajo);
			Mensaje('Nombre: ', Amarillo, Blanco);
			writeln(nombre);
			Mensaje('Domicilio: ', Cian, Blanco);
			writeln(domicilio);
			Mensaje('telefono: ', Verde, Blanco);
			writeln(telefono);
			Mensaje('Codigo: ', Amarillo, Blanco);
			writeln(codigo);
			Mensaje('Materias Aprobadas: ', Cian, Blanco);
			writeln(materias);
			Mensaje('Fecha de Inscripcion: ', Verde, Blanco);
			writeln(fecha);
			Separador;
		end
	end;
	readkey
end;

procedure Opciones(var opcion: char);
begin
	Mensaje('1. Incribir Alumno', Amarillo, Blanco);
	writeln;
	Mensaje('2. Listar Alumnos', Rojo, Blanco);
	writeln;
	Mensaje('3. Ver Empresas', Verde, Blanco);
	writeln;
	Mensaje('4. Juntar todos los productos', Morado, Blanco);
	writeln;
	Mensaje('5. Listar todos los productos', Cian, Blanco);
	writeln;
	Mensaje('0. Terminar', Azul, Blanco);
	writeln;
	write('Opcion: ');
	readln(opcion);
end;

// ------------------------------------------ Programa Principal ------------------------------------------

var
	UNTDF: Tarchivo;
	acceso: Tuni;
	opcion: char;
begin
	AbrirArchivo(UNTDF, '6_UNTDF.dat');
	Asociar(UNTDF, acceso);
	repeat
		clrscr;
		Opciones(opcion);
		clrscr;
		case opcion of
			'1': if acceso.total=n then begin
				Mensaje('Maximo de Alumnos Alcanzado', Rojo, Blanco);
				writeln;
				writeln('Pulsa cualquier tecla para continuar...');
				readkey; 
				end
				else InscribirAlumno(UNTDF, acceso);
			'2': Listar(UNTDF);
			//'3': DardeBaja(UNTDF, aceeso);
			'0': ;
		end
	until (opcion='0');
	Close(UNTDF);
end.