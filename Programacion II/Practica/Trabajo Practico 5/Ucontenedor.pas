unit Ucontenedor;

interface
	
	const
		n = 1000000;
	type
		Telemento = integer;

		Tindice = 0..1000000;

		Tcontenedor = record
			elementos: array[1..n] of Telemento;
			total: Tindice;
		end;

	procedure iniciar(var contenedor: Tcontenedor);

	procedure agregar(var contenedor: Tcontenedor; elemento: Telemento);

	function cantidad(const contenedor: Tcontenedor):Tindice;

	function obtener(const contenedor: Tcontenedor; indice: Tindice): Telemento;

implementation

	procedure iniciar(var contenedor: Tcontenedor);
	begin
		contenedor.total:= 0;
	end;

	procedure agregar(var contenedor: Tcontenedor; elemento: Telemento);
	begin
		inc(contenedor.total);
		contenedor.elementos[contenedor.total]:= elemento;
	end;

	function cantidad(const contenedor: Tcontenedor):Tindice;
	begin
		cantidad:= contenedor.total;
	end;

	function obtener(const contenedor: Tcontenedor; indice: Tindice): Telemento;
	begin
		obtener:= contenedor.elementos[indice];
	end;

end.