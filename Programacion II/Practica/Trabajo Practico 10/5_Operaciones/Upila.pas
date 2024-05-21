unit Upila;

interface
	
	type
		Tinfo = integer;

		Tpuntero = ^Tnodo;

		Tnodo = record
			info: Tinfo;
			sig: Tpuntero;
		end;

		Tpila = Tpuntero;

	procedure iniciar(var pila: Tpila);

	procedure destruir(var pila: Tpila);

	procedure insertar(var pila: Tpila; info: Tinfo);

	procedure eliminar(var pila: Tpila; var info: Tinfo);

	procedure invertir(var pila: Tpila);

	function recuperar(pila: Tpila): Tinfo;

	function vacia(pila: Tpila): boolean;

	function llena(pila: Tpila): boolean;

implementation

	procedure iniciar(var pila: Tpila);
	begin
		pila:= nil;
	end;

	procedure destruir(var pila: Tpila);
	var
		aux: Tpuntero;
	begin
		aux:= pila;
		while (aux<>nil) do
		begin
			pila:= pila^.sig;
			dispose(aux);
			aux:= pila;
		end;
	end;

	procedure insertar(var pila: Tpila; info: Tinfo);
	var
		aux: Tpuntero;
	begin
		new(aux);
		aux^.info:= info;
		if (pila=nil) then
			aux^.sig:= nil
		else
			aux^.sig:= pila;
		pila:= aux;
	end;

	procedure eliminar(var pila: Tpila; var info: Tinfo);
	var
		aux: Tpuntero;
	begin
		aux:= pila;
		if (aux^.sig=nil) then
			pila:= nil
		else
			pila:= pila^.sig;
		info:= aux^.info;
		dispose(aux);
	end;

	function recuperar(pila: Tpila): Tinfo;
	begin
		recuperar:= pila^.info;
	end;

	function vacia(pila: Tpila): boolean;
	begin
		vacia:= pila = nil;
	end;

	function llena(pila: Tpila): boolean;
	begin
		llena:= false;
	end;

	procedure invertir(var pila: Tpila);
	var
		elemento: Tinfo;
		aux: Tpila;
	begin
		iniciar(aux);
		while not vacia(pila) do
		begin
			eliminar(pila, elemento);
			insertar(aux, elemento);
		end;
		pila:= aux;
	end;

end. 