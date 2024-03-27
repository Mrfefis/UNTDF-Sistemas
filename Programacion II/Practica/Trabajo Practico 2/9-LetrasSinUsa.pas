program ComplementodeTexto;
{
	Consigna:
	Escribir un programa que detecte todas las letras que NO están en una línea de texto y las 
	visualice en orden alfabético.
}
type
	Tconjunto = set of char;

procedure ComplementarLinea(texto: string; var minusculas, mayusculas: Tconjunto);
var
	auxMinusculas, auxMayusculas: Tconjunto;
	i: byte;
begin
	minusculas:= [];
	mayusculas:= [];
	auxMinusculas:= ['a'..'z'];
	auxMayusculas:= ['A'..'Z'];
	for i:=1 to length(texto) do begin
		if texto[i] in auxMinusculas then
			minusculas:= minusculas + [texto[i]]
		else if texto[i] in auxMayusculas then
			mayusculas:= mayusculas + [texto[i]]
	end;
	minusculas:= auxMinusculas - minusculas;
	mayusculas:= auxMayusculas - mayusculas;
end;

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

var
	texto: string;
	minusculas, mayusculas: Tconjunto;
begin
	writeln('Complemento de un texto':40); writeln;
	write('Dame un texto(<=255): '); readln(texto);
	ComplementarLinea(texto, minusculas, mayusculas);
	writeln;
	write('Mayusculas que no estan en el Texto: ');
	MostrarConjunto(mayusculas);
	write('Minusculas que no estan en el Texto: ');
	MostrarConjunto(minusculas);
end.