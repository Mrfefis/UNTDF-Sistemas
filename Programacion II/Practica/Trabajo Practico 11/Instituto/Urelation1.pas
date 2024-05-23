unit Urelation1;

interface

	uses Umultilist, Udatos;

	type

		Telement = Umultilist.Trelation1;

		Tindice = Umultilist.Trelation1List;

		Tlist = Umultilist.Trelation1List;

		Tfile = File of Telement;

	procedure init(var list: Tlist; archivo: string);

	procedure free(var list: Tlist; archivo: string);

	procedure add(var list: Tlist; element: Telement);

	procedure delete(var list: Tlist; var element: Telement);

	procedure Listar(list: Tlist);

	function empty(list: Tlist): boolean;

	function search(list: Tlist; element: Telement): Tindice;

	function recuperate(list: Tlist): Telement;

implementation

	procedure OpenFile(var archivo: Tfile; nombre: string);
	begin
		Assign(archivo, nombre);
		{$I-}
		Reset(archivo);
		{$I+}
		if IOresult<>0 then
			Rewrite(archivo);
	end;

	procedure init(var list: Tlist; archivo: string);
	var
		contenedor: Tfile;
		element: Telement;
	begin
		list:= nil;
		OpenFile(contenedor, archivo);
		while not EOF(contenedor) do
		begin
			read(contenedor, element);
			add(list, element);
		end;
		Close(contenedor);
	end;

	procedure free(var list: Tlist; archivo: string);
	var
		contenedor: Tfile;
		aux: Tlist;
	begin
		aux:= list;
		Assign(contenedor, archivo);
		Rewrite(contenedor);
		while (list<>nil) do
		begin
			list:= list^.next;
			write(contenedor, aux^.element);
			dispose(aux);
			aux:= list;
		end;
		dispose(aux);
		Close(contenedor);
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

	procedure Listar(list: Tlist);
	begin
		while (list<>nil) do
		begin
			MostrarAlumno(list^.element);
			list:= list^.next;
		end;
	end;

	function empty(list: Tlist): boolean;
	begin
		empty:= list=nil;
	end;

	function search(list: Tlist; element: Telement): Tindice;
	begin
		while (list<>nil) and (list^.element.dni<>element.dni) do
			list:= list^.next;
		search:= list;
	end;

	function recuperate(list: Tlist): Telement;
	begin
		recuperate:= list^.element;
	end;

end.