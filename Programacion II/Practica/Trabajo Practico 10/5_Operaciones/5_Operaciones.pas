program PiladeEnteros;
uses crt, Upila, Umenu, Uinterfaz;
{
	Consigna:
	Utilizando sólo operaciones de pila realizar un algoritmo que:
	• Invierta una pila
	• Dada una pila y un valor llamado LÍMITE, devuelva otras dos pilas, en una de las
	cuales se han introducido los valores menores que el LÍMITE, y en la otra los
	valores mayores o iguales al LÍMITE. (La pila inicial debe desaparecer liberando
	la memoria que ocupaba)
	• Cambie todos los elementos de la Pila iguales a X por Y, sin modificar el resto de
	la Pila.
}

procedure SepararLimite(var original, menores, mayores: Tpila; limite: Tinfo);
var
	elemento: Tinfo;
begin
	Upila.destruir(menores);
	Upila.destruir(mayores);
	Upila.iniciar(menores);
	Upila.iniciar(mayores);
	while not Upila.vacia(original) do
	begin
		Upila.eliminar(original, elemento);
		if (elemento<limite) then
			Upila.insertar(menores, elemento)
		else
			Upila.insertar(mayores, elemento)
	end;
end;

procedure CambiarValor(var pila: Tpila);
var
	elemento, original, reemplazo: Tinfo;
	copia: Tpila;
begin
	writeln;
	write('Dato a reemplazar: ');
	readln(original);
	write('Reemplazo: ');
	readln(reemplazo);
	Upila.iniciar(copia);
	while not Upila.vacia(pila) do
	begin
		Upila.eliminar(pila, elemento);
		if (elemento=original) then
			Upila.insertar(copia, reemplazo)
		else
			Upila.insertar(copia, elemento);
	end;
	pila:= copia;
	Upila.invertir(pila);
end;

var
	pila, pilaMen, pilaMyI: Tpila;
	opcion: char;
	elemento, limite: Tinfo;
	primeraCarga: boolean;
begin
	Upila.iniciar(pila);
	Upila.iniciar(pilaMen);
	Upila.iniciar(pilaMyI);
	primeraCarga:= true;
	repeat
		clrscr;
		write('Pila Original = ');
		Uinterfaz.Imprimir(pila);
		writeln;
		if not primeraCarga then
		begin
			write('Pila de menores a ', limite, ' = ');
			Uinterfaz.Imprimir(pilaMen);
			writeln;
			write('Pila de mayores o iguales a ',limite, ' = ');
			Uinterfaz.Imprimir(pilaMyI);
			writeln;
		end;
		Umenu.Opciones(opcion);
		case opcion of
			'1': Uinterfaz.Cargar(pila);
			'2': 
			begin
				while not Upila.vacia(pila) do
					Upila.eliminar(pila, elemento);
			end;
			'3': Upila.invertir(pila);
			'4':
			begin
				write('Valor de separacion: ');
				readln(limite);
				SepararLimite(pila, pilaMen, pilaMyI, limite);
				primeraCarga:= false;
			end;
			'5': CambiarValor(pila);
		end;
	until(opcion='0');
	Upila.destruir(pila);
end.