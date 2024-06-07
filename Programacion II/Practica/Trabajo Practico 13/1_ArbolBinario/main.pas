program main;
uses crt, Uarbol, Utipos;
{
	Consigna:
	a. Mostrar cómo quedaría el árbol después de agregar el nodo 3
	b. Mostrar cómo quedaría el árbol después de agregar el nodo 90
	c. Mostrar cómo quedaría el árbol después de agregar el nodo 56
	d. Mostrar cómo quedaría el árbol después de suprimir el nodo 20
	e. Mostrar cómo quedaría el árbol después de suprimir el nodo 43
	f. Mostrar cómo quedaría el árbol después de suprimir el nodo 58
	g. Cuáles son los antepasados de 33 ?
	h. Cuáles son los descendientes de 20 ?
	i. Mostrar lo que se imprimiría por un recorrido en POSORDEN del árbol
	j. Mostrar lo que se imprimiría por un recorrido en PREORDEN del árbol
	k. Mostrar lo que se imprimiría por un recorrido en INORDEN del árbol
	l. Cuál es el número máximo posible de nodos del árbol en el nivel del nodo 58?
	m. Cuál es el número máximo posible de nodos del árbol en el nivel del nodo 33?
	n. Cuántos nodos tendría el árbol si estuviera completamente lleno hasta el nivel
	posterior al del nodo 31?
}
type
	Telemento = Utipos.Tinfo;
	Tarbol = Uarbol.Tarbol;
	Tpuntero = Uarbol.Tpuntero;

procedure Cargar(var arbol: Tarbol);
var
	elemento: Telemento;
begin
	writeln('Inserta numeros(0 para terminar)');
	write('Numero: ');
	readln(elemento);
	while (elemento<>0) do
	begin
		Uarbol.insertar(arbol, elemento);
		write('Numero: ');
		readln(elemento);
	end;
end;

procedure Inicializar(var arbol: Tarbol);
begin
	Uarbol.insertar(arbol, 43);
	Uarbol.insertar(arbol, 9);
	Uarbol.insertar(arbol, 49);
	Uarbol.insertar(arbol, 2);
	Uarbol.insertar(arbol, 20);
	Uarbol.insertar(arbol, 47);
	Uarbol.insertar(arbol, 57);
	Uarbol.insertar(arbol, 1);
	Uarbol.insertar(arbol, 4);
	Uarbol.insertar(arbol, 32);
	Uarbol.insertar(arbol, 33);
	Uarbol.insertar(arbol, 58);
end;

procedure Pausa;
begin
	writeln('Pulsa una tecla para continuar...');
	readkey;
end;

procedure Anteriores(arbol: Tarbol; const posicion: Tpuntero);
begin
	if (arbol<>posicion) then
	begin
		write(recuperar(arbol), ' ');
		if (recuperar(arbol)>posicion^.info) then
			Anteriores(izquierda(arbol), posicion)
		else
			Anteriores(derecha(arbol), posicion)
	end;
end;

procedure Antepasados(arbol: Tarbol; posicion: Tpuntero);
begin
	write('[ ');
	//Anteriores(arbol, posicion);
	if (posicion<>nil) then
		while (arbol<>posicion) do
		begin
			write(recuperar(arbol), ' ');
			if (recuperar(arbol)>posicion^.info) then
				arbol:= izquierda(arbol)
			else
				arbol:= derecha(arbol)
		end;
	writeln(']');
end;

function Nivel(arbol: Tarbol; elemento: integer): byte;
var
	valor: byte;
begin
	valor:= 0;
	while (arbol<>nil) and (recuperar(arbol)<>elemento) do
	begin
		inc(valor);
		if (recuperar(arbol)>elemento) then
			arbol:= izquierda(arbol)
		else
			arbol:= derecha(arbol)
	end;
	Nivel:= valor;
end;

function potencia(base, exponente: integer): longint;
var
	i: integer;
	resultado: longint;
begin
	resultado:= 1;
	for i:=1 to exponente do
		resultado:= resultado * base;
	potencia:= resultado;
end;

var
	arbol, original: Tarbol;
begin
	Uarbol.iniciar(arbol);
	Uarbol.iniciar(original);
	Inicializar(arbol);
	Inicializar(original);
	//Cargar(arbol);
	writeln('Arbol Original');
	write('Listado en Orden: ');
	Uarbol.listarEnOrden(arbol);
	write('Listado por Niveles: ');
	Uarbol.listarPorNivel(arbol);
	writeln;
	// a)
	writeln('Mostrar como quedaria el arbol despues de agregar el nodo 3');
	Uarbol.insertar(arbol, 3);
	write('Listado en Orden: ');
	Uarbol.listarEnOrden(arbol);
	write('Listado por Niveles: ');
	Uarbol.listarPorNivel(arbol);
	writeln;
	// b)
	writeln('Mostrar como quedaria el arbol despues de agregar el nodo 90');
	Uarbol.insertar(arbol, 90);
	write('Listado en Orden: ');
	Uarbol.listarEnOrden(arbol);
	write('Listado por Niveles: ');
	Uarbol.listarPorNivel(arbol);
	writeln;
	// c)
	writeln('Mostrar como quedaria el arbol despues de agregar el nodo 56');
	Uarbol.insertar(arbol, 56);
	write('Listado en Orden: ');
	Uarbol.listarEnOrden(arbol);
	write('Listado por Niveles: ');
	Uarbol.listarPorNivel(arbol);
	Pausa;
	// d)
	clrscr;
	writeln('Mostrar como quedaria el arbol despues de suprimir el nodo 20');
	Uarbol.eliminar(arbol, 20);
	write('Listado en Orden: ');
	Uarbol.listarEnOrden(arbol);
	write('Listado por Niveles: ');
	Uarbol.listarPorNivel(arbol);
	writeln;
	// e)
	writeln('Mostrar como quedaria el arbol despues de suprimir el nodo 43');
	Uarbol.eliminar(arbol, 43);
	write('Listado en Orden: ');
	Uarbol.listarEnOrden(arbol);
	write('Listado por Niveles: ');
	Uarbol.listarPorNivel(arbol);
	writeln;
	// f)
	writeln('Mostrar como quedaria el arbol despues de suprimir el nodo 58');
	Uarbol.eliminar(arbol, 58);
	write('Listado en Orden: ');
	Uarbol.listarEnOrden(arbol);
	write('Listado por Niveles: ');
	Uarbol.listarPorNivel(arbol);
	Pausa;
	// g)
	clrscr;
	writeln('Cuales son los antepasados de 33?');
	write('Listado de Antepasados: ');
	Antepasados(arbol, Uarbol.buscar(arbol, 33));
	// h)
	writeln('Cuales son los descendientes de 20?');
	write('Listado de Descendientes: ');
	Uarbol.listarEnOrden(Uarbol.buscar(original, 20));
	Pausa;
	// i)
	clrscr;
	writeln('Mostrar lo que se imprimiria por un recorrido en POSORDEN del arbol');
	write('Arbol Original: ');
	Uarbol.listarPostOrden(original);
	write('Arbol Modificado: ');
	Uarbol.listarPostOrden(arbol);
	// j)
	writeln('Mostrar lo que se imprimiria por un recorrido en PREORDEN del arbol');
	write('Arbol Original: ');
	Uarbol.listarPreOrden(original);
	write('Arbol Modificado: ');
	Uarbol.listarPreOrden(arbol);
	// k)
	writeln('Mostrar lo que se imprimiria por un recorrido en INORDEN del arbol');
	write('Arbol Original: ');
	Uarbol.listarEnOrden(original);
	write('Arbol Modificado: ');
	Uarbol.listarEnOrden(arbol);
	Pausa;
	// l)
	clrscr;
	writeln('Cual es el numero maximo posible de nodos del arbol en el nivel del nodo 58?');
	writeln('Numero maximo posible: ', potencia(2, Nivel(original, 58)));
	// m)
	writeln('Cual es el numero maximo posible de nodos del arbol en el nivel del nodo 33?');
	writeln('Numero maximo posible: ', potencia(2, Nivel(original, 33)));
	// n)
	writeln('Cuantos nodos tendria el arbol si estuviera completamente lleno hasta el nivel posterior al del nodo 31?');
	Uarbol.insertar(arbol, 31);
	writeln('Suponiendo que el 31 existe: ', potencia(2, Nivel(original, 31)+1) - 1);
	Pausa;
end.