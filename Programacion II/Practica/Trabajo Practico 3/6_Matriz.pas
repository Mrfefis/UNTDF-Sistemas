program DeclaraciondeMatriz;
{
	Consigna:
	Cómo debería declararse la matriz A y cuál sería su contenido después de ejecutarse el
	siguiente segmento de programa:
	 FOR I:=1 TO 10 DO
	 FOR J:= 1 TO 10 DO
	 A[I,J]:= I=J;
}
type
	Tmatriz = array[1..10, 1..10] of boolean;

procedure Mostrar(matriz: Tmatriz);
var
	i, j: integer;
begin
	for i:=1 to 10 do begin
		for j:=1 to 10 do
			if matriz[i, j] then write('1 ')
			else write('0 ');
		writeln;
	end
end;

var
	A: Tmatriz;
	i, j: integer;
begin
	FOR I:=1 TO 10 DO
		FOR J:= 1 TO 10 DO
			A[I,J]:= I=J;
	Mostrar(A);
end.