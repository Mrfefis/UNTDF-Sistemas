unit Umenu;

interface

	uses crt;

	procedure Pausa;

	procedure Opciones(var opcion: char);

implementation

	procedure Pausa;
	begin
		writeln('Pulsa cualquier tecla para continuar...');
		readkey
	end;

	procedure Opciones(var opcion: char);
	begin
		writeln('Operaciones con pila de enteros');
		writeln;
		writeln('1. Cargar elementos');
		writeln('2. Borrar la pila');
		writeln('3. Invertir pila');
		writeln('4. Separar por limite');
		writeln('5. Cambiar un valor de la pila');
		writeln('0. Salir');
		opcion:= readkey;
	end;

end.