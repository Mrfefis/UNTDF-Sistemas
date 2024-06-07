unit Umap;

interface

	uses Ualumno, Uarchivo;
	const
		n = 10;
	type
		Tclave = Ualumno.Tclave;

		Tvalor = integer;

		Tinfo = record
			clave: Tclave;
			valor: Tvalor;
		end;

		Tmapa = array[1..n] of Tinfo;

	procedure iniciar(var mapa: Tmapa; var archivo: Tarchivo);

	procedure insertar(var mapa: Tmapa; clave: Tclave; valor: Tvalor);

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


	// MAPA DE HASH
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

	procedure iniciarMapa(var mapa: Tmapa);
	var
		i: Tindice;
	begin
		for i:=1 to n do
		begin
			mapa[i].clave:= 0;
			mapa[i].valor:= -1;
		end;
	end;

	procedure iniciar(var mapa: Tmapa; var archivo: Tarchivo);
	var
		aux: Talumno;
	begin
		iniciarMapa(mapa);
		Seek(archivo, 0);
		while not EOF(archivo) do
		begin
			read(archivo, aux);
			insertar(mapa, aux.dni, FilePos(archivo)-1);
		end;
	end;

	function buscar(const mapa: Tmapa; clave: Tclave): Tvalor;
	var
		pos: Tindice;
	begin
		pos:= hash(clave);
		while (mapa[pos].clave<>clave) and (mapa[pos].clave<>0) do
			pos:= Rehash(pos);
		buscar:= mapa[pos].valor
	end;
end.