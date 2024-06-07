unit Uhash;

interface

	const
		n = 1000;
	type
		Tclave = 0..5000000000000;
		Tvalor = 0..5000000000000;
		Tindice = longword;

		// Tabla de hash con direccionamiento abierto

		Tmapa = record
			elementos: array[1..n] of Tvalor;
			funcionHash: char;
		end;

	procedure iniciar(var mapa: Tmapa; tipo: char);

	procedure insertar(var mapa: Tmapa; clave: Tclave; valor: Tvalor);

	function buscar(const mapa: Tmapa; clave: Tclave): Tvalor;

	procedure listar(const mapa: Tmapa);

implementation

	function modulo(clave: Tclave): Tindice;
	begin
		modulo:= (clave mod n) + 1;
	end;

	function cuadrado(clave: Tclave): Tindice;
	begin
		cuadrado:= ((clave*clave)) mod n + 1;
	end;

	function plegamiento(clave: Tclave): Tindice;
	var
		digitos: Tclave;
	begin
		digitos:= clave;
		while ((digitos div 10000)>0) do
			digitos:= digitos div 10000;
		plegamiento:= modulo(digitos);
	end;

	function truncamiento(clave: Tclave): Tindice;
	begin
		truncamiento:= modulo(clave div 100);
	end;

	procedure iniciar(var mapa: Tmapa; tipo: char);
	var
		i: Tindice;
	begin
		for i:=1 to n do
			mapa.elementos[i]:= 0;
		mapa.funcionHash:= tipo;
	end;

	procedure insertar(var mapa: Tmapa; clave: Tclave; valor: Tvalor);
	var
		pos: Tclave;
	begin
		case mapa.funcionHash of
			'c': pos:= cuadrado(clave);
			'p': pos:= plegamiento(clave);
			't': pos:= truncamiento(clave);
			else pos:= modulo(clave);
		end;
		while (mapa.elementos[pos]<>0) do
			case mapa.funcionHash of
				'c': pos:= cuadrado(pos+1);
				'p': pos:= plegamiento(pos+1);
				't': pos:= truncamiento(pos+1);
				else pos:= modulo(pos+1);
			end;
		mapa.elementos[pos]:= valor;
	end;

	function buscar(const mapa: Tmapa; clave: Tclave): Tvalor;
	var
		pos: Tclave;
	begin
		case mapa.funcionHash of
			'c': pos:= cuadrado(clave);
			'p': pos:= plegamiento(clave);
			't': pos:= truncamiento(clave);
			else pos:= modulo(clave);
		end;
		while (mapa.elementos[pos]<>clave) and (mapa.elementos[pos]<>0) do
				case mapa.funcionHash of
				'c': pos:= cuadrado(pos+1);
				'p': pos:= plegamiento(pos+1);
				't': pos:= truncamiento(pos+1);
				else pos:= modulo(pos+1);
			end;
		if (mapa.elementos[pos]=0) then
			buscar:= 0
		else
			buscar:= mapa.elementos[pos];
	end;

	procedure listar(const mapa: Tmapa);
	var
		i: integer;
	begin
		for i:=1 to n do
			write(mapa.elementos[i], ' ')
	end;

end.