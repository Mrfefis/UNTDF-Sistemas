program probando;
uses crt, UlistaSimple;

procedure Opciones(var opcion: char);
begin
	writeln('1. Buscar elemento');
	writeln('2. Agregar fibonacci');
	writeln('0. Terminar.');
	opcion:= readkey;
end;

procedure Agregar(var lista: Tlista);
var
	elemento1, elemento2: Tinfo;
begin
	EliminarFinal(lista, elemento1);
	EliminarFinal(lista, elemento2);
	InsertarFinal(lista, elemento2);
	InsertarFinal(lista, elemento1);
	InsertarFinal(lista, elemento1 + elemento2);
end;

procedure BuscarFibonacci(var lista: Tlista);
var
	indice, limite: Tindice;
begin
	limite:= longitud(lista);
	write('Dame el fibonacci que quieres: ');
	readln(indice);
	if (indice>0) then
	begin
		if (indice>=1) and (indice<=limite) then
			writeln('El elemento es: ', recuperar(lista, indice))
		else
		begin
			while (limite<indice) do
			begin
				Agregar(lista);
				inc(limite)
			end;
			writeln('El elemento es: ', recuperar(lista, indice));
		end;
	end;
end;

var
	lista: Tlista;
begin
	iniciar(lista);
	insertar(lista, 1, 1);
	insertar(lista, 1,  1);
	clrscr;
	BuscarFibonacci(lista);
	listar(lista);
	readkey;
end.