program MemoriaVector;
{
	Consigna:
	- Dadas las siguientes declaraciones:

	A) Cuánta memoria se reserva para cada uno: VALOR, ARREGLO, CAJA)?
	
	B) Si los tres arreglos se asignan consecutivamente a partir de la posición 1000 y en el
	mismo orden de declaración, calcular las direcciones de los siguientes elementos
	(orden principal de filas):
	 VALOR[1,1] ARREGLO[1,-2] CAJA['A',1]
	 VALOR[5,2] ARREGLO[2, 1] CAJA['Z',2]
	 VALOR[5,6] ARREGLO[3, 0] CAJA['N',3] 
}
TYPE
	TIPOVALOR = ARRAY [1..5,1..6] OF INTEGER ;
	TIPOARREGLO = ARRAY [1..3,-2..0] OF INTEGER ;
	TIPOCAJA = ARRAY ['A'..'Z',1..3] OF CHAR ;

function Memoria(lcs, lci, lfs, lfi: integer; bytes: integer): integer;
begin
	Memoria:= (lcs - lci +1)*(lfs - lfi +1)*bytes;
end;

function Lugar(dbase: longword; lcs, lci, lfs, lfi, bytes, i, j: integer): longword;
begin
	Lugar:= dbase + (i-lfi)*(lcs-lci+1)*bytes + (j-lci)*bytes;
end;

VAR
	VALOR : TIPOVALOR ;
	ARREGLO : TIPOARREGLO ;
	CAJA : TIPOCAJA ;
	int, caracter: integer;
begin
	int:= 2;
	caracter:= 1;
	writeln('Valor ocupa: ', Memoria(6,1,5,1,int), ' bytes');
	writeln('Arreglo ocupa: ', Memoria(0,-2,3,1,int), ' bytes');
	writeln('Caja ocupa: ', Memoria(ord('Z'),ord('A'),3,1,caracter), ' bytes');
	writeln('Valor[1,1]: ', Lugar(1000, 6, 1, 5, 1, int, 1, 1) );
	writeln('Valor[5,2]: ', Lugar(1000, 6, 1, 5, 1, int, 5, 2) );
	writeln('Valor[5,6]: ', Lugar(1000, 6, 1, 5, 1, int, 5, 6) );
	writeln('Arreglo[1, -2]: ', Lugar(1059, 0, -2, 3, 1, int, 1, -2) );
	writeln('Arreglo[2, 1]: ', Lugar(1059, 0, -2, 3, 1, int, 2, 1) );
	writeln('Arreglo[3, 0]: ', Lugar(1059, 0, -2, 3, 1, int, 3, 0) );
	writeln('Caja["A", 1]: ', Lugar(1076, 3, 1, ord('Z'), ord('A'), caracter, ord('A'), 1) );
	writeln('Caja["Z", 2]: ', Lugar(1076, 3, 1, ord('Z'), ord('A'), caracter, ord('Z'), 2) );
	writeln('Caja["N", 3]: ', Lugar(1076, 3, 1, ord('Z'), ord('A'), caracter, ord('N'), 3) );
end.