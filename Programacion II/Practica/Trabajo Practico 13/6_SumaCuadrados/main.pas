program main;
uses crt, Uarbol, Uarbolpila;
{
	Consigna:
	Un árbol binario de búsqueda contiene valores enteros en el campo INFO de cada nodo.
	Escribir una función SUMACUADRADO que devuelva la suma de los cuadrados de los
	valores del árbol.
}

function SumaCuadrado(arbol: Tarbol): longword;
var
	resultado: longword;
	pila: Uarbolpila.Tpila;
begin
	Uarbolpila.init(pila);
	resultado:= 0;
	repeat
		while (arbol<>nil) do
		begin
			Uarbolpila.push(pila, arbol);
			arbol:= arbol^.izq;
		end;
		if not Uarbolpila.empty(pila) then
		begin
			Uarbolpila.pop(pila, arbol);
			resultado:= resultado + arbol^.info*arbol^.info;
			arbol:= arbol^.der
		end;
	until (arbol=nil) and Uarbolpila.empty(pila);
	SumaCuadrado:= resultado;
end;

var
	arbol: Tarbol;
	i: integer;
begin
	iniciar(arbol);
	for i:=1 to 20 do
		Uarbol.insertar(arbol, random(10));
	Uarbol.listarPorNivel(arbol);
	writeln('Suma: ', SumaCuadrado(arbol));
	readkey
end.