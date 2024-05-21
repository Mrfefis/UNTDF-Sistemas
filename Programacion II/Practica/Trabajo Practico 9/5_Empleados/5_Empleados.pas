program ListaDeEmpleados;
uses crt, UlistaSimple, Uempleado;
{
	Consigna:
	Dada una lista apuntada por LISTAEMP :
	 TYPE
	 CADENA = STRING [20] ;
	 PTR = ^ NODO ;
	 NODO = RECORD
	 NOMBRE : CADENA ;
	 NROEMP : INTEGER ;
	 CODIGODPTO : CHAR ;
	 HRSEMANA : INTEGER ;
	 SALARIO : REAL ;
	 SIG : PTR
	 END;
	 VAR
	 LISTAEMP : PTR ;
	Escribir un procedimiento para suprimir de la lista a todos los empleados que trabajen
	menos de 40 hs. por semana (HRSEMANA).
}
type
	Tempresa = UlistaSimple.Tlista;

procedure Opciones(var opcion: char);
begin
	writeln('1. Ingresar nuevo empleado');
	writeln('2. "No hay presupuesto"');
	writeln('3. Listar empleados');
	writeln('0. Salir');
	opcion:= readkey;
end;

procedure MostarEmpleados(empresa: Tempresa);
var
	i, limite: Tindice;
	empleado: Templeado;
begin
	limite:= longitud(empresa);
	writeln('Nombre','':14, 'Numero','':4, 'Departamento','':4, 'Horas','':4, 'Salario');
	for i:=1 to limite do
	begin
		empleado:= recuperar(empresa, i);
		with empleado do
		begin
			write(nombre, '':(20-length(nombre)), numeroEmpleado:6,'':4, codigoDepartamento:12);
			write('':4,horaSemana:5, '':4,salario:7:2);
		end;
		writeln;
	end;
	writeln('Presiona cualquier tecla para continuar...');
	readkey;
end;

procedure CargarEmpleado(var empresa: Tempresa);
var
	empleado: Templeado;
begin
	writeln('Ingresa los datos del nuevo Empleado');
	with empleado do
	begin
		write('Nombre: '); readln(nombre);
		write('Nro del Empleado: '); readln(numeroEmpleado);
		write('Departamento: '); readln(codigoDepartamento);
		write('Horas Trabajadas: '); readln(horaSemana);
		write('Salario: '); readln(salario);
	end;
	UlistaSimple.insertarFinal(empresa, empleado);
end;

procedure SumprimirVagos(var empresa: Tempresa);
var
	nuevaEmpresa: Tempresa;
	empleado: Templeado;
begin
	iniciar(nuevaEmpresa);
	while not UlistaSimple.vacia(empresa) do
	begin
		UlistaSimple.eliminar(empresa, 1, empleado);
		if (empleado.horaSemana>=40) then
			UlistaSimple.insertarFinal(nuevaEmpresa, empleado);
	end;
	empresa:= nuevaEmpresa;
end;

var
	empresa: Tempresa;
	opcion: char;
begin
	iniciar(empresa);
	repeat
		clrscr;
		writeln('--------------------------------');
		writeln('BIENVENIDO A UNA EMPRESA ANONIMA');
		writeln('--------------------------------');
		writeln;
		Opciones(opcion);
		case opcion of
			'1': CargarEmpleado(empresa);
			'2': SumprimirVagos(empresa);
			'3': MostarEmpleados(empresa);
		end;
	until (opcion='0');
end.