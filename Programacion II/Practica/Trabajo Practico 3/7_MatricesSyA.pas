program SimetriaAntisimietria;
uses crt;
{
	Consigna:
	Escribir un programa en Pascal que lea una matriz cuadrada de enteros y la descomponga
	en dos matrices, una simétrica B y otra antisimétrica C tales que:
	B[I,J] = (A[I,J] + A[J,I]) / 2 = B[J,I]
	C[I,J] = (A[I,J] - A[J,I]) / 2 = -C[J,I]
	Imprimir las tres matrices.
}
const
	n = 10;

type
	Tmatriz = array[1..n, 1..n] of integer;

procedure Inicializar(var matriz: Tmatriz; n: integer);
var
	i, j: integer;
begin
	for i:=1 to n do
		for j:=1 to n do
			matriz[i, j]:= random(10);
end;

procedure Mostrar(const matriz: Tmatriz; n: integer);
var
	i, j, digitos: integer;
begin
	digitos:= 2;
	writeln;
	for i:=1 to n do begin
		for j:=1 to n do
			write(matriz[i, j]:digitos, ' ');
		writeln;
	end;
	writeln;
end;

procedure Simetrica(const A: Tmatriz; var B: Tmatriz; n: integer);
var
	i, j: integer;
begin
	for i:=1 to n do begin
		B[i, i]:= A[i, i]
	end;
	for i:=1 to n do begin
		for j:=i+1 to n do begin
			B[i, j]:= (A[i, j] + A[j, i]) div 2;
			B[j, i]:= B[i, j];
		end
	end
end;

procedure Antisimetrica(const A: Tmatriz; var B: Tmatriz; n: integer);
var
	i, j: integer;
begin
	for i:=1 to n do begin
		B[i, i]:= A[i, i]
	end;
	for i:=1 to n do begin
		for j:=i+1 to n do begin
			B[i, j]:= (A[i, j] - A[j, i]) div 2;
			B[j, i]:= -B[i, j];
		end
	end
end;

var
	A, B, C: Tmatriz;
begin
	Randomize;
	Inicializar(A, n);
	Simetrica(A, B, n);
	Antisimetrica(A, C, n);
	writeln('Dada la matriz A:');
	Mostrar(A, n);
	readkey;
	writeln('La matriz simetrica B es:');
	Mostrar(B, n);
	readkey;
	writeln('La matriz antisimetrica C es:');
	Mostrar(C, n);
end.