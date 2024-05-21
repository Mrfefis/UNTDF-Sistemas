program PiladeEnteros;
uses crt, Upila;
{
	Consigna:
	Realice las declaraciones necesarias para poder implementar una pila, cuyo contenido
	son números enteros, utilizando punteros.
}

procedure Pausa;
begin
	writeln('Pulsa cualquier tecla para continuar...');
	readkey
end;

procedure Opciones(var opcion: char);
begin
	writeln('Operaciones con pila de enteros');
	writeln('1. Cargar un elemento');
	writeln('2. Borrar la pila');
	writeln('3. Ver ultimo elemento');
	writeln('4. Eliminar ultimo elemento');
	writeln('5. Sumar elementos');
	writeln('6. Invertir pila');
	writeln('7. Imprimir pila');
	writeln('0. Salir');
	opcion:= readkey;
end;

procedure Cargar(var pila: Tpila);
var
	elemento: Tinfo;
begin
	write('Numero entero: ');
	readln(elemento);
	Upila.insertar(pila, elemento);
end;

procedure Borrar(var pila: Tpila);
var
	elemento: Tinfo;
begin
	while not Upila.vacia(pila) do
		Upila.eliminar(pila, elemento);
	writeln('Pila eliminada...');
	Pausa;
end;

procedure Mirar(var pila: Tpila);
begin
	if Upila.vacia(pila) then
		writeln('La pila esta vacia....')
	else
		writeln('Ultimo elemento: ', Upila.recuperar(pila));
	Pausa;
end;

procedure Invertir(var pila: Tpila);
var
	elemento: Tinfo;
	aux: Tpila;
begin
	Upila.iniciar(aux);
	while not Upila.vacia(pila) do
	begin
		Upila.eliminar(pila, elemento);
		Upila.insertar(aux, elemento);
	end;
	pila:= aux;
end;

{procedure Copiar(var origen, destino: Tpila);
var
	elemento: Tinfo;
begin
	if not Upila.vacia(origen) then
	begin
		Upila.eliminar(origen, elemento);
		Copiar(origen, destino);
		Upila.insertar(destino, elemento);
		Upila.insertar(origen, elemento);
	end
	else Upila.iniciar(destino);
end;}

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

procedure Sumar(var pila: Tpila);
var
	aux: Tpila;
	elemento: Tinfo;
	total: longint;
begin
	total:= 0;
	Upila.iniciar(aux);
	Copiar(pila, aux);
	while not Upila.vacia(aux) do
	begin
		Upila.eliminar(aux, elemento);
		total:= total + elemento;
	end;
	writeln('La suma total es de: ', total);
	Pausa;
end;

procedure Imprimir(var pila: Tpila);
var
	elemento: Tinfo;
	aux: Tpila;
begin
	Upila.iniciar(aux);
	Copiar(pila, aux);
	write('P = ');
	while not Upila.vacia(aux) do
	begin
		Upila.eliminar(aux, elemento);
		write(elemento, ' ');
	end;
	writeln;
	Pausa;
end;

var
	pila: Tpila;
	opcion: char;
	elemento: Tinfo;
begin
	Upila.iniciar(pila);
	repeat
		clrscr;
		Opciones(opcion);
		case opcion of
			'1': Cargar(pila); // Funciona
			'2': Borrar(pila); // Funciona
			'3': Mirar(pila); // Funciona
			'4': begin // Funciona
				if not Upila.vacia(pila) then
				begin
					Upila.eliminar(pila, elemento);
					writeln('Elemento eliminado: ', elemento);
				end
				else
					writeln('Pila vacia...');
				Pausa;
			end;
			'5': Sumar(pila);
			'6': Invertir(pila); // Funciona
			'7': Imprimir(pila);
		end;
	until(opcion='0');
	Upila.destruir(pila);
end.