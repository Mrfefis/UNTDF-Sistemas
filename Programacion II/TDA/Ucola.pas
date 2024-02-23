UNIT Ucola;

INTERFACE

	type
		Telement = integer;

		Tindex = ^Trec;

		Trec = record
			element: Telement;
			sig: Tindex;
		end;

		Tcola = record
			cabeza, fin: Tindex;
		end;

	procedure qinit(var cola: Tcola);

	procedure qpush(var cola: Tcola; element: Telement);

	procedure qpop(var cola: Tcola);

	function qtop(cola: Tcola): Telement;

	function qlen(cola: Tcola): integer;

	procedure qprint(cola: Tcola);

IMPLEMENTATION

	procedure qinit(var cola: Tcola);
	begin
		new(cola.cabeza);
		cola.fin:= cola.cabeza
	end;

	procedure qpush(var cola: Tcola; element: Telement);
	var
		aux: Tindex;
	begin
		new(aux);
		aux^.element:= element;
		aux^.sig:= NIL;
		cola.fin^.sig:= aux;
		cola.fin:= aux;
	end;

	procedure qpop(var cola: Tcola);
	var
		aux: Tindex;
	begin
		aux:= cola.cabeza^.sig;
		cola.cabeza^.sig:= aux^.sig;
		dispose(aux);
	end;

	function qtop(cola: Tcola): Telement;
	begin
		qtop:= cola.cabeza^.sig^.element;
	end;

	function qlen(cola: Tcola): integer;
	var
		i: Tindex;
	begin
		i:= cola.cabeza;
		qlen:= 0;
		while (i<>cola.fin) do begin
			inc(qlen);
			i:= i^.sig;
		end
	end;

	procedure qprint(cola: Tcola);
	var
		i: Tindex;
	begin
		write('[');
		if (cola.cabeza<>cola.fin) then begin
			i:= cola.cabeza;
			while (i^.sig^.sig<>NIL) do begin
				write(i^.sig^.element, ', ');
				i:= i^.sig;
			end;
			write(i^.sig^.element);
		end;
		writeln(']');
	end;
	
begin
end.
