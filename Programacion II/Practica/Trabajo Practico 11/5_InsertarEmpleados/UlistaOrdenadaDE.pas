unit UlistaOrdenadaDE;

interface

	type

		Templeado = record
			nombre: string;
			nro: integer;
		end;

		Tinfo = Templeado;

		Tpuntero = ^Tnodo;

		Tnodo = record
			info: Tinfo;
			ant, sig: Tpuntero;
		end;

		Tlista = record
			cabeza, fin: Tpuntero;
		end;

	procedure iniciar(var lista: Tlista);

	procedure destruir(var lista: Tlista);

	procedure insertar(var lista: Tlista; info: Tinfo);

	procedure listar(lista: Tlista);

	function vacia(lista: Tlista): boolean;

implementation

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
		while (lista.cabeza<>nil) do
		begin
			lista.cabeza:= lista.cabeza^.sig;
			dispose(aux);
			aux:= lista.cabeza;
		end;
		lista.fin:= nil;
	end;

	function criterio(empleado1, empleado2: Templeado): boolean;
	begin
		criterio:= empleado1.nro<empleado2.nro;
	end;

	procedure insertar(var lista: Tlista; info: Tinfo);
	var
		viajero, nodo: Tpuntero;
	begin
		new(nodo);
		nodo^.info:= info;
		if (lista.cabeza=nil) then
		begin
			nodo^.sig:= nil;
			nodo^.ant:= nil;
			lista.cabeza:= nodo;
			lista.fin:= nodo;
		end
		else
		begin
			viajero:= lista.cabeza;
			while (viajero<>nil) and criterio(viajero^.info, info) do
				viajero:= viajero^.sig;
			if (viajero=nil) then
			begin
				nodo^.sig:= nil;
				nodo^.ant:= lista.fin;
				lista.fin^.sig:= nodo;
				lista.fin:= nodo;
			end
			else
			begin
				nodo^.ant:= viajero^.ant;
				nodo^.sig:= viajero;
				if (viajero^.ant<>nil) then
					viajero^.ant^.sig:= nodo
				else
					lista.cabeza:= nodo;
				viajero^.ant:= nodo;
			end
		end
	end;

	procedure Mostrar(empleado: Templeado);
	begin
		writeln('Nombre: ', empleado.nombre, '  ', 'codigo: ', empleado.nro);
	end;

	procedure listar(lista: Tlista);
	begin
		while (lista.cabeza<>nil) do
		begin
			Mostrar(lista.cabeza^.info);
			writeln('-----------------------------------');
			lista.cabeza:= lista.cabeza^.sig;
		end;
	end;

	function vacia(lista: Tlista): boolean;
	begin
		vacia:= lista.cabeza=nil;
	end;

end.