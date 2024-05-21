unit Ulista;

interface

	type

		Tinfo = integer;

		Tindice = longword;

		Tpuntero = ^Tnodo;

		Tnodo = record
			info: Tinfo;
			sig: Tpuntero;
		end;

		Tlista = Tpuntero;

	procedure iniciar(var lista: Tlista);

	procedure destruir(var lista: Tlista);

	procedure insertar(var lista: Tlista; info: Tinfo);

	procedure eliminar(var lista: Tlista; var info: Tinfo);

	function vacia(lista: Tlista): boolean;

	function buscar(lista: Tlista; info: Tinfo): boolean;

	function longitud(lista: Tlista): Tindice;
	
	function Copiar(lista: Tlista): Tlista;

	procedure listar(lista: Tlista);

implementation

	function comparar(info1, info2: Tinfo): boolean;
	begin
		comparar:= info1 = info2
	end;

	procedure MostrarInfo(info: Tinfo);
	begin
		write(info);
	end;

	procedure iniciar(var lista: Tlista);
	begin
		lista:= nil;
	end;

	procedure destruir(var lista: Tlista);
	var
		aux: Tpuntero;
	begin
		aux:= lista;
		while (lista<>nil) do
		begin
			lista:= lista^.sig;
			dispose(aux);
			aux:= lista;
		end;
		lista:= nil
	end;

	procedure insertar(var lista: Tlista; info: Tinfo);
	var
		aux: Tpuntero;
	begin
		new(aux);
		aux^.info:= info;
		if vacia(lista) then
			aux^.sig:= nil
		else
			aux^.sig:= lista;
		lista:= aux;
	end;

	procedure eliminar(var lista: Tlista; var info: Tinfo);
	var
		aux: Tpuntero;
	begin
		aux:= lista;
		lista:= lista^.sig;
		info:= aux^.info;
		dispose(aux);
	end;

	function vacia(lista: Tlista): boolean;
	begin
		vacia:= lista=nil;
	end;

	function buscar(lista: Tlista; info: Tinfo): boolean;
	begin
		while not (vacia(lista) or comparar(info,lista^.info)) do
			lista:= lista^.sig;
		if vacia(lista) or (not comparar(info,lista^.info)) then
			buscar:= false
		else
			buscar:= true
	end;

	function longitud(lista: Tlista): Tindice;
	begin
		longitud:= 0;
		while not vacia(lista) do
		begin
			inc(longitud);
			lista:= lista^.sig;
		end;
	end;

	function Copiar(lista: Tlista): Tlista;
	var
		aux: Tpuntero;
	begin
		Copiar:= nil;
		if (lista<>nil) then
		begin
			new(aux);
			aux^.info:= lista^.info;
			Copiar:= aux;
			lista:= lista^.sig;
			while (lista<>nil) do
			begin
				new(aux^.sig);
				aux^.sig^.info:= lista^.info;
				aux:= aux^.sig;
				lista:= lista^.sig;
			end;
			aux^.sig:= nil;
		end
		else
			Copiar:= nil;
	end;

	procedure listar(lista: Tlista);
	begin
		write('[ ');
		if lista<>nil then
		begin
			while lista<>nil do
			begin
				MostrarInfo(lista^.info);
				write(' ');
				lista:= lista^.sig;
			end;
		end;
		writeln(']');
	end;

end.