UNIT Upila;

INTERFACE

	type
		Telement = integer;

		Tindex = ^Trec;

		Trec = record
			element: Telement;
			sig: Tindex;
		end;

		Tpila = Tindex;

	procedure sinit(var pila: Tpila);

	procedure spush(var pila: Tpila; element: Telement);

	procedure spop(var pila: Tpila);

	function stop(pila: Tpila): Telement;

	function slen(pila: Tpila): integer;

	procedure sprint(pila: Tpila);

IMPLEMENTATION

	procedure sinit(var pila: Tpila);
	begin
		new(pila);
	end;

	procedure spush(var pila: Tpila; element: Telement);
	var
		aux: Tindex;
	begin
		new(aux);
		aux^.element:= element;
		aux^.sig:= pila;
		pila:= aux;
	end;

	procedure spop(var pila: Tpila);
	var
		aux: Tindex;
	begin
		aux:= pila;
		pila:= aux^.sig;
		dispose(aux);
	end;

	function stop(pila: Tpila): Telement;
	begin
		stop:= pila^.element;
	end;

	function slen(pila: Tpila): integer;
	var
		i: Tindex;
	begin
		i:= pila;
		slen:= 0;
		while (i^.sig<>NIL) do begin
			inc(slen);
			i:= i^.sig;
		end
	end;

	procedure sprint(pila: Tpila);
	var
		i: Tindex;
	begin
		write('[');
		if (pila^.sig<>NIL) then begin
			i:= pila;
			while (i^.sig^.sig<>NIL) do begin
				write(i^.element, ', ');
				i:= i^.sig;
			end;
			write(i^.element);
		end;
		writeln(']');
	end;
	
begin
end.
