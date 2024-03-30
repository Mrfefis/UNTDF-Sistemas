program Rala;
uses crt;
{
	Consigna:
	La siguiente es una matriz RALA, porque sólo 8 de sus 36 elementos son distintos de 0.

		15 0 0 22 0 -15
		0 11 3 0 0 0
		0 0 0 -6 0 0
		0 0 0 0 0 0
		91 0 0 0 0 0
		0 0 28 0 0 0

	Para reducir el espacio de memoria ocupado por matrices de este tipo, se las suele
	almacenar aplicando un método que permite conservar solamente los elementos distintos
	de 0. Para ello se crea una nueva matriz que conserva valor y posición de los elementos no
	nulos. La matriz tiene la siguiente forma:

		▪ Consta de sólo 3 columnas.

		▪ Si N es el número de elementos no nulos, tiene N+1 filas.

		▪ La primera fila de la matriz resultante tiene los siguientes datos: Nro. de filas, Nro.
		de columnas y Nro. de elementos no nulos de la matriz original.

		▪ Las restantes filas contienen: en la primera columna la fila donde está el elemento
		no nulo de la matriz original; en la segunda columna, la columna donde está el
		elemento no nulo de la matriz original; y en la tercera columna el valor de dicho
		elemento.

	Con lo que la matriz reducida proveniente de la anterior es:

		6 6 8
		1 1 15
		1 4 22
		1 6 6 -15
		2 2 11
		2 3 3
		3 4 -6
		5 1 91
		6 3 28

	Escribir un programa en Pascal que:
	a) Lea por fila los elementos reales de una matriz de N x M, que se sabe que es rala, y
	que al menos la mitad de sus elementos son nulos.
	b) Efectúe la transformación para almacenarla en una matriz de 3 columnas.
	c) Imprima la matriz original a partir de la compactada.
}
const
	n = 6;
	m = 6;
	elnonulos = n * m div 2;
type
	Tmatriz = array[1..n, 1..m] of integer;
	Trala = array[1..elnonulos+1, 1..3] of integer;

procedure Inicializar(var matriz: Tmatriz; n, m: integer);
var
	i, j: integer;
begin
	for i:=1 to n do
		for j:=1 to m do
			matriz[i, j]:= 0;

	for i:=1 to elnonulos do
		matriz[random(n)+1, random(m)+1]:= random(10);
end;

procedure MostrarOriginal(const matriz: Tmatriz; n, m: integer);
var
	i, j, digitos: integer;
begin
	digitos:= 2;
	writeln;
	for i:=1 to n do begin
		for j:=1 to m do
			write(matriz[i, j]:digitos, ' ');
		writeln;
	end;
	writeln;
end;

procedure MostrarRala(const matriz: Trala; n: integer);
var
	i, j, digitos: integer;
begin
	digitos:= 2;
	writeln;
	for i:=1 to n do begin
		for j:=1 to 3 do
			write(matriz[i, j]:digitos, ' ');
		writeln;
	end;
	{for i:=1 to matriz[1,2] do begin
		for j:=1 to matriz[1,3] do
	end;}
	writeln;
end;

procedure Transformar(const matriz: Tmatriz; var rala: Trala; n, m, total: integer);
var
	i, j, k: integer;
begin
	rala[1, 1]:= n;
	rala[1, 2]:= m;
	k:= 2;
	for i:=1 to n do
		for j:=1 to m do
			if matriz[i, j]<>0 then begin
				//writeln(k, i, j, matriz[i, j]);
				//readkey;
				rala[k, 1]:= i;
				rala[k, 2]:= j;
				rala[k, 3]:= matriz[i, j];
				inc(k)
			end;
	rala[1, 3]:= k-2;
	for i:=k to total do begin
		rala[k, 1]:= 0;
		rala[k, 2]:= 0;
		rala[k, 3]:= 12;
		inc(k)
	end
end;

var
	moriginal: Tmatriz;
	mtranformada: Trala;
begin
	Randomize;
	Inicializar(moriginal, n, m);
	clrscr;
	writeln('Dada la matriz: ');
	MostrarOriginal(moriginal, n, m);
	writeln('La matriz Rala es: ');
	Transformar(moriginal, mtranformada, n, m, elnonulos);
	MostrarRala(mtranformada, elnonulos+1);
end.