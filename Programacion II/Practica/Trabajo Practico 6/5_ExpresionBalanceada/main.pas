program Main;
uses crt, Upilachar;
{
	Consigna:
	5.- Escribir un programa que determine cuando una secuencia de caracteres que finaliza con
	un punto (.) es una expresión matemática balanceada, o sea que todo paréntesis, corchete y
	llave que se abre tiene su correspondiente que se cierra.
}
	// Ejemplo: {a+[b*(c-d)]} (balanceada).
type
	Texpresion = Tpila;
// ---------------------------------SUBPROGRAMAS---------------------------------

procedure transformar(var pila: Tpila; cadena: string);
var
	i, limite: byte;
begin
	init(pila);
	limite:= length(cadena);
	i:= 1;
	while not full(pila) and (i<=limite) do
	begin
		if cadena[i]<>' ' then
			push(pila, cadena[i]);
		inc(i)
	end;
end;

procedure invertir(var pila: Tpila);
var
	elemento: Telemento;
	aux: Tpila;
begin
	init(aux);
	while not empty(pila) do begin
		pop(pila, elemento);
		push(aux, elemento);
	end;
	pila:= aux;
end;

procedure mostrar(pila: Tpila);
var
	elemento: Telemento;
begin
	while not empty(pila) do
	begin
		pop(pila, elemento);
		write(elemento);
	end;
	writeln;
end;

function Balanceada(expresion: Texpresion): boolean;
var
	elemento, apertura: Telemento;
	aperturas: Texpresion;
begin
	init(aperturas);
	Balanceada:= true;
	invertir(expresion);
	mostrar(expresion);
	while not empty(expresion) and Balanceada do begin
		pop(expresion, elemento);
		case elemento of
			'(', '[', '{': push(aperturas, elemento);
			')', ']', '}': if not empty(aperturas) then
			begin
				pop(aperturas, apertura);
				case apertura of
					'(': if elemento<>')' then
							Balanceada:= false;
					'[': if elemento<>']' then
							Balanceada:= false;
					'{': if elemento<>'}' then
							Balanceada:= false;
				end
			end
			else Balanceada:= false
		end
	end;
	if not empty(aperturas) then
		Balanceada:= false
end;

// ------------------------------PROGRAMA PRINCIPAL------------------------------

var
	cadena: string;
	expresion: Texpresion;
begin
	writeln('Ingrese una expresion balanceada');
	write('Expresion: ');
	readln(cadena);
	transformar(expresion, cadena);
	if Balanceada(expresion) then
		writeln('La expresion se encuentra balanceada')
	else
		writeln('La expresion no se encuentra balanceada');
end.