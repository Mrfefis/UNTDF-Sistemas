program Operaciones;
uses crt;

type
	Tpuntero = ^nodo;
	nodo = record
		info: integer;
		sig: Tpuntero;
	end;

procedure cargar(var p: Tpuntero; elemento: integer);
var
	q: Tpuntero;
begin
	new(q);
	q^.info:= elemento;
	if p=NIL then
		q^.sig:= NIL
	else
		q^.sig:= p;
	p:= q;
end;

procedure Inicializar(var p: Tpuntero);
var
	i: integer;
begin
	p:= NIL;
	for i:=4 downto 1 do
		cargar(p, i)
end;

procedure mostrar(p: Tpuntero);
begin
	if p<>NIL then
	begin
		write(p^.info, ' ');
		mostrar(p^.sig);
	end
end;

var
	Lista, P, Q, R, S: Tpuntero;
begin
	Inicializar(P);
	mostrar(P);
	writeln;
	R:= P^.sig;
	S:= R^.sig^.sig;
	// a)-
	writeln('a)');
	P:= P^.sig^.sig;
	mostrar(P);
	writeln;
	// b)-
	writeln('b)');
	mostrar(R);
	writeln;
	R:= S;
	mostrar(R);
	writeln;
	// c)-
	writeln('c)');
	Inicializar(P);
	Q:= P^.sig;
	mostrar(P);
	writeln;
	P:= Q^.sig^.sig;
	mostrar(P);
	writeln;
	// d)-
	P:= Q^.sig;
	writeln('d)');
	Inicializar(Lista);
	mostrar(Lista);
	writeln;
	mostrar(P);
	writeln;
	readkey
end.