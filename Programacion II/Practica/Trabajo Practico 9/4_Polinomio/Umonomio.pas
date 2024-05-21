unit Umonomio;

interface
	
	type
		Tmonomio = record
			coeficiente: real;
			exponente: word;
		end;

	function comparar(monomio1, monomio2: Tmonomio): boolean;

	procedure mostrar(monomio: Tmonomio);

implementation

	function comparar(monomio1, monomio2: Tmonomio): boolean;
	begin
		comparar:= (monomio1.coeficiente=monomio2.coeficiente) and (monomio1.exponente=monomio2.exponente);
	end;

	procedure mostrar(monomio: Tmonomio);
	begin
		if (monomio.coeficiente<>0) then
		begin
			write(monomio.coeficiente:0:2);
			if (monomio.exponente=1) then
				write('x')
			else if (monomio.exponente>1) then
				write('x^',monomio.exponente);
		end
	end;

end.