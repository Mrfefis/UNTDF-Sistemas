unit Urelation2;

interface

	uses Umultilist;

	type

		Telement = Umultilist.Trelation2;

		Tlist = Umultilist.Trelation2List;

	procedure init(var list: Tlist);

	procedure free(var list: Tlist);

	procedure add(var list: Tlist; element: Telement);

	procedure delete(var list: Tlist; var element: Telement);

	function empty(list: Tlist): boolean;

	function search(list: Tlist; element: Telement): Tlist;

	function recuperate(list: Tlist): Telement;

implementation

	procedure init(var list: Tlist);
	begin
		list:= nil;
	end;

	procedure free(var list: Tlist);
	var
		aux: Tlist;
	begin
		aux:= list;
		while (list<>nil) do
		begin
			list:= list^.next;
			dispose(aux);
			aux:= list;
		end
	end;

	procedure add(var list: Tlist; element: Telement);
	var
		aux: Tlist;
	begin
		new(aux);
		aux^.element:= element;
		aux^.multilist:= nil;
		if (list=nil) then
			aux^.next:= nil
		else
			aux^.next:= list;
		list:= aux;
	end;

	procedure delete(var list: Tlist; var element: Telement);
	var
		aux: Tlist;
	begin
		aux:= list;
		list:= list^.next;
		element:= aux^.element;
		dispose(aux);
	end;

	function empty(list: Tlist): boolean;
	begin
		empty:= list=nil;
	end;

	function search(list: Tlist; element: Telement): Tlist;
	begin
		while (list<>nil) and (list^.element<>element) do
			list:= list^.next;
		search:= list;
	end;

	function recuperate(list: Tlist): Telement;
	begin
		recuperate:= list^.element;
	end;

end.