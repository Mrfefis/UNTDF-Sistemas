UNIT Uopciones;

INTERFACE
	
	uses Ulista, crt;

	const
		randlim = 80;

	procedure Opciones(var opcion: char);

	procedure Menu(var lista: Tlista; mensaje: string);

IMPLEMENTATION

	procedure AgregarLista(var lista: Tlista);
	var
		aux: string;
		elemento: Telemento;
		funciono: integer;
	begin
		writeln;
		write('Elemento: ');
		readln(aux);
		Val(aux, elemento, funciono);
		if (funciono<>0) then
			elemento:= random(randlim);
		agregar(lista, fin(lista), elemento);
	end;

	function posiciondenumero(lista: Tlista; indice: integer): Tindice;
	var
		i: Tindice;
		contador: integer;
	begin
		i:= primero(lista);
		contador:= 1;
		if indice>0 then begin
			while (contador<indice) and (i<>fin(lista)) do begin
				inc(contador);
				i:= siguiente(i)
			end;
			posiciondenumero:= i;
		end
		else posiciondenumero:= fin(lista)
	end;

	procedure EliminarLista(var lista: Tlista);
	var
		aux: string;
		posicion: Tindice;
		indice, funciono: integer;
	begin
		writeln;
		write('Posicion: ');
		readln(aux);
		Val(aux, indice, funciono);
		if (funciono<>0) then
			posicion:= fin(lista)
		else posicion:= posiciondenumero(lista, indice);
		eliminar(lista, posicion);
	end;

	procedure Presentacion(mensaje: string);
	var
		i: integer;
	begin
		clrscr;
		writeln;
		write('---------------------');
		for i:=1 to length(mensaje) do write('-');
		writeln; 
		writeln('Operando la lista de ',mensaje);
		write('---------------------');
		for i:=1 to length(mensaje) do write('-');
		writeln;
		writeln;
	end;

	procedure Opciones(var opcion: char);
	begin
		writeln;
		writeln('1. Cargar Elementos.');
		writeln('2. Suprimir elemento.');
		writeln('3. Terminar.');
		writeln;
		write('Opcion: '); readln(opcion)
	end;

	procedure Menu(var lista: Tlista; mensaje: string);
	var
		opcion: char;
	begin
		Randomize;
		crear(lista);
		repeat
			Presentacion(mensaje);
			MostrarLista(lista);
			Opciones(opcion);
			case opcion of
				'1': AgregarLista(lista);
				'2': EliminarLista(lista);
				'3': ;
				else begin
					writeln('Error: elige una opcion correcta');
					writeln('Presiona cualquier tecla para continuar...');
					readkey;
				end
			end
		until (opcion='3')
	end;

begin
end.