unit UlistaSimple;

interface

	type

		Tinfo = longword;

		Tindice = longword;

		Tpuntero = ^Tnodo;

		Tnodo = record
			info: Tinfo;
			sig: Tpuntero;
		end;

		Tlista = record
			cabeza, fin: Tpuntero;
		end;

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
		lista.cabeza:= nil;
		lista.fin:= nil;
	end;

	procedure destruir(var lista: Tlista);
	var
		aux: Tpuntero;
	begin
		aux:= lista.cabeza;
		while not vacia(lista) do
		begin
			lista.cabeza:= lista.cabeza^.sig;
			dispose(aux);
			aux:= lista.cabeza;
		end;
		lista.fin:= nil;
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
			begin
				aux^.sig:= nil;
				lista.fin:= aux;
			end
			else
				aux^.sig:= lista.cabeza;
			lista.cabeza:= aux;
		end
		else
		begin
			explorador:= lista.cabeza;
			while (explorador^.sig<>nil) and (indice>2) do
			begin
				explorador:= explorador^.sig;
				dec(indice);
			end;
			aux^.sig:= explorador^.sig;
			explorador^.sig:= aux;
			if (explorador=lista.fin) then
				lista.fin:= aux;
		end
	end;

	procedure insertarFinal(var lista: Tlista; info: Tinfo);
	var
		aux: Tpuntero;
	begin
		new(aux);
		aux^.info:= info;
		aux^.sig:= nil;
		if lista.cabeza=nil then
			lista.cabeza:= aux
		else
			lista.fin^.sig:= aux;
		lista.fin:= aux;
	end;

	procedure alterar(var lista: Tlista; indice: Tindice; info: Tinfo);
	var
		aux: Tpuntero;
	begin
		aux:= lista.cabeza;
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
			aux:= lista.cabeza;
			lista.cabeza:= lista.cabeza^.sig;
			if (aux=lista.fin) then
				lista.fin:= nil;
		end
		else
		begin
			explorador:= lista.cabeza;
			while (explorador^.sig<>nil) and (indice>2) do
			begin
				explorador:= explorador^.sig;
				dec(indice);
			end;
			if (explorador^.sig<>nil) then
			begin
				aux:= explorador^.sig;
				explorador^.sig:= aux^.sig;
				if (aux=lista.fin) then
					lista.fin:= explorador;
			end
		end;
		info:= aux^.info;
		dispose(aux);
	end;

	procedure eliminarFinal(var lista: Tlista; var info: Tinfo);
	var
		aux: Tpuntero;
	begin
		aux:= lista.cabeza;
		if (aux^.sig=nil) then
		begin
			info:= lista.cabeza^.info;
			lista.cabeza:= nil;
			lista.fin:= nil;
			dispose(aux);
		end
		else
		begin
			while (aux^.sig^.sig<>nil) do
				aux:= aux^.sig;
			info:= aux^.sig^.info;
			dispose(aux^.sig);
			aux^.sig:= nil;
			lista.fin:= aux;
		end;
	end;

	function vacia(lista: Tlista): boolean;
	begin
		vacia:= lista.cabeza=nil;
	end;

	function recuperar(lista: Tlista; indice: Tindice): Tinfo;
	begin
		while not vacia(lista) and (indice>1) do
		begin
			lista.cabeza:= lista.cabeza^.sig;
			dec(indice);
		end;
		recuperar:= lista.cabeza^.info
	end;

	function buscar(lista: Tlista; info: Tinfo): Tindice;
	begin
		buscar:= 1;
		while not (vacia(lista) or comparar(info,lista.cabeza^.info)) do
		begin
			lista.cabeza:= lista.cabeza^.sig;
			inc(buscar)
		end;
		if vacia(lista) or (not comparar(info,lista.cabeza^.info)) then
			buscar:= 0
	end;

	function longitud(lista: Tlista): Tindice;
	begin
		longitud:= 0;
		while not vacia(lista) do
		begin
			inc(longitud);
			lista.cabeza:= lista.cabeza^.sig;
		end;
	end;

	function Copiar(lista: Tlista): Tlista;
	var
		copia, aux: Tpuntero;
	begin
		if (lista.cabeza<>nil) then
		begin
			new(aux);
			aux^.info:= lista.cabeza^.info;
			copia:= aux;
			lista.cabeza:= lista.cabeza^.sig;
			while (lista.cabeza<>nil) do
			begin
				new(aux^.sig);
				aux^.sig^.info:= lista.cabeza^.info;
				aux:= aux^.sig;
				lista.cabeza:= lista.cabeza^.sig;
			end;
			aux^.sig:= nil;
			Copiar.cabeza:= copia;
			Copiar.fin:= aux;
		end
		else
		begin
			Copiar.cabeza:= nil;
			Copiar.fin:= nil;
		end
	end;

	procedure listar(lista: Tlista);
	begin
		write('[');
		if lista.cabeza<>nil then
		begin
			while lista.cabeza^.sig<>nil do
			begin
				MostrarInfo(lista.cabeza^.info);
				write(', ');
				lista.cabeza:= lista.cabeza^.sig;
			end;
			MostrarInfo(lista.cabeza^.info);
		end;
		writeln(']');
	end;

end.