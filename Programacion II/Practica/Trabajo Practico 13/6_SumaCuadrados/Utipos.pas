unit Utipos;

interface

	type
		Tinfo = integer;

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

implementation

end.