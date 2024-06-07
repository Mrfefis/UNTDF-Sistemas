unit Umultilist;

interface

	uses Udatos;

	type

		// Listas de elementos

		Talumnos = ^TnodoAlumno;

		Tcursos = ^TnodoCurso;

		Tmultilist = ^TnodoMultilist;

		// Nodos de elementos

		TnodoAlumno = record
			element: Talumno;
			next: Talumnos;
			multilist: Tmultilist;
		end;

		TnodoCurso = record
			element: Tcurso;
			next: Tcursos;
			multilist: Tmultilist;
		end;

		TnodoMultilist = record
			alumno: Talumnos;
			curso: Tcursos;
			nextAlumno, nextCurso: Tmultilist;
		end;

	procedure insert(alumno: Talumnos; curso: Tcursos);

	//procedure elminar(var relation1: Trelation1List; var relation2: Trelation2List);

	procedure listarAlumnos(curso: Tcursos);

	procedure listarCursos(alumno: Talumnos);

implementation

	procedure insert(alumno: Talumnos; curso: Tcursos);
	var
		nodo: Tmultilist;
	begin
		if (alumno<>nil) and (curso<>nil) then
		begin
			// Creacion del nodo y relacion con los elementos
			new(nodo);
			nodo^.alumno:= alumno;
			nodo^.curso:= curso;
			// Conecta el alumno con la lista de Cursos
			if (alumno^.multilist=nil) then
				nodo^.nextCurso:= nil
			else
				nodo^.nextCurso:= alumno^.multilist;
			alumno^.multilist:= nodo;
			// Conecta el curso con la lista de Alumnos
			if (curso^.multilist=nil) then
				nodo^.nextAlumno:= nil
			else
				nodo^.nextAlumno:= curso^.multilist;
			curso^.multilist:= nodo
		end;
	end;

	procedure listarAlumnos(curso: Tcursos);
	var
		aux: Tmultilist;
	begin
		aux:= curso^.multilist;
		while (aux<>nil) do
		begin
			MostrarAlumno(aux^.alumno^.element);
			aux:= aux^.nextAlumno;
		end
	end;

	procedure listarCursos(alumno: Talumnos);
	var
		aux: Tmultilist;
	begin
		aux:= alumno^.multilist;
		while (aux<>nil) do
		begin
			MostrarCurso(aux^.curso^.element);
			aux:= aux^.nextAlumno;
		end
	end;

	

end.