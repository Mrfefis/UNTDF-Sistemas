procedure cargar(var lista: Tlist; opcion: char);
var
	elemento: Telement;
begin
	Mensaje('Numero entero: ', Azul);
	readln(elemento);
	if opcion='1' then
		Ulist.appfirst(lista, elemento)
	else
		Ulist.append(lista, elemento)
end;

procedure listar(lista: Tlist);
var
	i: Tposicion;
begin
	write('[');
	if not empty(lista) then begin
		for i:=1 to length(lista)-1 do begin
			write(Ulist.recuperate(lista, i), ', ');
		end;
		write(Ulist.recuperate(lista, length(lista)));
	end;
	writeln(']');
	readln
end;