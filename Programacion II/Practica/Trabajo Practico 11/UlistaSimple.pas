unit UlistaSimple;

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

	procedure insertar(var lista: Tlista; indice: Tindice; info: Tinfo);

	procedure insertarFinal(var lista: Tlista; info: Tinfo);

	procedure alterar(var lista: Tlista; indice: Tindice; info: Tinfo);

	procedure eliminar(var lista: Tlista; indice: Tindice; var info: Tinfo);

	procedure eliminarFinal(var lista: Tlista; var info: Tinfo);

	function vacia(lista: Tlista): boolean;

	function recuperar(lista: Tlista; indice: Tindice): Tinfo;

	function buscar(lista: Tlista; info: Tinfo): Tindice;

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
		while not vacia(lista) do
		begin
			lista:= lista^.sig;
			dispose(aux);
			aux:= lista;
		end
	end;

	procedure insertar(var lista: Tlista; indice: Tindice; info: Tinfo);
	var
		aux, explorador: Tpuntero;
	begin
		new(aux);
		aux^.info:= info;
		if (indice=1) then
		begin
			if vacia(lista) then
				aux^.sig:= nil
			else
				aux^.sig:= lista;
			lista:= aux;
		end
		else
		begin
			explorador:= lista;
			while (explorador^.sig<>nil) and (indice>2) do
			begin
				explorador:= explorador^.sig;
				dec(indice);
			end;
			aux^.sig:= explorador^.sig;
			explorador^.sig:= aux;
		end
	end;

	procedure insertarFinal(var lista: Tlista; info: Tinfo);
	var
		aux: Tpuntero;
	begin
		if lista=nil then
		begin
			new(lista);
			lista^.sig:= nil;
			lista^.info:= info;
		end
		else
		begin
			aux:= lista;
			while (aux^.sig<>nil) do
				aux:= aux^.sig;
			new(aux^.sig);
			aux^.sig^.sig:= nil;
			aux^.sig^.info:= info;
		end
	end;

	procedure alterar(var lista: Tlista; indice: Tindice; info: Tinfo);
	var
		aux: Tpuntero;
	begin
		aux:= lista;
		while (aux^.sig<>nil) and (indice>1) do
		begin
			aux:= aux^.sig;
			dec(indice);
		end;
		if (indice=1) then
			aux^.info:= info;
	end;

	procedure eliminar(var lista: Tlista; indice: Tindice; var info: Tinfo);
	var
		aux, explorador: Tpuntero;
	begin
		if (indice=1) then
		begin
			aux:= lista;
			lista:= lista^.sig;
		end
		else
		begin
			explorador:= lista;
			while (explorador^.sig<>nil) and (indice>2) do
			begin
				explorador:= explorador^.sig;
				dec(indice);
			end;
			if (explorador^.sig<>nil) then
			begin
				aux:= explorador^.sig;
				explorador^.sig:= aux^.sig;
			end
		end;
		info:= aux^.info;
		dispose(aux);
	end;

	procedure eliminarFinal(var lista: Tlista; var info: Tinfo);
	var
		aux: Tpuntero;
	begin
		aux:= lista;
		if (aux^.sig=nil) then
		begin
			info:= lista^.info;
			lista:= nil;
			dispose(aux);
		end
		else
		begin
			while (aux^.sig^.sig<>nil) do
				aux:= aux^.sig;
			info:= aux^.sig^.info;
			dispose(aux^.sig);
			aux^.sig:= nil;
		end;
	end;

	function vacia(lista: Tlista): boolean;
	begin
		vacia:= lista=nil;
	end;

	function recuperar(lista: Tlista; indice: Tindice): Tinfo;
	begin
		while not vacia(lista) and (indice>1) do
		begin
			lista:= lista^.sig;
			dec(indice);
		end;
		recuperar:= lista^.info
	end;

	function buscar(lista: Tlista; info: Tinfo): Tindice;
	begin
		buscar:= 1;
		while not (vacia(lista) or comparar(info,lista^.info)) do
		begin
			lista:= lista^.sig;
			inc(buscar)
		end;
		if vacia(lista) or (not comparar(info,lista^.info)) then
			buscar:= 0
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
		write('[');
		if lista<>nil then
		begin
			while lista^.sig<>nil do
			begin
				MostrarInfo(lista^.info);
				write(', ');
				lista:= lista^.sig;
			end;
			MostrarInfo(lista^.info);
		end;
		writeln(']');
	end;

end.