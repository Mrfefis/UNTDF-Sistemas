unit Uinterfaz;

interface

	uses crt, UlistaOrdenada, Ulista;

	procedure Pausa;

	procedure Opciones(var opcion: char);

	procedure Cargar(var lista: Ulista.Tlista);

	procedure Imprimir(lista: Ulista.Tlista;
		listaOrdenada: UlistaOrdenada.Tlista);

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
		writeln('3. Ordenar descendente');
		writeln('4. Ordenar ascendente');
		writeln('0. Terminar');
		opcion:= readkey
	end;

	procedure Cargar(var lista: Ulista.Tlista);
	var
		info: Tinfo;
	begin
		writeln('Carga numeros positivos(Ingresa 0 para finalizar)');
		write('Numero: ');
		readln(info);
		while (info<>0) do
		begin
			Ulista.insertar(lista, info);
			write('Numero: ');
			readln(info);
		end
	end;

	procedure Imprimir(lista: Ulista.Tlista;
		listaOrdenada: UlistaOrdenada.Tlista);
	begin
		write('Lista = ');
		Ulista.Listar(lista);
		write('Lista Ordenada = ');
		UlistaOrdenada.Listar(listaOrdenada);
	end;

end.