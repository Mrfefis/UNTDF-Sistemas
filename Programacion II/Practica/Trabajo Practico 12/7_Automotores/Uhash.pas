unit Uhash;

interface

	uses Ulista, Uarchivo;

	const
		n = 20;

	type
		Tclave = Ulista.Tclave;
		
		Tvalor = Ulista.Tvalor;

		Tinfo = Ulista.Tinfo;

		Tindice = word;

		// Tabla de hash con direccionamiento cerrado

		Tmapa = array[1..n] of Ulista.Tlista;

	procedure iniciar(var mapa: Tmapa; var archivo: Tarchivo);

	procedure insertar(var mapa: Tmapa; clave: Tclave; valor: Tvalor);

	function buscar(const mapa: Tmapa; clave: Tclave): Tvalor;

implementation

	function modulo(clave: Tclave): Tindice;
	var
		extra: longword;
		i: byte;
	begin
		extra:= 0;
		for i:=1 to 8 do
			extra:= extra*ord(clave[i]);
		extra:= extra mod n;
		modulo:= (extra) + 1;
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

	procedure iniciar(var mapa: Tmapa; var archivo: Tarchivo);
	var
		i: Tindice;
		valor: Telemento;
	begin
		for i:=1 to n do
			Ulista.iniciar(mapa[i]);
		Seek(archivo, 0);
		while not EOF(archivo) do
		begin
			valor:= leer(archivo);
			insertar(mapa, valor.identificacion, FilePos(archivo)-1);
		end;
	end;

	function buscar(const mapa: Tmapa; clave: Tclave): Tvalor;
	var
		pos: Tindice;
		indice: Ulista.Tpuntero;
	begin
		pos:= modulo(clave);
		indice:= Ulista.buscar(mapa[pos], clave);
		if (indice=nil) then
			buscar:= -1
		else
			buscar:= recuperar(indice).valor
	end;

end.