unit Ulist;

interface

	type

		Telement = integer;

		Tposicion = longword;

		Tlist = ^Tnode;

		Tnode = record
			element: Telement;
			next: Tlist;
		end;

	procedure create(var list: Tlist);

	procedure appfirst(var list: Tlist; element: Telement);

	procedure append(var list: Tlist; element: Telement);

	procedure popfirst(var list: Tlist; var element: Telement);

	function recuperate(list: Tlist; posicion: Tposicion): Telement;

	procedure mostrar(lista: Tlist);

	function search(list: Tlist; element: Telement): Tposicion;

	function length(list: Tlist): Tposicion;

	function empty(list: Tlist): boolean;

implementation

	procedure create(var list: Tlist);
	var
		aux: Tlist;
	begin
		aux:= list;
		while not empty(list) do
		begin
			list:= list^.next;
			dispose(aux);
			aux:= list;
		end
	end;

	procedure appfirst(var list: Tlist; element: Telement);
	var
		aux: Tlist;
	begin
		new(aux);
		aux^.element:= element;
		if list=NIL then
			aux^.next:= NIL
		else
			aux^.next:= list;
		list:= aux;
	end;

	procedure append(var list: Tlist; element: Telement);
	var
		aux: Tlist;
	begin
		if empty(list) then
			appfirst(list, element)
		else begin
			aux:= list;
			while aux^.next<>NIL do
			begin
				aux:= aux^.next;
			end;
			new(aux^.next);
			aux^.next^.element:= element;
			aux^.next^.next:= NIL;
		end
	end;

	procedure popfirst(var list: Tlist; var element: Telement);
	var
		aux: Tlist;
	begin
		aux:= list;
		list:= list^.next;
		element:= aux^.element;
		dispose(aux);
	end;

	procedure mostrar(lista: Tlist);
	begin
		while lista<>NIL do begin
			writeln(lista^.element);
			lista:= lista^.next;
		end
	end;

	function recuperate(list: Tlist; posicion: Tposicion): Telement;
	begin
		while not empty(list) and (posicion>1) do begin
			list:= list^.next;
			dec(posicion)
		end;
		if not empty(list) then
			recuperate:= list^.element
		else
			recuperate:= 0;
	end;

	function search(list: Tlist; element: Telement): Tposicion;
	var
		found: boolean;
	begin
		search:= 1;
		found:= false;
		while not empty(list) and not found do begin
			if list^.element=element then
			begin
				search:= element;
				found:= true
			end
			else
			begin
				list:= list^.next;
				inc(search)
			end
		end;
		if not found then
			search:= 0;
	end;

	function length(list: Tlist): Tposicion;
	begin
		length:= 0;
		while not empty(list) do begin
			inc(length);
			list:= list^.next;
		end;
	end;

	function empty(list: Tlist): boolean;
	begin
		empty:= list=NIL
	end;

end.