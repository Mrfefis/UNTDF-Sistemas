program Suma;
uses Ulist, Umenu;

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

var
	lista: Tlist;
	opcion: char;
begin
	create(lista);
	repeat
		Opciones(opcion);
		case opcion of
			'1','2': Cargar(lista, opcion);
			'3': listar(lista);
		end
	until(opcion='0')
end.