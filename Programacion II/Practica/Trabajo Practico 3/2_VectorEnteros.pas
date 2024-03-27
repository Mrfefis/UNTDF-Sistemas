program VectorEnteros;
{
	Consigna:
	Diseñe y codifique en Pascal un programa que lea un número entero y cargue cada dígito
	como elemento de un vector.
}
const
	n = 6;
type
	Tdigito = -1..9;
	Tnumero = array[1..n] of Tdigito;

procedure NumeroaVector(var vector: Tnumero; numero: integer);
var
	i, aux: integer;
begin
	// Guardo primer digito y de paso averiguo el signo
	aux:= numero mod 10;
	numero:= numero div 10; // Si es -32768 tengo que sacar el primer digito para cambiar el signo
	if aux<0 then begin
		vector[n]:= -aux;
		numero:= -numero;
		vector[1]:= -1 // Signo negativo
	end
	else begin
		vector[n]:= aux;
		vector[1]:= 1 // Signo positivo
	end;
	// Guardo el resto de digitos
	for i:= n-1 downto 2 do begin
		aux:= numero mod 10;
		vector[i]:= aux;
		numero:= numero div 10
	end
end;

procedure MostrarVector(const vector: Tnumero; n: integer);
var
	i: integer;
begin
	write('[');
	for i:= 1 to n-1 do
		write(vector[i], ', ');
	writeln(vector[n], ']');
	writeln;
end;

var
	valor: integer;
	numero: Tnumero;
begin
	writeln('Numero entero a Vector':30); writeln;
	write('Dame un numero entero: '); readln(valor);
	writeln;
	NumeroaVector(numero, valor);
	write('El vector con los digitos es: ');
	MostrarVector(numero, n);
end.