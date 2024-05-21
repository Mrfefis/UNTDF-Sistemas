unit Uinterfaz;

interface

	uses crt, Upila;

	procedure Cargar(var pila: Tpila);

	procedure Imprimir(var pila: Tpila);

implementation

	procedure Cargar(var pila: Tpila);
	var
		elemento: Tinfo;
	begin
		clrscr;
		writeln('Carga de valores enteros');
		writeln('Ingresa 0 para terminar la carga');
		write('Numero: ');
		readln(elemento);
		while (elemento<>0) do
		begin
			Upila.insertar(pila, elemento);
			write('Numero: ');
			readln(elemento);
		end;
	end;

	procedure Copiar(var origen, destino: Tpila);
	var
		elemento: Tinfo;
		aux: Tpila;
	begin
		Invertir(origen);
		Upila.iniciar(aux);
		while not Upila.vacia(origen) do
		begin
			Upila.eliminar(origen, elemento);
			Upila.insertar(destino, elemento);
			Upila.insertar(aux, elemento);
		end;
		origen:= aux;
	end;

	procedure Imprimir(var pila: Tpila);
	var
		elemento: Tinfo;
		aux: Tpila;
	begin
		Upila.iniciar(aux);
		Copiar(pila, aux);
		while not Upila.vacia(aux) do
		begin
			Upila.eliminar(aux, elemento);
			write(elemento, ' ');
		end;
		writeln;
	end;

end.