unit Udatos;

interface

	type
		Talumno = record
			nombre: string;
			apellido: string;
			dni: longword;
			fechaNacimiento: string[10];
		end;

		Tcurso = record
			codigo: word;
			materia: string;
			profesor: string;
			dniProfesor: longword;
			horario: string;
		end;

	procedure CargarAlumno(var alumno: Talumno);

	procedure CargarCurso(var curso: Tcurso);

	procedure MostrarAlumno(alumno: Talumno);

	procedure MostrarCurso(curso: Tcurso);

implementation

	procedure CargarAlumno(var alumno: Talumno);
	begin
		with alumno do
		begin
			write('Nombre: ');
			readln(nombre);
			write('Apellido: ');
			readln(apellido);
			write('DNI: ');
			readln(dni);
			write('Fecha de Nacimiento: ');
			readln(fechaNacimiento);
		end;
	end;

	procedure MostrarAlumno(alumno: Talumno);
	begin
		with alumno do
		begin
			writeln('Apellido y Nombre: ', apellido + ' ' + nombre);
			writeln('DNI: ', dni, '  Nacimiento: ', fechaNacimiento);
		end;
	end;

	procedure CargarCurso(var curso: Tcurso);
	begin
		with curso do
		begin
			codigo:= random(100);
			write('Nombre de la materia: ');
			readln(materia);
			write('Profesor a Cargo: ');
			readln(profesor);
			write('DNI del Profesor: ');
			readln(dniProfesor);
			write('Horario de Cursada: ');
			readln(horario);
		end;
	end;

	procedure MostrarCurso(curso: Tcurso);
	begin
		with curso do
		begin
			writeln('Codigo: ', codigo);
			writeln('DNI: ', dniProfesor, '  Profesor: ', profesor);
			writeln('Horario: ', horario);
			writeln('Materia: ', materia);
		end;
	end;

end.