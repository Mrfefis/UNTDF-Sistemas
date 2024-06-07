unit UlistaOrdenada;

interface

	uses Utipos;

	type
		Tpuntero = Utipos.TpunteroLista;

		Tinfo = Utipos.TpunteroArbol;

		Tlista = Tpuntero;

	procedure iniciar(var lista: Tlista);

	procedure insertar(var lista: Tlista; info: Tinfo);

	procedure listar(lista: Tlista);

implementation

	procedure iniciar(var lista: Tlista);
	begin
		lista:
	end;

	procedure insertar(var lista: Tlista; info: Tinfo);

	procedure listar(lista: Tlista);

end.