program main;
uses crt, Uopciones, Ulista;
{
	Consigna:
	Escribase un programa para intercalar
	a) dos listas clasificadas.
	b) n listas clasificadas.
}

// ---------------------------------SUBPROGRAMAS---------------------------------

procedure IntercalarListas(lista1, lista2: Tlista; var intercaladas: Tlista);
var
	p, q: Tindice;
	aux: boolean;
begin
	p:= primero(lista1);
	q:= primero(lista2);
	aux:= true;
	while (p<>fin(lista1)) and (q<>fin(lista2)) do begin
		if aux then begin
			agregar(intercaladas, fin(intercaladas), recuperar(lista1, p));
			p:= siguiente(p)
		end
		else begin
			agregar(intercaladas, fin(intercaladas), recuperar(lista2, q));
			q:= siguiente(q)
		end;
		aux:= not aux;
	end;
	while (p<>fin(lista1)) do begin
		agregar(intercaladas, fin(intercaladas), recuperar(lista1, p));
		p:= siguiente(p)
	end;
	while (q<>fin(lista2)) do begin
		agregar(intercaladas, fin(intercaladas), recuperar(lista2, q));
		q:= siguiente(q)
	end;
end;

// ------------------------------PROGRAMA PRINCIPAL------------------------------

var
	lista1, lista2, intercaladas: Tlista;
begin
	Menu(lista1, 'Notas del 1er Parcial');
	Menu(lista2, 'Notas del 2do Parcial');
	clrscr;
	writeln('La lista de Notas del 1er Parcial es:');
	MostrarLista(lista1);
	writeln('La lista de Notas del 2do Parcial es:');
	MostrarLista(lista2);
	writeln('La lista intercalada de ambas es:');
	crear(intercaladas);
	IntercalarListas(lista1, lista2, intercaladas);
	MostrarLista(intercaladas);
end.