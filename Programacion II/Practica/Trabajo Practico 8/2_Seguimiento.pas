program Seguimiento;
uses crt;

type
	Tpuntero = ^nodo;
	nodo = record
		info: integer;
		sig: Tpuntero;
	end;

procedure inicializar(var p, q, r: Tpuntero);
begin
	new(p);
	new(q);
	new(r);
	p^.sig:= q;
	q^.sig:= r;
	r^.sig:= NIL;
end;

procedure cargar(var p, q, r: Tpuntero);
begin
	p^.info:= 3;
	q^.info:= 5;
	r^.info:= 9;
end;

function siguiente(p, q, r: Tpuntero): char;
begin
	if p^.sig=q then
		siguiente:= 'q'
	else if p^.sig=r then
		siguiente:= 'r'
	else if p^.sig=p then
		siguiente:= 'p'
	else
		siguiente:= '0'
end;

procedure mostrar(p, q, r: Tpuntero);
begin
	writeln('P[',p^.info,'] ');
	writeln('Q[',q^.info,'] ');
	writeln('R[',r^.info,'] ');
	writeln;
end;

var
	p, q, r: Tpuntero;
begin
	inicializar(p, q, r);
	cargar(p, q, r);
	mostrar(p, q, r);
	// Que hacen estas operaciones?
	p:= p^.sig;
	writeln('P y Q apuntan al nodo [',p^.info,']');
	q:= p;
	p^.info:= q^.info;
	p^.info:= q^.sig^.info;
	r^.sig:= p;
	mostrar(p, q, r);
	readkey
end.