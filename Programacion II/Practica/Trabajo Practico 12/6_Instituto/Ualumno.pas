unit Ualumno;

interface

	type
		Tclave = longword;

		Talumno = record
			dni: Tclave;
			padron: byte;
			nombre, apellido: string[50];
			direccion: string;
		end;

	procedure Cargar(var alumno: Talumno);

	procedure Imprimir(const alumno: Talumno);

implementation

	procedure Cargar(var alumno: Talumno);
	begin
		write('DNI: ');
		readln(alumno.dni);
		write('Padron: ');
		readln(alumno.padron);
		write('Nombre: ');
		readln(alumno.nombre);
		write('Apellido: ');
		readln(alumno.apellido);
		write('Direccion: ');
		readln(alumno.direccion);
	end;

	procedure Imprimir(const alumno: Talumno);
	begin
		write('[');
		with alumno do
			write(dni, ', ', padron, ', ', nombre, ', ', apellido, ', ', direccion);
		writeln(']');
	end;

end.