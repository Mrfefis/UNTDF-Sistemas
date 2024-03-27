program Concatenacion;
uses crt;
{
	Consigna:
	Dadas 2 secuencias de caracteres de longitud 16, programar la
	construcción de otra secuencia.
	a) de longitud 32 que provenga de la concatenación.
	b) de la concatenación que elimine los blancos finales de la primera
	(no hay blancos intermedios).
}
const
	min = 16;
	max = 2*min;
type
	Tshortstr = string[min];
	Tstring = string[max];

procedure Concatenar(var concatenacion: Tstring; cadena1, cadena2: Tshortstr);
var
	i: integer;
	hayespacios: boolean;
begin
	hayespacios:= true;
	i:= length(cadena1);
	while (i>0) and hayespacios do begin
		if (cadena1[i]=' ') then dec(i)
		else hayespacios:= false
	end;
	if i=0 then
		concatenacion:= cadena2
	else
		concatenacion:= copy(cadena1, 1, i) + cadena2;
end;

var
	cadena1, cadena2: Tshortstr;
	concatenacion: Tstring;
begin
	writeln('Concatenar sin espacios':40);
	writeln;
	write('Ingresa una cadena(',min,' caracteres): '); readln(cadena1);
	write('Dame otra cadena(',min,' caracteres): '); readln(cadena2);
	writeln;
	Concatenar(concatenacion, cadena1, cadena2);
	writeln('El resultado es: ', concatenacion);
end.