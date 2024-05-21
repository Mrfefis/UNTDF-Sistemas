unit UcolaCircular;
interface
	
	type
		Tinfo = integer;

		Tpuntero = ^Tnodo;

		Tnodo = record
			info: Tinfo;
			sig: Tpuntero;
		end;

		Tcola = Tpuntero;

	procedure iniciar(var cola: Tcola);

	procedure destruir(var cola: Tcola);

	procedure insertar(var cola: Tcola; info: Tinfo);

	procedure eliminar(var cola: Tcola; var info: Tinfo);

	function recuperar(cola: Tcola): Tinfo;

	function vacia(cola: Tcola): boolean;

	function llena(cola: Tcola): boolean;

implementation

	procedure iniciar(var cola: Tcola);
	begin
		cola:= nil;
	end;

	procedure destruir(var cola: Tcola);
	var
		aux: Tpuntero;
	begin
		if (cola<>nil) then
		begin
			aux:= cola^.sig;
			cola^.sig:= nil;
			cola:= aux;
			while (cola<>nil) do
			begin
				cola:= cola^.sig;
				dispose(aux);
				aux:= cola;
			end
		end
	end;

	procedure insertar(var cola: Tcola; info: Tinfo);
	var
		aux: Tpuntero;
	begin
		new(aux);
		aux^.info:= info;
		if (cola=nil) then
			aux^.sig:= aux
		else
		begin
			aux^.sig:= cola^.sig;
			cola^.sig:= aux;
		end;
		cola:= aux;
	end;

	procedure eliminar(var cola: Tcola; var info: Tinfo);
	var
		aux: Tpuntero;
	begin
		aux:= cola^.sig;
		if (cola=aux) then
			cola:= nil
		else
			cola^.sig:= aux^.sig;
		info:= aux^.info;
		dispose(aux);
	end;

	function recuperar(cola: Tcola): Tinfo;
	begin
		recuperar:= cola^.info;
	end;

	function vacia(cola: Tcola): boolean;
	begin
		vacia:= cola=nil;
	end;

	function llena(cola: Tcola): boolean;
	begin
		llena:= false;
	end;

end.