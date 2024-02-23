UNIT Ulist;

INTERFACE

	type
		Telement = integer;

		Tindex = ^Trec;

		Trec = record
			element: Telement;
			sig: Tindex;
		end;

		Tlist = record
			cabeza, fin: Tindex;
		end;

	procedure initlist(var list: Tlist);

	procedure addlist(var list: Tlist; index: Tindex; element: Telement);

	procedure dellist(index: Tindex);

	function recovlist(index: Tindex): Telement;

	function first(list: Tlist): Tindex;

	function next(index: Tindex): Tindex;

	function fin(list: Tlist): Tindex;

	function lenlist(list: Tlist): integer;

	function locatelist(list: Tlist; element: Telement): Tindex;

	procedure printlist(list: Tlist);

IMPLEMENTATION

	procedure initlist(var list: Tlist);
	begin
		new(list.cabeza);
		list.fin:= list.cabeza
	end;

	procedure addlist(var list: Tlist; index: Tindex; element: Telement);
	var
		aux: Tindex;
	begin
		new(aux);
		aux^.element:= element;
		aux^.sig:= index^.sig;
		index^.sig:= aux;
		if (aux^.sig=NIL) then
			list.fin:= aux;
	end;

	procedure dellist(index: Tindex);
	var
		aux: Tindex;
	begin
		aux:= index^.sig;
		index^.sig:= aux^.sig;
		dispose(aux);
	end;

	function recovlist(index: Tindex): Telement;
	begin
		recovlist:= index^.sig^.element;
	end;

	function first(list: Tlist): Tindex;
	begin
		first:= list.cabeza;
	end;

	function next(index: Tindex): Tindex;
	begin
		next:= index^.sig;
	end;

	function fin(list: Tlist): Tindex;
	begin
		fin:= list.fin;
	end;

	function lenlist(list: Tlist): integer;
	var
		i: Tindex;
	begin
		i:= first(list);
		lenlist:= 0;
		while (i<>fin(list)) do begin
			inc(lenlist);
			i:= next(i)
		end
	end;

	function locatelist(list: Tlist; element: Telement): Tindex;
	var
		i: Tindex;
		encontrado: boolean;
	begin
		i:= first(list);
		encontrado:= false;
		while (i<>fin(list)) and (not encontrado) do begin
			if (recovlist(i)=element) then
				encontrado:= true
			else i:= next(i)
		end;
		locatelist:= i;
	end;

	procedure printlist(list: Tlist);
	var
		i: Tindex;
		c, total: integer;
	begin
		i:= first(list);
		c:= 1;
		total:= lenlist(list);
		write('[');
		while (c<total) do begin
			write(recovlist(i), ', ');
			i:= next(i);
			inc(c)
		end;
		if total>0 then
			write(recovlist(i));
		writeln(']');
	end;

begin
end.
