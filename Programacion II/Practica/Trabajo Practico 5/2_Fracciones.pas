program Frac;
uses crt, Ufraccion;

var
	fraccion: Tfraccion;
	numerador, denominador: integer;
begin
	write('Numerador: ');
	readln(numerador);
	write('Denominador: ');
	readln(denominador);
	iniciar(fraccion, numerador, denominador);
	write('La fraccion es: ');
	if getsigno(fraccion)=-1 then
		write('-');
	writeln(getnumerador(fraccion), '/', getdenominador(fraccion));
	readkey
end.