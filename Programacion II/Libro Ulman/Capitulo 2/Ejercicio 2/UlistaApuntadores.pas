UNIT UlistaApuntadores;

INTERFACE

	type

		Telement = integer;

		Tindex = ^Trec;

		Trec = record
			elemento: Telement;
			sig: Tindex;
		end;

		TlistaApuntadores = record
			cabeza, fin: Tindex;
		end;

	procedure CrearPuntero(var lista: TlistaApuntadores);

IMPLEMENTATION

	procedure CrearPuntero(var lista: TlistaApuntadores);
	begin
		new(lista.cabeza);
		lista.fin:= lista.cabeza
	end;

begin
end.