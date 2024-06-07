unit Uarbolcola;

interface

	uses Utipos;

	type
		Tinfo = TpunteroArbol;

		Tpuntero = TpunteroLista;

		Tcola = Tpuntero;

	procedure init(var cola: Tcola);

	procedure push(var cola: Tcola; info: Tinfo);

	procedure pop(var cola: Tcola; var info: Tinfo);

	function empty(cola: Tcola): boolean;

implementation

	procedure init(var cola: Tcola);
	begin
		cola:= nil;
	end;

	procedure push(var cola: Tcola; info: Tinfo);
	var
		nodo: Tpuntero;
	begin
		new(nodo);
		nodo^.info:= info;
		if (cola=nil) then
			nodo^.sig:= nodo
		else
		begin
			nodo^.sig:= cola^.sig;
			cola^.sig:= nodo
		end;
		cola:= nodo
	end;

	procedure pop(var cola: Tcola; var info: Tinfo);
	var
		nodo: Tpuntero;
	begin
		info:= cola^.sig^.info;
		nodo:= cola^.sig;
		if (cola=nodo) then
			cola:= nil
		else
			cola^.sig:= nodo^.sig;
		dispose(nodo)
	end;

	function empty(cola: Tcola): boolean;
	begin
		empty:= cola=nil
	end;

end.