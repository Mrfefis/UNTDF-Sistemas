unit UlistaInterfaz;

interface
	
	uses UlistaSimple, crt;

	// Muestra la lista
	procedure Imprimir(lista: Tlista);

implementation

	{
		Imprime los elementos de la lista.
		Uso principal para decoración.
	}
	procedure Imprimir(lista: Tlista);
	begin
		write('[');
		Listar(lista);
		writeln(']');
	end;

end.