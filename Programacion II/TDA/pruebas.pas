program Pruebas;
uses crt, Ulist;
{
	Consigna:

}

// ---------------------------------SUBPROGRAMAS---------------------------------

// ------------------------------PROGRAMA PRINCIPAL------------------------------
var
	list: Tlist;
begin
	initlist(list);
	addlist(list, first(list), 5);
	addlist(list, first(list), 4);
	addlist(list, first(list), 3);
	printlist(list);
	readkey
end.