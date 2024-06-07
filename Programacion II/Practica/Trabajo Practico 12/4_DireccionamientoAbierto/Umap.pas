unit Umap;

interface

	const
		n = 20;
	type
		Tclave = longint;
		Tvalor = string;
		Tinfo = record
			clave: Tclave;
			valor: Tvalor;
		end;
		Tmapa = array[1..n] of Tinfo;

	procedure iniciar(var mapa: Tmapa);

	procedure insertar(var mapa: Tmapa; clave: Tclave; valor: Tvalor);

	procedure imprimir(const mapa: Tmapa);

	function buscar(const mapa: Tmapa; clave: Tclave): Tvalor;

implementation

	type
		Tindice = word;


	function hash(clave: Tclave): Tindice;
	begin
		hash:= clave mod n + 1;
	end;

	function Rehash(clave: Tclave): Tindice;
	begin
		Rehash:= hash(clave+3);
	end;

	procedure iniciar(var mapa: Tmapa);
	var
		i: Tindice;
	begin
		for i:=1 to n do
		begin
			mapa[i].clave:= 0;
			mapa[i].valor:= '';
		end
	end;

	procedure insertar(var mapa: Tmapa; clave: Tclave; valor: Tvalor);
	var
		pos: Tindice;
	begin
		pos:= hash(clave);
		while (mapa[pos].clave<>0) do
			pos:= Rehash(pos);
		mapa[pos].clave:= clave;
		mapa[pos].valor:= valor;
	end;

	procedure imprimir(const mapa: Tmapa);
	var
		i: Tindice;
	begin
		for i:=1 to n do
			writeln(i, '- [', mapa[i].clave, ', ', mapa[i].valor,']');
	end;

	function buscar(const mapa: Tmapa; clave: Tclave): Tvalor;
	var
		pos: Tindice;
	begin
		pos:= hash(clave);
		while (mapa[pos].clave<>clave) do
			pos:= Rehash(pos);
		buscar:= mapa[pos].valor
	end;
end.