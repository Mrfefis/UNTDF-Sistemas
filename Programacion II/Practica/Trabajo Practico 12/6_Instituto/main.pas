program main;
uses crt, Umap, Uarchivo, Ualumno;
{
	Consigna:
	El instituto de la carrera de Sistemas tiene los datos de sus alumnos (DNI, Nro. de
	padrón, apellido, nombre y dirección) en un archivo llamado alumnos.dat. Se debe
	realizar un programa que permita obtener de manera eficiente los datos de cualquier
	alumno.
	Utilice para su solución una función de HASHING que retorne los últimos tres dígitos del
	DNI y además suponga que no habrán más de 1000 alumnos.
	Resuelva utilizando:
	a) Direccionamiento abierto
	b) Direccionamiento cerrado
	Además, realizar un procedimiento para cada uno de los casos que dado un nro. de
	documento liste por pantalla los datos del alumno. Se deberá tener en cuenta la
	inexistencia del alumno en el archivo.
}
type
	Tclave = Ualumno.Tclave;
	Talumno = Ualumno.Talumno;
	Tarchivo = Uarchivo.Tarchivo;


procedure Cargar(var mapa: Tmapa; var archivo: Tarchivo);
var
	alumno: Talumno;
begin
	Ualumno.Cargar(alumno);
	Seek(archivo, FileSize(archivo));
	insertar(mapa, alumno.dni, FileSize(archivo));
	write(archivo, alumno);
end;

procedure Buscar(var mapa: Tmapa; var alumnos: Tarchivo);
var
	dni: Tclave;
	pos: integer;
	alumno: Talumno;
begin
	write('DNI: ');
	readln(dni);
	pos:= Umap.buscar(mapa, dni);
	if (pos=-1) then
		writeln('No existe dni buscado')
	else
	begin
		Seek(alumnos, pos);
		read(alumnos, alumno);
		Ualumno.Imprimir(alumno);
	end
end;

var
	mapa: Tmapa;
	alumnos: Tarchivo;
	opcion: char;
begin
	AbrirArchivo(alumnos, 'alumnos.dat');
	iniciar(mapa, alumnos);
	repeat
		clrscr;
		writeln('1. Cargar Alumno');
		writeln('2. Buscar Alumno');
		writeln('3. Mostrar Alumnos');
		writeln('0. Terminar');
		opcion:= readkey;
		case opcion of
			'1': Cargar(mapa, alumnos);
			'2': begin
				Buscar(mapa, alumnos);
				readkey;
			end;
			'3': begin
				Uarchivo.Mostrar(alumnos);
				readkey;
			end;
		end;
	until(opcion='0');
	Close(alumnos);
end.