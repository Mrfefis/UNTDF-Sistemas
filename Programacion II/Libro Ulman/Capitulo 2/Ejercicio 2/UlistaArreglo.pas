UNIT UlistaArreglo;

INTERFACE

	const
		n = 100;
	type
		Telemento = integer;

		Tindice = integer;

		TlistaArreglo = record
			elementos: array[1..n] of Telemento;
			fin: Tindice;
		end;

	procedure creararreglo(var lista: TlistaArreglo);

	procedure agregar(var lista: TlistaArreglo; indice: Tindice; elemento: Telemento);

	function primero(lista: TlistaArreglo): Tindice;

	function siguiente(indice: Tindice): Tindice;

IMPLEMENTATION

	procedure creararreglo(var lista: TlistaArreglo);
	begin
		lista.fin:= 1;
	end;

	procedure agregar(var lista: TlistaArreglo; indice: Tindice; elemento: Telemento);
	var
		i: Tindice;
	begin
		for i:= lista.fin to indice do
			lista.elementos[i]:= lista.elementos[i-1];
		inc(lista.fin);
		lista.elementos[indice]:= elemento;
	end;

	function primero(lista: TlistaArreglo): Tindice;
	begin
		primero:= 1;
	end;

	function siguiente(indice: Tindice): Tindice;
	begin
		siguiente:= indice + 1;
	end;

	function fin(lista: TlistaArreglo): Tindice;
	begin
		fin:= lista.fin;
	end;

begin
end.