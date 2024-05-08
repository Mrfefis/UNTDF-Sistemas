program Main;
uses crt, Upilachar, Upilaint;
{
	Consigna:
	Dadas dos pilas de enteros llamadas Operando1 y Operando2 y una pila de caracteres que
	contiene solo '*', '+', '-', '/', recorrer las pilas de números sacando un número por vez de cada
	una y un operador de la pila de caracteres e imprimir el resultado de la operación.
}
type
	Toperadores = Upilachar.Tpila;
	Toperandos = Upilaint.Tpila;

// ---------------------------------SUBPROGRAMAS---------------------------------

procedure Cargar(var operadores: Toperadores; var operandos1, operandos2: Toperandos);
var
	i, total: byte;
	operador: Upilachar.Telemento;
begin
	write('Cantidad de operaciones: ');
	readln(total);
	for i:= 1 to total do begin
		if not Upilaint.full(operandos1) then
			Upilaint.push(operandos1, random(100)-50);
		if not Upilaint.full(operandos2) then
			Upilaint.push(operandos2, random(100)-50);
		if not Upilachar.full(operadores) then
		begin
			case random(4) of
				0: operador:= '+';
				1: operador:= '-';
				2: operador:= '*';
				3: operador:= '/';
			end;
			Upilachar.push(operadores, operador);
		end;
	end
end;

procedure Mostrar(operadores: Toperadores; operandos1, operandos2: Toperandos);
var
	operador: Upilachar.Telemento;
	operando: Upilaint.Telemento;
begin
	writeln('Operandos:');
	while not Upilachar.empty(operadores) do begin
		Upilachar.pop(operadores, operador);
		write(operador, ' ');
	end;
	writeln;
	writeln('Operandos 1:');
	while not Upilaint.empty(operandos1) do begin
		Upilaint.pop(operandos1, operando);
		write(operando, ' ');
	end;
	writeln;
	writeln('Operandos 2:');
	while not Upilaint.empty(operandos2) do begin
		Upilaint.pop(operandos2, operando);
		write(operando, ' ');
	end;
	writeln;
end;

procedure RealizarOperaciones(var operadores: Toperadores; var operandos1, operandos2: Toperandos);
var
	operador: Upilachar.Telemento;
	operando1, operando2: Upilaint.Telemento;
begin
	while not (Upilachar.empty(operadores) or Upilaint.empty(operandos1) or Upilaint.empty(operandos2)) do begin
		Upilachar.pop(operadores, operador);
		Upilaint.pop(operandos1, operando1);
		Upilaint.pop(operandos2, operando2);
		write(operando1:3, ' ', operador, ' ', operando2:3, ' = ');
		case operador of
			'+': writeln((operando1 + operando2):5);
			'-': writeln((operando1 - operando2):5);
			'*': writeln((operando1 * operando2):5);
			'/': begin
				if operando2=0 then
					writeln('Indef')
				else
					writeln((operando1 / operando2):5:2);
			end
		end;
	end;
end;

// ------------------------------PROGRAMA PRINCIPAL------------------------------

var
	operadores: Toperadores;
	operandos1, operandos2: Toperandos;
begin
	Randomize;
	Upilachar.init(operadores);
	Upilaint.init(operandos1);
	Upilaint.init(operandos2);
	Cargar(operadores, operandos1, operandos2);
	Mostrar(operadores, operandos1, operandos2);
	writeln('Operaciones:');
	RealizarOperaciones(operadores, operandos1, operandos2);
end.