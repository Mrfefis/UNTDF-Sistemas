program probando;
uses crt, UlistaSimple, UlistaInterfaz;
{
	Escribir una FUNCIÓN de tipo puntero que explore una lista en busca de un entero dado y
	devuelva NIL si el entero no se encuentra en la lista o el puntero al nodo donde está el
	entero buscado.
	La función deberá considerar que la lista puede estar vacía y terminar la búsqueda cuando
	aparezca el primer entero igual al buscado (o al terminar de recorrer la lista si es que no
	está ese elemento).
	Implemente una versión iterativa y otra recursiva. Compare las ventajas y desventajas de
	ambas implementaciones. 
}
procedure Opciones(var opcion: char);
begin
	writeln('1. Cargar al Inicio.');
	writeln('2. Cargar al Final.');
	writeln('3. Eliminar del Inicio.');
	writeln('4. Eliminar del Final.');
	writeln('5. Eliminar Lista.');
	writeln('6. Eliminar elemento.');
	writeln('7. Buscar elemento');
	writeln('0. Terminar.');
	opcion:= readkey();
end;

procedure BuscarElemento(var lista: Tlista);
var
	elemento: Tinfo;
	posicion: Tindice;
begin
	write('Ingresa un elemento: ');
	readln(elemento);
	posicion:= Buscar(lista, elemento);
	if (posicion>=1) and (posicion<=longitud(lista)) then
		writeln('El elemento esta en la posicion ', posicion)
	else
		writeln('El elemento no existe');
	writeln('Pulsa cualquier tecla para continuar...');
	readkey;
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
		Listar(lista);
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
			'7': BuscarElemento(lista);
		end;
	until(opcion='0');
end.