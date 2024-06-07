program Imprimir;
uses crt, Uarbol, Utipos;
{
	Consigna:
	Un árbol binario de búsqueda contiene información sobre una clase. Está ordenada por el
	promedio (PROM) y se quiere imprimir una lista con los promedios desde el mayor al más
	bajo, para mostrar la situación de la clase.
	Escribir un procedimiento para imprimir el promedio y nombre del estudiante SIN
	MODIFICAR EL ÁRBOL NI REORDENAR SUS DATOS.
}
type
	Talumno = Utipos.Tinfo;

procedure Inicializar(var arbol: Tarbol);
var
	alumno: Talumno;
begin
	alumno.promedio:= random(100)+1;
	alumno.nombre:= 'Mauricio';
	Uarbol.insertar(arbol, alumno);

	alumno.promedio:= random(100)+1;
	alumno.nombre:= 'Jose';
	Uarbol.insertar(arbol, alumno);

	alumno.promedio:= random(100)+1;
	alumno.nombre:= 'Alberto';
	Uarbol.insertar(arbol, alumno);

	alumno.promedio:= random(100)+1;
	alumno.nombre:= 'Benjamin';
	Uarbol.insertar(arbol, alumno);

	alumno.promedio:= random(100)+1;
	alumno.nombre:= 'Kiko';
	Uarbol.insertar(arbol, alumno);

	alumno.promedio:= random(100)+1;
	alumno.nombre:= 'Neuman';
	Uarbol.insertar(arbol, alumno);

	alumno.promedio:= random(100)+1;
	alumno.nombre:= 'Jail';
	Uarbol.insertar(arbol, alumno);

	alumno.promedio:= random(100)+1;
	alumno.nombre:= 'Saturno';
	Uarbol.insertar(arbol, alumno);

	alumno.promedio:= random(100)+1;
	alumno.nombre:= 'Roberto';
	Uarbol.insertar(arbol, alumno);

	alumno.promedio:= random(100)+1;
	alumno.nombre:= 'Hugo';
	Uarbol.insertar(arbol, alumno);
end;

var
	clase: Tarbol;
begin
	iniciar(clase);
	Inicializar(clase);
	listarEnOrden(clase);
	readkey
end.