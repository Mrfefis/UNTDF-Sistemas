program main;
uses crt, UlistaArreglo, UlistaApuntadores, UlistaCursores;
{
	Consigna:
	Escríbanse programas para insertar, suprimir y localizar un elemento en una
	lista clasificada, usando realizaciones de
	a) Arreglos
	b) Apuntadores
	c) Cursores
	¿Cuál es el tiempo de ejecución de cada uno de estos programas?
}
// ---------------------------------SUBPROGRAMAS---------------------------------

procedure CrearListas(var listaArreglo: TlistaArreglo;
					  var listaPuntero: TlistaApuntadores;
					  var listaCursor: TlistaCursores);
begin
	creararreglo(listaArreglo);
	crearpuntero(listaPuntero);
	crearcursor(listaCursor);
end;

procedure CargarListaArreglo(var lista: TlistaArreglo);
var
	i: integer;
	p: Tindice;
begin
	p:= primero(lista);
	for i:= 1 to 10 do begin
		agregar(lista, p, random(80));
		p:= siguiente(p)
	end;
end;

// ------------------------------PROGRAMA PRINCIPAL------------------------------

var
	listaArreglo: TlistaArreglo;
	listaPuntero: TlistaApuntadores;
	listaCursor: TlistaCursores;
begin
	CrearListas(listaArreglo, listaPuntero, listaCursor);
	// a)
	CargarListaArreglo(listaArreglo);
	{SuprimirListaArreglo(listaArreglo);
	LocalizarListaArreglo(listaArreglo);}
	readkey
end.