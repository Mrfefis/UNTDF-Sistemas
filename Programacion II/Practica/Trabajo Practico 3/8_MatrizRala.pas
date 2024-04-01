program MatrizRala;
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
	n = 10;
	m = 10;
	total = (n * m div 2) + 1;
type
	Trala = array[1..n, 1..m] of integer;
	Tmatriz = array[1..total, 1..3] of integer;

procedure Inicializar(var matriz: Trala; n, m, nonulos: integer);
var
	i, j: integer;
begin
	for i:=1 to n do
		for j:=1 to m do
			matriz[i, j]:= 0;

	for i:=1 to nonulos do
		matriz[random(n)+1, random(m)+1]:= random(10);
end;

procedure MostrarRala(const matriz: Trala; n, m: integer);
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

procedure MostrarAux(const matriz: Tmatriz; total: integer);
var
	i, j: integer;
begin
	for i:=1 to total do begin
		for j:=1 to 3 do
			write(matriz[i, j], ' ');
		writeln;
	end
end;

procedure Transformar(var matriz: Tmatriz; const rala: Trala; n, m, total: integer);
var
	i, j, k: integer;
begin
	k:= 1;
	matriz[k, 1]:= n;
	matriz[k, 2]:= m;
	matriz[k, 3]:= 0;
	for i:=1 to n do for j:=1 to m do
		if rala[i, j]<>0 then begin
			inc(k);
			inc(matriz[1, 3]);
			matriz[k, 1]:= i;
			matriz[k, 2]:= j;
			matriz[k, 3]:= rala[i, j]
		end;
end;

procedure MostrarMatriz(const matriz: Tmatriz; total: integer);
var
	i, j, k, digitos: integer;
	listo: boolean;
begin
	k:= 2;
	digitos:= 2;
	writeln;
	for i:=1 to matriz[1, 1] do begin
		for j:=1 to matriz[1, 2] do begin
			listo:= false;
			while (k<=total) and not listo do begin
				if (matriz[k, 1]=i) and (matriz[k, 2]=j) then begin
					listo:= true;
					write(matriz[k, 3]:digitos, ' ');
					inc(k)
				end
				else if matriz[k, 1]>=i then begin
					listo:= true;
					write(0:digitos, ' ')
				end
				else inc(k)
			end;
			if not listo then
				write(0:digitos, ' ')
		end;
		writeln;
	end;
	writeln;
end;

var
	rala: Trala;
	matriz: Tmatriz;
begin
	Randomize;
	Inicializar(rala, n, m, total-1);
	clrscr;
	writeln('Dada la matriz: ');
	MostrarRala(rala, n, m);
	writeln('La matriz Rala es: ');
	Transformar(matriz, rala, n, m, total);
	MostrarMatriz(matriz, total);
end.