program Palindromos;
uses strings;
{
	Consigna:
	Escribir un programa que determine si una secuencia de caracteres
	ingresada de longitud 16 es capicúa o no.
}
type
	Tshortstr = string[16];

function Espalindromo(cadena: Tshortstr): boolean;
var
	izq, der: integer;
begin
	Espalindromo:= true;
	izq:= 1;
	der:= length(cadena);
	while (izq<der) and (Espalindromo) do begin
		if cadena[izq]=cadena[der] then begin
			inc(izq);
			dec(der);
		end
		else Espalindromo:= false
	end;
end;

var
	cadena: Tshortstr;
begin
	writeln('Detector de Palindromos':40);
	writeln;
	write  ('Ingrese una cadena de texto: '); readln(cadena);
	writeln;
	if Espalindromo(cadena) then writeln(cadena, ' es un Palindromo')
	else writeln(cadena, ' no es un Palindromo')
end.