unit UlistaDE;

interface

	type

		Tinfo = integer;

		Tindice = ^Tnodo;

		Tnodo = record
			info: Tinfo;
			ant, sig: Tindice;
		end;

		Tlista = Tindice;

	procedure iniciar(var lista: Tlista);

	procedure destruir(var lista: Tlista);

	procedure insertar(var lista: Tlista; info: Tinfo);

	procedure eliminar(var lista: Tlista; var info: Tinfo);

	procedure eliminarElemento(var lista: Tlista; info: Tinfo);

	procedure listar(lista: Tlista);

	procedure listarReves(lista: Tlista);

	function vacia(lista: Tlista): boolean;

	function buscar(lista: Tlista): boolean;

implementation

	procedure iniciar(var lista: Tlista);
	begin
		lista:= nil;
	end;

	procedure destruir(var lista: Tlista);
	var
		aux: Tindice;
	begin
		aux:= lista;
		while (lista<>nil) do
		begin
			lista:= lista^.sig;
			dispose(aux);
			aux:= lista;
		end;
	end;

	procedure insertar(var lista: Tlista; info: Tinfo);
	var
		aux: Tindice;
	begin
		new(aux);
		aux^.info:= info;
		aux^.ant:= nil;
		if (lista=nil) then
			aux^.sig:= nil
		else
		begin
			aux^.sig:= lista;
			lista^.ant:= aux;
		end;
		lista:= aux;
	end;

	procedure eliminar(var lista: Tlista; var info: Tinfo);
	var
		aux: Tindice;
	begin
		aux:= lista;
		if (lista^.sig=nil) then
			lista:= nil
		else
		begin
			lista:= lista^.sig;
			lista^.ant:= nil;
		end;
		info:= aux^.info;
		dispose(aux);
	end;

	procedure eliminarElemento(var lista: Tlista; info: Tinfo);
	var
		aux: Tindice;
	begin
		if (lista^.info=info) then
			eliminar(lista, info)
		else begin
		end
	end;

	procedure listar(lista: Tlista);
	begin
		write('[ ');
		while (lista<>nil) do
		begin
			write(lista^.info, ' ');
			lista:= lista^.sig;
		end;
		writeln(']');
	end;

	procedure listarReves(lista: Tlista);
	begin
		write('[ ');
		if not vacia(lista) then
		begin
			while (lista^.sig<>nil) do
				lista:= lista^.sig;
			while (lista<>nil) do
			begin
				write(lista^.info, ' ');
				lista:= lista^.ant;
			end;
		end;
		writeln(']');
	end;

	function vacia(lista: Tlista): boolean;
	begin
		vacia:= lista=nil;
	end;

	function buscar(lista: Tlista): boolean;
	begin
	end;

end.