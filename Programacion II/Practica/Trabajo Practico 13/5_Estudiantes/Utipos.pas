unit Utipos;

interface

	type
		Tinfo = record
			numero: integer;
			nombre: string;
			sexo: boolean;
		end;

		TpunteroArbol = ^TnodoArbol;

		TpunteroLista = ^TnodoLista;

		TnodoArbol = record
			info: Tinfo;
			izq, der: TpunteroArbol;
		end;

		TnodoLista = record
			info: TpunteroArbol;
			sig: TpunteroLista;
		end;

	function criterio(info1, info2: Tinfo): boolean;

	function comparar(info1, info2: Tinfo): boolean;

	procedure Imprimir(info: Tinfo);

	procedure Cargar(var info: Tinfo);

implementation

	function criterio(info1, info2: Tinfo): boolean;
	begin
		criterio:= info1.numero>info2.numero;
	end;

	function comparar(info1, info2: Tinfo): boolean;
	begin
		comparar:= info1.numero=info2.numero;
	end;

	procedure Imprimir(info: Tinfo);
	begin
		write('(', info.nombre, ', ', info.numero, ')')
	end;

	procedure Cargar(var info: Tinfo);
	var
		opcion: char;
	begin
		write('Nro: ');
		readln(info.numero);
		write('Nombre: ');
		readln(info.nombre);
		write('Sexo(M, F): ');
		readln(opcion);
		info.sexo:= (opcion='F') or (opcion='f');
	end;

end.