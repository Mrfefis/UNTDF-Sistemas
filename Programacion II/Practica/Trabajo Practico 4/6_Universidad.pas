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

	Tuni = record
		elementos: array[1..n] of longword;
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

procedure Asociar(var UNTDF: Tarchivo; var acceso: Tuni);
var
	alumno: Talumno;
begin
	Seek(UNTDF, 0);
	acceso.total:= 0;
	while not EOF(UNTDF) and (acceso.total<n) do begin
		read(UNTDF, alumno);
		inc(acceso.total);
		acceso.elementos[acceso.total]:= alumno.legajo;
	end
end;

procedure AbrirArchivo(var Archi: Tarchivo; ruta: string);
begin
	Assign(Archi, ruta);
	{$I-}
	Reset(Archi);
	{$I+}
	if (IOResult<>0) then
		rewrite(Archi)
end;

// ------------------------------------------ Interfaz ------------------------------------------

procedure Opciones(var opcion: char);
begin
	Mensaje('1. Ingresar', Amarillo, Blanco);
	writeln;
	Mensaje('2. Crear', Rojo, Blanco);
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
	existe:6
	i boolean;
begin
	AbrirArchivo(UNTDF, '6_UNTDF.dat');
	Asociar(UNTDF, acceso);
	repeat
		clrscr;
		Opciones(opcion);
		clrscr;
		case opcion of
			'1': begin
				PedirAlumno(acceso);
				CargarAlumno()
			end;
			'0': ;
		end
	until (opcion='0');
	Close(UNTDF);
end.