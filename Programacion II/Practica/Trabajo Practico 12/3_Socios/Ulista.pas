unit Ulista;

interface

	type
		Tvalor = string;

		Tclave = longint;

		Tinfo = record
			clave: Tclave;
			valor: Tvalor;
		end;

		Tpuntero = ^Tnodo;

		Tnodo = record
			info: Tinfo;
			sig: Tpuntero;
		end;

		Tlista = Tpuntero;

	procedure iniciar(var lista: Tlista);

	procedure insertar(var lista: Tlista; info: Tinfo);

	procedure eliminar(var lista: Tlista; var info: Tinfo);

	procedure imprimir(lista: Tlista);

	function vacia(lista: Tlista): boolean;

	function recuperar(indice: Tpuntero): Tinfo;

	function buscar(lista: Tlista; clave: Tclave): Tpuntero;

implementation

	procedure iniciar(var lista: Tlista);
	var
		aux: Tpuntero;
	begin
		aux:= lista;
		while (lista<>nil) do
		begin
			lista:= lista^.sig;
			dispose(aux);
			aux:= lista
		end
	end;

	procedure insertarInicio(var lista: Tlista; var nodo: Tpuntero);
	begin
		if (lista=nil) then
			nodo^.sig:= nil
		else
			nodo^.sig:= lista;
		lista:= nodo
	end;

	procedure InsertarOrdenado(var lista: Tlista; var nodo: Tpuntero);
	var
		ant, actual: Tpuntero;
	begin
		ant:= lista;
		actual:= lista^.sig;
		while (actual<>nil) and (actual^.info.valor<nodo^.info.valor) do
		begin
			ant:= actual;
			actual:= actual^.sig;
		end;
		nodo^.sig:= actual;
		ant^.sig:= nodo;
	end;

	procedure insertar(var lista: Tlista; info: Tinfo);
	var
		aux: Tpuntero;
	begin
		new(aux);
		aux^.info:= info;
		if (lista=nil) or (info.valor<lista^.info.valor) then
			insertarInicio(lista, aux)
		else
			InsertarOrdenado(lista, aux)
	end;

	procedure eliminar(var lista: Tlista; var info: Tinfo);
	var
		aux: Tpuntero;
	begin
		aux:= lista;
		lista:= lista^.sig;
		info:= aux^.info;
		dispose(aux)
	end;

	procedure imprimir(lista: Tlista);
	begin
		while (lista<>nil) do
		begin
			write('[',lista^.info.clave, ', ', lista^.info.valor, '] ');
			lista:= lista^.sig;
		end;
		writeln;
	end;

	function vacia(lista: Tlista): boolean;
	begin
		vacia:= lista=nil;
	end;

	function recuperar(indice: Tpuntero): Tinfo;
	begin
		recuperar:= indice^.info;
	end;

	function buscar(lista: Tlista; clave: Tclave): Tpuntero;
	begin
		while (lista<>nil) and (lista^.info.clave<>clave) do
			lista:= lista^.sig;
		buscar:= lista;
	end;

end.