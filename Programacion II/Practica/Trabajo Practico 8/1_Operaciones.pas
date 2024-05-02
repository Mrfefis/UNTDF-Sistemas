program Operaciones;
uses crt;

type
	Tpuntero = ^integer;

procedure intercambiar(var p, q: Tpuntero);
var
	r: Tpuntero;
begin
	r:= p;
	p:= q;
	q:= r;
end;

procedure replace(var p: Tpuntero; q: Tpuntero);
begin
	dispose(p);
	p:= q;
end;

procedure copy(var p: Tpuntero; q: Tpuntero);
begin
	new(p);
	p^:= q^;
end;

var
	p, q: Tpuntero;
begin
	new(p);
	new(q);
	write('Numero 1: ');
	readln(p^);
	write('Numero 2: ');
	readln(q^);
	intercambiar(p, q);
	writeln('Numero 1: ', p^);
	writeln('Numero 2: ', q^);
	replace(p, q);
	writeln('Numero 1 y 2: ', p^, ' ', q^);
	writeln('P=Q? -> ', p=q);
	copy(p, q);
	writeln('Numero 1: ', p^);
	writeln('Numero 2: ', q^);
	writeln('P=Q? -> ', p=q);
	readln
end.