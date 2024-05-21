unit Ucola;

interface

	type
		Tinfo = integer;

		Tpuntero = ^Tnodo;

		Tnodo = record
			info: Tinfo;
			sig: Tpuntero;
		end;

		Tcola = record
			cabeza, fin: Tpuntero;
		end;

	procedure iniciar(var cola: Tcola);

	procedure destruir(var cola: Tcola);

	procedure insertar(var cola: Tcola; info: Tinfo);

	procedure eliminar(var cola: Tcola; var info: Tinfo);

	function recuperar(cola: Tcola): Tinfo;

	function vacia(cola: Tcola): boolean;

	function llena(cola: Tcola): boolean;

	procedure invertir(var cola: Tcola);

implementation

	procedure iniciar(var cola: Tcola);
	begin
		cola.cabeza:= nil;
		cola.fin:= nil;
	end;

	procedure destruir(var cola: Tcola);
	var
		aux: Tpuntero;
	begin
		aux:= cola.cabeza;
		while (aux<>nil) do
		begin
			cola.cabeza:= cola.cabeza^.sig;
			dispose(aux);
			aux:= cola.cabeza;
		end;
		cola.fin:= nil;
	end;

	procedure insertar(var cola: Tcola; info: Tinfo);
	var
		aux: Tpuntero;
	begin
		new(aux);
		aux^.info:= info;
		aux^.sig:= nil;
		if (cola.cabeza=nil) then
			cola.cabeza:= aux
		else
			cola.fin^.sig:= aux;
		cola.fin:= aux; 
	end;

	procedure eliminar(var cola: Tcola; var info: Tinfo);
	var
		aux: Tpuntero;
	begin
		with cola do
		begin
			aux:= cabeza;
			if (aux^.sig=nil) then
			begin
				cabeza:= nil;
				fin:= nil;
			end
			else
				cabeza:= cabeza^.sig;
			info:= aux^.info;
			dispose(aux);
		end;
	end;

	function recuperar(cola: Tcola): Tinfo;
	begin
		recuperar:= cola.cabeza^.info;
	end;

	function vacia(cola: Tcola): boolean;
	begin
		vacia:= cola.cabeza=nil;
	end;

	function llena(cola: Tcola): boolean;
	begin
		llena:= false;
	end;

	procedure invertir(var cola: Tcola);
	var
		ant, actual, sig: Tpuntero;
	begin
		ant:= nil;
		actual:= cola.cabeza;
		if (actual<>nil) then
			cola.fin:= actual;
		while (actual<>nil) do
		begin
			sig:= actual^.sig;
			actual^.sig:= ant;
			ant:= actual;
			actual:= sig;
		end;
		cola.cabeza:= ant;
	end;

end.