program CadenaenMayusculas;
{
	Consigna:
	Escribir un procedimiento que lea una cadena de CARACTERES y devuelva el conjunto 
	que contiene a todas sus LETRAS mayúsculas.
}
type
	Tconjunto = set of char;

procedure MostrarConjunto(conjunto: Tconjunto);
var
	i: char;
begin
	write('{ ');
	for i in conjunto do
		write(i, ' ');
	writeln('}');
	writeln;
end;

procedure Mayusculas(texto: string; var mayusculasdeltexto: Tconjunto);
var
	i: integer;
	letrasmayusculas: Tconjunto;
begin
	letrasmayusculas:= ['A'..'Z'];
	for i:= 1 to length(texto) do begin
		if texto[i] in letrasmayusculas then
			mayusculasdeltexto:= mayusculasdeltexto + [texto[i]];
	end;
end;

var
	texto: string;
	mayusculasdeltexto: Tconjunto;
begin
	writeln('Conjunto de mayusculas':20); writeln;
	write('Dame un texto(<=255): '); readln(texto);
	writeln;
	mayusculasdeltexto:= [];
	Mayusculas(texto, mayusculasdeltexto);
	write('El conjunto con todas sus letras mayusculas es: ');
	MostrarConjunto(mayusculasdeltexto)
end.