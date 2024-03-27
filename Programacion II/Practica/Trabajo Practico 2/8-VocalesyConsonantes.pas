program BuscandoLetras;
{
	Consigna:
	Escribir un programa que encuentre el conjunto de todas las vocales y el conjunto de todas 
	las consonantes de una línea de texto dada.
}
type
	Tconjunto = set of char;

procedure Inicializar(var vocales, consonantes: Tconjunto);
begin
	vocales:= ['a', 'e', 'i', 'o', 'u'] + ['A', 'E', 'I', 'O', 'U'];
	consonantes:= ['A'..'Z'] + ['a'..'z'] - vocales;
end;

procedure BuscarLetras(texto: string; var vocales, consonantes: Tconjunto);
var
	auxVocales, auxConsonantes: Tconjunto;
	i: byte;
begin
	Inicializar(auxVocales, auxConsonantes);
	vocales:= [];
	consonantes:= [];
	for i:= 1 to length(texto) do begin
		if texto[i] in auxVocales then
			vocales:= vocales + [texto[i]]
		else if texto[i] in auxConsonantes then
			consonantes:= consonantes + [texto[i]]
	end
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
	vocales, consonantes: Tconjunto;
	texto: string;
begin
	writeln('Vocales y Consonantes de una Linea':40); writeln;
	write('Dame un texto(<=255): '); readln(texto);
	BuscarLetras(texto, vocales, consonantes);
	writeln;
	write('El conjunto de sus vocales es: ');
	MostrarConjunto(vocales);
	write('El conjunto de sus consonantes es: ');
	MostrarConjunto(consonantes);
end.