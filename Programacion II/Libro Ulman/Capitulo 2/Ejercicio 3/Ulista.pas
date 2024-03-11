UNIT Ulista;

INTERFACE

	type

		Telemento = integer;

		Tindice = ^Trec;

		Trec = record
			elemento: Telemento;
			sig: Tindice;
		end;

		Tlista = record
			cabeza, fin: Tindice;
		end;

	procedure crear(var lista: Tlista);

	procedure agregar(var lista: Tlista; indice: Tindice; elemento: Telemento);

	procedure eliminar(var lista: Tlista; indice: Tindice);

	function recuperar(var lista: Tlista; indice: Tindice): Telemento;

	function localizar(var lista: Tlista; elemento: Telemento): Tindice;

	function primero(lista: Tlista): Tindice;

	function anterior(lista: Tlista; indice: Tindice): Tindice;

	function siguiente(indice: Tindice): Tindice;

	function fin(lista: Tlista): Tindice;

	procedure MostrarLista(lista: Tlista);

IMPLEMENTATION

	procedure crear(var lista: Tlista);
	begin
		new(lista.cabeza);
		lista.cabeza^.sig:= NIL;
		lista.fin:= lista.cabeza
	end;

	procedure agregar(var lista: Tlista; indice: Tindice; elemento: Telemento);
	var
		aux: Tindice;
	begin
		new(aux);
		aux^.elemento:= elemento;
		aux^.sig:= indice^.sig;
		indice^.sig:= aux;
		if (lista.fin=indice) then
			lista.fin:= aux;
	end;

	procedure eliminar(var lista: Tlista; indice: Tindice);
	var
		aux: Tindice;
	begin
		if (lista.cabeza=lista.fin) then
			writeln('Error(Eliminar): La lista esta vacia o no existe')
		else if (indice=lista.fin) then begin
			lista.fin:= anterior(lista, lista.fin);
			lista.fin^.sig:= NIL;
			dispose(indice);
			indice:= lista.fin;
		end
		else if (indice^.sig=lista.fin) then begin
			indice^.sig:= NIL;
			dispose(lista.fin);
			lista.fin:= indice;
		end
		else begin
			aux:= indice^.sig;
			indice^.sig:= indice^.sig^.sig;
			dispose(aux)
		end;
	end;

	function recuperar(var lista: Tlista; indice: Tindice): Telemento;
	begin
		if (indice=lista.fin) then
			writeln('Error(Recuperar): La posicion no existe')
		else recuperar:= indice^.sig^.elemento;
	end;

	function localizar(var lista: Tlista; elemento: Telemento): Tindice;
	var
		i: Tindice;
		encontrado: boolean;
	begin
		i:= primero(lista);
		encontrado:= false;
		while (i<>fin(lista)) and not encontrado do begin
			if (recuperar(lista, i)=elemento) then
				encontrado:= true
			else i:= siguiente(i)
		end;
		localizar:= i
	end;

	function primero(lista: Tlista): Tindice;
	begin
		primero:= lista.cabeza;
	end;

	function anterior(lista: Tlista; indice: Tindice): Tindice;
	var
		i: Tindice;
		encontrado: boolean;
	begin
		i:= primero(lista);
		encontrado:= false;
		while (i<>fin(lista)) and not encontrado do begin
			if (siguiente(i)=indice) then
				encontrado:= true
			else i:= siguiente(i)
		end;
		if encontrado then anterior:= i
		else anterior:= NIL
	end;

	function siguiente(indice: Tindice): Tindice;
	begin
		siguiente:= indice^.sig;
	end;

	function fin(lista: Tlista): Tindice;
	begin
		fin:= lista.fin;
	end;

	procedure MostrarLista(lista: Tlista);
	var
		i: Tindice;
	begin
		write('Lista: ');
		write('[');
		i:= primero(lista);
		if (i<>fin(lista)) then begin
			while (siguiente(i)<>fin(lista)) do begin
				write(recuperar(lista, i), ', ');
				i:= siguiente(i)
			end;
			write(recuperar(lista, i))
		end;
		writeln(']');
	end;

begin
end.