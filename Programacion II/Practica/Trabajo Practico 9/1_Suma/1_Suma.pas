program probando;
uses crt, UlistaSimple, UlistaInterfaz;

procedure Opciones(var opcion: char);
begin
	writeln('1. Cargar al Inicio.');
	writeln('2. Cargar al Final.');
	writeln('3. Eliminar del Inicio.');
	writeln('4. Eliminar del Final.');
	writeln('5. Eliminar Lista.');
	writeln('6. Eliminar elemento.');
	writeln('0. Terminar.');
	opcion:= readkey();
end;

function Sumatoria(lista: Tlista): longint;
var
	i, limite: Tindice;
begin
	limite:= longitud(lista);
	Sumatoria:= 0;
	for i:= 1 to limite do
		Sumatoria:= Sumatoria + recuperar(lista, i);
end;

var
	lista: Tlista;
	opcion: char;
	elemento: Tinfo;
begin
	iniciar(lista);
	elemento:= 0;
	// Ciclo del menu
	repeat
		// Presentacion
		clrscr;
		write('Lista = ');
		listar(lista);
		writeln('Sumatoria de la lista: ', Sumatoria(lista));
		// Muestra el ultimo eliminado (Si existe)
		if elemento<>0 then
			writeln('Ultimo eliminado: ', elemento);	
		// Toma de Desiciones
		Opciones(opcion);
		case (opcion) of
			'1', '2': Cargar(lista, opcion); 
			'3', '4': Borrar(lista, opcion, elemento);
			// Recrea la lista
			'5': begin
				Destruir(lista);
				iniciar(lista);
			end;
			'6': BorrarElemento(lista, elemento);
		end;
	until(opcion='0');
end.