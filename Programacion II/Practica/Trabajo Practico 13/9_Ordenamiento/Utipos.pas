unit Utipos;

interface

	type
		Tinfo = record
			nombre: string[20];
			documento: longword;
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

implementation

end.