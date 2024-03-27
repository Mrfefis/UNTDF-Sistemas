program EjerciciosdeConjuntos;
{
	Consigna:
	Dadas las siguientes declaraciones:
	 TYPE
	 BASE = 1..50 ; CONJ = SET OF BASE ;
	 VAR
	 A , B : CONJ ;
	Escribir un programa en Pascal para generar los conjuntos A y B de la siguiente manera:
	A : múltiplos de 6;
	B : complemento de A con respecto a BASE.
}
const
	infBase = 1;
	supBase = 50;
type
	Base = infBase..supBase;
	Tconjunto = set of Base;

procedure CargarMultiplos(multiplosde: Base; var conjunto: Tconjunto);
var
	i: Base;
	operacion: integer;
begin
	conjunto:= [];
	i:= infBase;
	operacion:= i*multiplosde;
	while (i<=supBase) and (operacion<=supBase) do begin
		conjunto:= conjunto + [operacion];
		inc(i);
		operacion:= i*multiplosde;
	end
end;

procedure MostrarConjunto(conjunto: Tconjunto);
var
	i: Base;
begin
	write('{ ');
	for i in conjunto do
		write(i, ' ');
	writeln('}');
	writeln;
end;

function Complemento(conjunto: Tconjunto): Tconjunto;
var
	i: Base;
begin
	Complemento:= [1..50]-conjunto;
end;

var
	A, B: Tconjunto;
	multiplosde: Base;
begin
	writeln('Multiplos y complementos':30); writeln;
	write('Dame un numero entre 0-25: ');
	readln(multiplosde); writeln;
	
	write('Multiplos de ', multiplosde, ' (A) = ');
	CargarMultiplos(multiplosde, A);
	MostrarConjunto(A);

	B:= Complemento(A);
	writeln('El complemento de A = ');
	MostrarConjunto(B);
end.