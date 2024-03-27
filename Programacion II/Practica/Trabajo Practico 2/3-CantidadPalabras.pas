program CantidadDePalabras;
{
	Consigna:
	Escribir un programa en Pascal que cuente la cantidad de palabras que hay en una secuencia
	de longitud <= 255 , sabiendo que las palabras se separan por uno o más blancos.
}

function ContarPalabras(texto: string): byte;
var
	dentro: boolean;
	i, limite: integer;
begin
	ContarPalabras:= 0;
	dentro:= false;
	limite:= length(texto);

	for i:= 1 to limite do begin
		if (dentro) and (texto[i]=' ') then
			dentro:= false
		else if (not dentro) and (texto[i]<>' ') then begin
			dentro:= true;
			inc(ContarPalabras);
		end
	end
end;

var
	texto: string;
	palabras: byte;
begin
	writeln('Contador de palabras':40);
	writeln;
	write('Escribe un texto(caracteres<=255): '); readln(texto);
	palabras:= ContarPalabras(texto);
	writeln('La cantidad de palabras es: ', palabras);
end.