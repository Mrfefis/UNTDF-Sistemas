unit Utipos;

interface

	type
		Tinfo = string[3];

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