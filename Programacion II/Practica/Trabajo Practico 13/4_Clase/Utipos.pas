unit Utipos;

interface

	type
		Tinfo = record
			promedio: integer;
			nombre: string;
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

implementation

	function criterio(info1, info2: Tinfo): boolean;
	begin
		criterio:= info1.promedio<info2.promedio;
	end;

	function comparar(info1, info2: Tinfo): boolean;
	begin
		comparar:= info1.promedio=info2.promedio;
	end;

	procedure Imprimir(info: Tinfo);
	begin
		write('(', info.nombre, ', ', info.promedio, ')')
	end;

end.