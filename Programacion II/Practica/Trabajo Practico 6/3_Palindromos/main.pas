program Main;
uses crt, Upilachar;
{
	Consigna:
	Leer una cadena de caracteres y determinar si es un palíndrome (Frase que se lee igual de
	izquierda a derecha que de derecha a izquierda , como por ejemplo : DABALE ARROZ A LA
	ZORRA EL ABAD )
	Escribir 'SI' si la cadena es palíndrome y 'NO' si no lo es. Hacer solamente el segmento de
	programa (no el programa completo) . Suponer los datos correctos y que la cadena no supera
	los cien caracteres . Usar pilas como estructura.
}

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

procedure copiaReves(origen: Tpila; var destino: Tpila);
var
	elemento: Telemento;
begin
	init(destino);
	while not empty(origen) do begin
		pop(origen, elemento);
		push(destino, elemento);
	end;
end;

procedure mostrar(pila: Tpila);
var
	elemento: Telemento;
	aux: Tpila;
begin
	copiaReves(pila, aux);
	while not empty(aux) do
	begin
		pop(aux, elemento);
		write(elemento);
	end;
	writeln;
end;

function Espalindromo(pila: Tpila): boolean;
var
	aux: Tpila;
	principio, final: Telemento;
begin
	copiaReves(pila, aux);
	Espalindromo:= true;
	while not empty(pila) and Espalindromo do
	begin
		pop(pila, principio);
		pop(aux, final);
		if principio<>final then
			Espalindromo:= false;
	end;
end;

// ------------------------------PROGRAMA PRINCIPAL------------------------------

var
	palindromo: string;
	palabra: Tpila;
begin
	writeln('Ingresa un Palindromo');
	write('Texto: ');
	readln(palindromo);
	transformar(palabra, palindromo);
	if EsPalindromo(palabra) then
		write('SI')
	else
		write('NO');
	writeln(' es Palindromo');
end.