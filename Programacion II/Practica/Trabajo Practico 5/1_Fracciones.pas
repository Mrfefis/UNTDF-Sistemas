program Frac;
uses Ufraccion, crt;
{
	Consigna:
	Escriba un TDA que permita el uso de fracciones. La funcionalidad mínima que debe
	aportar es:
	- Iniciar: iniciar una fracción a partir de un numerador y un denominador entero.
	- Sumar: retornar la suma de dos fracciones.
	- Restar: retornar la resta de dos fracciones.
	- Imprimir: visualiza en pantalla la fracción.
}
var
	fraccion1, fraccion2, resultado: Tfraccion;
	numerador, denominador: integer;
begin
	write('Numerador: ');
	readln(numerador);
	write('Denominador: ');
	readln(denominador);
	iniciar(fraccion1, numerador, denominador);
	clrscr;
	write('Numerador: ');
	readln(numerador);
	write('Denominador: ');
	readln(denominador);
	iniciar(fraccion2, numerador, denominador);
	imprimir(fraccion1);
	imprimir(fraccion2);
	resultado:= suma(fraccion1, fraccion2);
	imprimir(resultado);
	resultado:= resta(fraccion1, fraccion2);
	imprimir(resultado);
	readkey
end.