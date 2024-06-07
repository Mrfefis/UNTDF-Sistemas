program Ordenar;
uses crt, Uarbol;
{
	Consigna:
	El campo de información de los nodos de un árbol binario contiene palabras de tres letras.
	Mostrar cómo quedaría el árbol después de leer las siguientes palabras (en ese orden).
	Suponer el árbol vacío antes de iniciar la carga.
}
var
	arbol: Tarbol;
begin
	iniciar(arbol);
	insertar(arbol, 'FIA');
	insertar(arbol, 'DOY');
	insertar(arbol, 'LEY');
	insertar(arbol, 'HAY');
	insertar(arbol, 'EGO');
	insertar(arbol, 'ELE');
	insertar(arbol, 'BIO');
	insertar(arbol, 'BUS');
	insertar(arbol, 'ZOO');
	write('Arbol por Orden:');
	listarEnOrden(arbol);
	write('Arbol por Niveles: ');
	listarPorNivel(arbol);
	readkey
end.