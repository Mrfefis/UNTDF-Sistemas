program main;
uses crt, Utipos, Uarbol;
{
	Consigna:
	Un árbol binario de búsqueda está ordenado de acuerdo con el número de estudiantes.
	Imprimir los nombres de todas las mujeres ordenadas desde el nro. más pequeño al mayor.
	(Procedimiento recursivo).
}
type
	Testudiante = Utipos.Tinfo;

procedure Cargar(var estudiantes: Tarbol);
var
	estudiante: Testudiante;
begin
	Utipos.Cargar(estudiante);
	while (estudiante.numero<>0) and (estudiante.nombre<>'') do
	begin
		Uarbol.insertar(estudiantes, estudiante);
		Utipos.Cargar(estudiante);
	end
end;

procedure MostrarMujeres(estudiantes: Tarbol);
begin
	if (estudiantes<>nil) then
	begin
		MostrarMujeres(izquierda(estudiantes));
		if recuperar(estudiantes).sexo then
			Utipos.Imprimir(recuperar(estudiantes));
		MostrarMujeres(derecha(estudiantes));
	end
end;

var
	estudiantes: Tarbol;
begin
	iniciar(estudiantes);
	Cargar(estudiantes);
	MostrarMujeres(estudiantes);
	readkey
end.