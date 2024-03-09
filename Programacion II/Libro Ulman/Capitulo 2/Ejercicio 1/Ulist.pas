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

	function recovlist(index: Tindex): Telement;

	function first(list: Tlist): Tindex;

	function next(index: Tindex): Tindex;

	function fin(list: Tlist): Tindex;

	function lenlist(list: Tlist): integer;

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

begin
end.
