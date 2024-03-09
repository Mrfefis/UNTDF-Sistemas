UNIT UlistaCursores;

INTERFACE
	
	const
		n = 100;
	type
		TelementoC = integer;

		TindiceC = integer;

		TlistaCursores = TindiceC;

		Trec = record
			elemento: TelementoC;
			sig: TindiceC;
		end;

	procedure crearcursor(var lista: TlistaCursores);

IMPLEMENTATION

	var
		ESPACIOS: array[1..n] of Trec;
		disponible: TindiceC;

	procedure crearcursor(var lista: TlistaCursores);
	begin
		lista:= 0;
	end;

begin
	disponible:= 0;
end.