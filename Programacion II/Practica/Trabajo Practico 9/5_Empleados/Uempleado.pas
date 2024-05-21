unit Uempleado;

interface

	type
	 	cadena = string[20];
		Templeado = record
			nombre: cadena;
			numeroEmpleado: integer;
			codigoDepartamento: char;
			horaSemana: integer;
			salario: real;
		end;

	function comparar(e1, e2: Templeado): boolean;

	procedure mostrar(empleado: Templeado);

implementation

	function comparar(e1, e2: Templeado): boolean;
	begin
		comparar:= (e1.numeroEmpleado=e2.numeroEmpleado);
	end;

	procedure mostrar(empleado: Templeado);
	begin
		with empleado do
		begin
			writeln('Nombre: ',nombre);
			writeln('Numero: ', numeroEmpleado);
			writeln('Departamento: ', codigoDepartamento);
			writeln('Horas de la Semana: ', horaSemana);
			writeln('Salario: ', salario:0:2);
		end;
	end;

end.