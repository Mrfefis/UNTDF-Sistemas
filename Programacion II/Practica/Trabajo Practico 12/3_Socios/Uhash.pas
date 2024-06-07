unit Uhash;

interface

	uses Ulista;

	const
		n = 25;

	type
		Tclave = Ulista.Tclave;
		
		Tvalor = Ulista.Tvalor;

		Tinfo = Ulista.Tinfo;

		Tindice = word;

		// Tabla de hash con direccionamiento cerrado

		Tmapa = array[1..n] of Ulista.Tlista;

	procedure iniciar(var mapa: Tmapa);

	procedure insertar(var mapa: Tmapa; clave: Tclave; valor: Tvalor);

	procedure imprimir(const mapa: Tmapa);

	procedure imprimirSinonimos(var mapa: Tmapa; clave: Tclave);

	function buscar(const mapa: Tmapa; clave: Tclave): Tvalor;

implementation

	function modulo(clave: Tclave): Tindice;
	var
		extra: longword;
	begin
		extra:= clave*clave;
		extra:= extra mod n;
		modulo:= (extra) + 1;
	end;

	procedure iniciar(var mapa: Tmapa);
	var
		i: Tindice;
	begin
		for i:=1 to n do
			Ulista.iniciar(mapa[i]);
	end;

	procedure insertar(var mapa: Tmapa; clave: Tclave; valor: Tvalor);
	var
		pos: Tindice;
		aux: Tinfo;
	begin
		aux.clave:= clave;
		aux.valor:= valor;
		pos:= modulo(clave);
		Ulista.insertar(mapa[pos], aux);
	end;

	procedure imprimir(const mapa: Tmapa);
	var
		i: integer;
	begin
		for i:=1 to n do
		begin
			write(i, '- ');
			Ulista.imprimir(mapa[i]);
		end
	end;

	procedure imprimirSinonimos(var mapa: Tmapa; clave: Tclave);
	var
		pos: Tindice;
	begin
		pos:= modulo(clave);
		if not Ulista.vacia(mapa[pos]) then
		begin
			Ulista.imprimir(mapa[pos]);
			readln
		end
	end;

	function buscar(const mapa: Tmapa; clave: Tclave): Tvalor;
	var
		pos: Tindice;
		indice: Ulista.Tpuntero;
	begin
		pos:= modulo(clave);
		indice:= Ulista.buscar(mapa[pos], clave);
		if (indice=nil) then
			buscar:= ''
		else
			buscar:= recuperar(indice).valor
	end;

end.