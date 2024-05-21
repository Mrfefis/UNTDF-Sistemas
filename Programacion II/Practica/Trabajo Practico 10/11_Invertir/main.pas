program main;
uses crt, Ucola, UcolaCircular;
{
	Consigna:
	Realice un procedimiento que permita invertir los elementos de una Cola, para:
	a) Cola No circular
	b) Cola circular.
}
procedure Cargar(var cola: Ucola.Tcola; var colaCircular: UcolaCircular.Tcola);
var
	i: integer;
begin
	for i:=1 to random(20)+10 do
	begin
		Ucola.insertar(cola, random(40));
		UcolaCircular.insertar(colaCircular, random(40));
	end
end;

procedure Imprimir(var cola: Ucola.Tcola; var colaCircular: UcolaCircular.Tcola);
var
	i: integer;
	copia1: Ucola.Tcola;
	copia2: UcolaCircular.Tcola;
begin
	Ucola.iniciar(copia1);
	UcolaCircular.iniciar(copia2);
	write('Cola normal   = ');
	while not Ucola.vacia(cola) do
	begin
		Ucola.eliminar(cola, i);
		Ucola.insertar(copia1, i);
		if (i>=0) and (i<10) then
			write('0':2, i)
		else
			write(i:3);
	end;
	cola:= copia1;
	writeln;
	write('Cola circular = ');
	while not UcolaCircular.vacia(colaCircular) do
	begin
		UcolaCircular.eliminar(colaCircular, i);
		UcolaCircular.insertar(copia2, i);
		if (i>=0) and (i<10) then
			write('0':2, i)
		else
			write(i:3);
	end;
	colaCircular:= copia2;
end;

var
	cola: Ucola.Tcola;
	colaCircular: UcolaCircular.Tcola;
begin
	Randomize;
	Ucola.iniciar(cola);
	UcolaCircular.iniciar(colaCircular);
	Cargar(cola, colaCircular);
	Imprimir(cola, colaCircular);
	writeln;
	writeln;
	Ucola.invertir(cola);
	UcolaCircular.invertir(colaCircular);
	Imprimir(cola, colaCircular);
	readkey
end.