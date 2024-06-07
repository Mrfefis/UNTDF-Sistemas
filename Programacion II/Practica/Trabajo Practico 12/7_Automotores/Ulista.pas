unit Ulista;

interface

	uses Uauto;

	type
		Tvalor = integer;

		Tclave = Uauto.Tclave;

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

	procedure insertar(var lista: Tlista; info: Tinfo);
	var
		aux: Tpuntero;
	begin
		new(aux);
		aux^.info:= info;
		if (lista=nil) then
			aux^.sig:= nil
		else
			aux^.sig:= lista;
		lista:= aux;
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