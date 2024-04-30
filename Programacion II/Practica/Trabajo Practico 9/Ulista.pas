unit Ulista;

interface

	type

		Telemento = integer;

		Tposicion = 0..9999999999999999;

		Tlista = ^Tnodo;

		Tnodo = record
			elemento: Telemento;
			sig: Tlista;
		end;

	procedure crear(var lista: Tlista);

	procedure insertar_inicio(var lista: Tlista; elemento: Telemento);

	procedure insertar_final(var lista: Tlista; elemento: Telemento);

	function recuperar(lista: Tlista; posicion: Tposicion): Telemento;

	function length(lista: Tlista): Tposicion;

	function vacia(lista: Tlista): boolean;

implementation

	procedure crear(var lista: Tlista);
	begin
		lista:= NIL;
	end;

	procedure insertar_inicio(var lista: Tlista; elemento: Telemento);
	var
		nodo: Tlista;
	begin
		new(nodo);
		nodo^.elemento:= elemento;
		if lista=NIL then
			nodo^.sig:= NIL
		else
			nodo^.sig:= lista;
		lista:= nodo;
	end;

	procedure insertar_final(var lista: Tlista; elemento: Telemento);
	begin
		if lista=NIL then begin
			new(lista);
			lista^.elemento:= elemento;
			lista^.sig:= NIL;
		end
		else
			insertar_final(lista^.sig, elemento);
	end;

	function recuperar(lista: Tlista; posicion: Tposicion): Telemento;
	begin
		while not vacia(lista) and (posicion>1) do begin
			lista:= lista^.sig;
			dec(posicion)
		end;
		if not vacia(lista) then
			recuperar:= lista^.elemento
		else
			recuperar:= 0;
	end;

	function length(lista: Tlista): Tposicion;
	begin
		length:= 0;
		while not vacia(lista) do begin
			inc(length);
			lista:= lista^.sig;
		end;
	end;

	function vacia(lista: Tlista): boolean;
	begin
		vacia:= lista=NIL
	end;

end.