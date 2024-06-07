unit UlistaOrdenada;

interface

	uses Utipos;

	type
		Tinfo = Utipos.Tinfo;

		Tpuntero = ^Tnodo;

		Tindice = Tpuntero;

		Tnodo = record
			info: Tinfo;
			sig: Tpuntero;
		end;

		Tlista = Tpuntero;

	procedure iniciar(var lista: Tlista);

	procedure destruir(var lista: Tlista);

	procedure insertar(var lista: Tlista; elemento: Tinfo);

	procedure eliminar(var lista: Tlista; elemento: Tinfo);

	procedure Mostrar(lista: Tlista);

	function vacia(lista: Tlista): boolean;

	function recuperar(puntero: Tpuntero): Tinfo;

implementation

	procedure iniciar(var lista: Tlista);
	begin
		lista:= nil;
	end;

	procedure destruir(var lista: Tlista);
	var
		viajero: Tpuntero;
	begin
		if (lista<>nil) then
		begin
			viajero:= lista^.sig;
			lista^.sig:= nil;
			while (viajero<>nil) do
			begin
				lista:= viajero;
				viajero:= viajero^.sig;
				dispose(lista);
			end;
			lista:= nil;
		end
	end;

	procedure insertarInicio(var lista: Tlista; var aux: Tpuntero);
	begin
		if (lista=nil) then
		begin
			aux^.sig:= aux;
			lista:= aux;
		end
		else
		begin
			aux^.sig:= lista^.sig;
			lista^.sig:= aux;
		end
	end;

	procedure insertarOrdenado(var lista: Tlista; var aux: Tpuntero);
	var
		primero, anterior, viajero: Tpuntero;
	begin
		primero:= lista^.sig;
		viajero:= primero;
		lista^.sig:= nil;
		while (viajero<>nil) and not criterio(viajero^.info,aux^.info) do
		begin
			anterior:= viajero;
			viajero:= viajero^.sig;
		end;
		aux^.sig:= viajero;
		anterior^.sig:= aux;
		if (viajero=nil) then
			lista:= aux;
		lista^.sig:= primero;
	end;

	procedure insertar(var lista: Tlista; elemento: Tinfo);
	var
		aux: Tpuntero;
	begin
		new(aux);
		aux^.info:= elemento;
		if (lista=nil) or criterio(lista^.sig^.info,elemento) then
			insertarInicio(lista, aux)
		else
			insertarOrdenado(lista, aux);
	end;

	procedure eliminar(var lista: Tlista; elemento: Tinfo);
	var
		anterior, viajero: Tpuntero;
	begin
		anterior:= lista;
		viajero:= lista^.sig;
		if (lista=lista^.sig) and comparar(lista^.info,elemento) then
		begin
			lista:= nil;
			dispose(viajero);
		end
		else begin
			while (viajero<>lista) and not comparar(elemento,viajero^.info) do
			begin
				anterior:= viajero;
				viajero:= viajero^.sig;
			end;
			if comparar(viajero^.info,elemento) then
			begin
				anterior^.sig:= viajero^.sig;
				if (viajero=lista) then
					lista:= anterior;
				dispose(viajero);
			end;
		end;
	end;

	procedure Mostrar(lista: Tlista);
	var
		centinela: Tpuntero;
	begin
		write('[');
		if lista<>nil then
		begin
			// Se posiciona en 1 y lo imprime
			lista:= lista^.sig;
			write(lista^.info, ' ');
			// Termina cuando vuelve al comienzo
			centinela:= lista;
			lista:= lista^.sig;
			while (lista<>centinela) do
			begin
				write(lista^.info, ' ');
				lista:= lista^.sig;
			end;
		end;
		writeln(']');
	end;

	function vacia(lista: Tlista): boolean;
	begin
		vacia:= lista=nil;
	end;

	function recuperar(puntero: Tpuntero): Tinfo;
	begin
		recuperar:= puntero^.info;
	end;

end.