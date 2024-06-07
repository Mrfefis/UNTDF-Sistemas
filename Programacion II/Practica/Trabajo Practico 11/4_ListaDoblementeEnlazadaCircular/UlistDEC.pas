unit UlistDEC;

interface
	
	type

		Tinfo = integer;

		Tpuntero = ^Tnodo;

		Tnodo = record
			info: Tinfo;
			ant, sig: Tpuntero;
		end;

		Tlista = Tpuntero;

	procedure iniciar(var lista: Tlista);

	procedure destruir(var lista: Tlista);

	procedure insertar(var lista: Tlista; info: Tinfo);

	procedure listar(lista: Tlista);

	function vacia(lista: Tlista): boolean;

implementation

	procedure iniciar(var lista: Tlista);
	begin
		lista:= nil;
	end;

	procedure destruir(var lista: Tlista);
	var
		aux: Tpuntero;
	begin
		if (lista<>nil) then
		begin
			aux:= lista^.sig;
			lista^.sig:= nil;
			lista:= aux;
			while (lista<>nil) do
			begin
				lista:= lista^.sig;
				dispose(aux);
				aux:= lista;
			end;
		end
	end;

	procedure insertar(var lista: Tlista; info: Tinfo);
	var
		nodo: Tpuntero;
	begin
		new(nodo);
		nodo^.info:= info;
		if (lista=nil) then
		begin
			nodo^.sig:= nodo;
			nodo^.ant:= nodo;
		end
		else
		begin
			nodo^.ant:= lista;
			nodo^.sig:= lista^.sig;
			lista^.sig:= nodo;
		end;
		lista:= nodo;
	end;

	procedure listar(lista: Tlista);
	var
		aux: Tpuntero;
	begin
		write('[ ');
		if (lista<>nil) then
		begin
			aux:= lista^.sig;
			lista:= aux;
			write(lista^.info, ' ');
			lista:= lista^.sig;
			while (lista<>aux) do
			begin
				write(lista^.info, ' ');
				lista:= lista^.sig;
			end
		end;
		writeln(']');
	end;

	function vacia(lista: Tlista): boolean;
	begin
		vacia:= lista=nil;
	end;

end.