UNIT UlistaArreglo;

INTERFACE

	const
		n = 100;
	type
		Telemento = integer;

		Tindice = integer;

		Tlista = record
			elementos: array[1..n] of Telemento;
			fin: Tindice;
		end;

	procedure crear(var lista: Tlista);

	procedure agregar(var lista: Tlista; indice: Tindice; elemento: Telemento);

	procedure eliminar(var lista: Tlista; indice: Tindice);

	function recuperar(var lista: Tlista; indice: Tindice): Telemento;

	function localizar(var lista: Tlista; elemento: Telemento): Tindice;

	function primero(var lista: Tlista): Tindice;

	function siguiente(indice: Tindice): Tindice;

	function fin(var lista: Tlista): Tindice;

IMPLEMENTATION

	procedure crear(var lista: Tlista);
	begin
		lista.fin:= 1;
	end;

	procedure agregar(var lista: Tlista; indice: Tindice; elemento: Telemento);
	var
		i: Tindice;
	begin
		if (lista.fin>=n) then
			writeln('Error(Agregar): Lista llena')
		else begin
			for i:= lista.fin-1 downto indice do
				lista.elementos[i+1]:= lista.elementos[i];
			inc(lista.fin);
			lista.elementos[indice]:= elemento;
		end
	end;

	procedure eliminar(var lista: Tlista; indice: Tindice);
	var
		i: Tindice;
	begin
		if (indice<1) or (indice>lista.fin) then
			writeln('Error(Eliminar): La posicion no existe')
		else begin
			dec(lista.fin);
			for i:= indice to lista.fin-1 do begin
				lista.elementos[i]:= lista.elementos[i+1]
			end
		end
	end;

	function recuperar(var lista: Tlista; indice: Tindice): Telemento;
	begin
		if (indice<1) or (indice>=lista.fin) then
			writeln('Error(Recuperar): La posicion no existe')
		else recuperar:= lista.elementos[indice]
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
		if encontrado then localizar:= i
		else localizar:= -1
	end;

	function primero(var lista: Tlista): Tindice;
	begin
		primero:= 1;
	end;

	function siguiente(indice: Tindice): Tindice;
	begin
		siguiente:= indice + 1;
	end;

	function fin(var lista: Tlista): Tindice;
	begin
		fin:= lista.fin;
	end;

begin
end.