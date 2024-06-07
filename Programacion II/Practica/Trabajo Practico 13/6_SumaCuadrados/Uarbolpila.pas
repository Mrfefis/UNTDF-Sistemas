unit Uarbolpila;

interface

	uses Utipos;

	type
		Tinfo = TpunteroArbol;

		Tpuntero = TpunteroLista;

		Tpila = Tpuntero;

	procedure init(var pila: Tpila);

	procedure push(var pila: Tpila; info: Tinfo);

	procedure pop(var pila: Tpila; var info: Tinfo);

	function empty(pila: Tpila): boolean;

implementation

	procedure init(var pila: Tpila);
	begin
		pila:= nil;
	end;

	procedure push(var pila: Tpila; info: Tinfo);
	var
		nodo: Tpuntero;
	begin
		new(nodo);
		nodo^.info:= info;
		if (pila=nil) then
			nodo^.sig:= nil
		else
			nodo^.sig:= pila;
		pila:= nodo
	end;

	procedure pop(var pila: Tpila; var info: Tinfo);
	var
		aux: Tpila;
	begin
		info:= pila^.info;
		aux:= pila;
		pila:= pila^.sig;
		dispose(aux)
	end;

	function empty(pila: Tpila): boolean;
	begin
		empty:= pila = nil;
	end;

end.