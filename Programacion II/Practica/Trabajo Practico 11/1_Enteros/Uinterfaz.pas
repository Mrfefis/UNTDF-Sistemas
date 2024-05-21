unit Uinterfaz;

interface

	uses crt, UlistaOrdenada;

	procedure Pausa;

	procedure Opciones(var opcion: char);

	procedure Cargar(var lista: Tlista);

	procedure Imprimir(lista: Tlista);

implementation

	procedure Pausa;
	begin
		writeln;
		writeln;
		writeln('Pulsa cualquier tecla para continuar...');
		readkey
	end;

	procedure Opciones(var opcion: char);
	begin
		writeln('1. Cargar elementos');
		writeln('2. Borrar la lista');
		writeln('3. Imprimir la lista');
		writeln('0. Terminar');
		opcion:= readkey
	end;

	procedure Cargar(var lista: Tlista);
	var
		info: Tinfo;
	begin
		writeln('Carga numeros positivos(Ingresa n<=0 para finalizar)');
		write('Numero: ');
		readln(info);
		while (info>0) do
		begin
			insertar(lista, info);
			write('Numero: ');
			readln(info);
		end
	end;

	procedure Imprimir(lista: Tlista);
	var
		indice: Tindice;
	begin
		indice:= primero(lista);
		while indice<>fin(lista) do
		begin
			write(recuperar(indice), ' ');
			indice:= siguiente(lista, indice);
		end;
		writeln;
	end;

end.