unit UlistaInterfaz;

interface
	
	uses UlistaSimple;

	// Agrega elementos al inicio o al final de la lista
	procedure Cargar(var lista: Tlista; opcion: char);

	// Elimina del inicio o del final de la lista
	procedure Borrar(var lista: Tlista; opcion: char; var elemento: Tinfo);
	
	// Elimina un elemento si esta dentro de la lista
	procedure BorrarElemento(var lista: Tlista; var datoEliminado: Tinfo);

implementation

	{
		Dependiendo de la opcion elegida, se cargan varios elementos
		al inicio o al final de la lista.
		Hasta que se ingrese 0.
	}
	procedure Cargar(var lista: Tlista; opcion: char);
	var
		elemento: Tinfo;
	begin
		writeln('Ingresa numeros enteros (Finaliza con 0)');
		write('Numero: ');
		readln(elemento);
		if opcion='1' then
			while (elemento<>0) do
			begin
				insertar(lista, 1, elemento);
				write('Numero: ');
				readln(elemento);
			end
		else
			while (elemento<>0) do
			begin
				insertarFinal(lista, elemento);
				write('Numero: ');
				readln(elemento);
			end
	end;

	{
		Dependiendo de la opcion elegida, se elimina un elemento
		de la lista. Al inicio o al final. Siempre que tenga elementos.
	}
	procedure Borrar(var lista: Tlista; opcion: char; var elemento: Tinfo);
	begin
		if not vacia(lista) then
		begin
			if opcion='3' then
				eliminar(lista, 1, elemento)
			else
				eliminarFinal(lista, elemento);
		end;
	end;

	{
		Pide un elemento al usuario, si lo encuentra en la lista lo borra.
		Sino no realiza ninguna accion.
	}
	procedure BorrarElemento(var lista: Tlista; var datoEliminado: Tinfo);
	var
		elemento: Tinfo;
		indice: Tindice;
	begin
		write('Numero: ');
		readln(elemento);
		indice:= Buscar(lista, elemento);
		readln;
		if (indice<>0) then
		begin
			datoEliminado:= elemento;
			eliminar(lista, indice, datoEliminado)
		end
	end;

end.