program prueba;
uses crt, Umultilist, Urelation1, Urelation2, Udatos;
{
	Consigna:

}
type
	Talumnos = Urelation1.Tlist;
	Tcursos = Urelation2.Tlist;

procedure Pausa;
begin
	writeln('Pulsa cualquier tecla para continuar...');
	readkey;
end;

var
	Alumnos: Talumnos;
	Cursos: Tcursos;
	curso: Tcurso;
	alumno: Talumno;
	opcion: char;
	IndiceAlumno: Urelation1.Tindice;
	IndiceCurso: Urelation2.Tindice;
begin
	Randomize;
	Urelation1.init(Alumnos, 'Alumnos.dat');
	Urelation2.init(Cursos, 'Cursos.dat');
	repeat
		clrscr;
		writeln('1. Cargar Alumno');
		writeln('2. Cargar Curso');
		writeln('3. Listar Alumnos');
		writeln('4. Listar Cursos');
		writeln('5. Inscribir Alumno en un Curso');
		writeln('6. Listar Alumnos por Curso');
		writeln('7. Listar Cursos de un Alumno');
		writeln('0. Salir');
		opcion:= readkey;
		writeln;

		case opcion of
			'1': begin
				CargarAlumno(alumno);
				Urelation1.add(Alumnos, alumno);
			end;
			'2': begin
				CargarCurso(curso);
				Urelation2.add(Cursos, curso);
			end;
			'3': begin
				clrscr;
				writeln('Lista de Alumnos de la Universidad');
				Urelation1.listar(Alumnos);
				Pausa;
			end;
			'4': begin
				clrscr;
				writeln('Lista de Cursos de la Universidad');
				Urelation2.listar(Cursos);
				Pausa;
			end;
			'5': begin
				write('Codigo del curso: ');
				readln(curso.codigo);
				IndiceCurso:= Urelation2.search(Cursos, curso);
				if (IndiceCurso<>nil) then
				begin
					write('DNI: ');
					readln(alumno.dni);
					IndiceAlumno:= Urelation1.search(Alumnos, alumno);
					if (IndiceAlumno<>nil) then
					begin
						Umultilist.insert(IndiceAlumno, IndiceCurso);
						writeln('Alumno cargado con exito');
					end
					else
						writeln('El alumno no existe')
				end
				else
					writeln('El curso no existe');
				Pausa;
			end;
			'6': begin
				write('Codigo Curso: ');
				readln(curso.codigo);
				IndiceCurso:= Urelation2.search(Cursos, curso);
				if (IndiceCurso<>nil) then
					Umultilist.listarRelacion1(IndiceCurso)
				else
					writeln('El alumno no existe');
				Pausa;
			end;
			'7': begin
				write('DNI del Alumno: ');
				readln(alumno.dni);
				IndiceAlumno:= Urelation1.search(Alumnos, alumno);
				if (IndiceAlumno<>nil) then
					Umultilist.listarRelacion2(IndiceAlumno)
				else
					writeln('El curso no existe');
				Pausa;
			end;
		end;
	until(opcion='0');
	Urelation1.free(Alumnos, 'Alumnos.dat');
	Urelation2.free(Cursos, 'Cursos.dat');
end.