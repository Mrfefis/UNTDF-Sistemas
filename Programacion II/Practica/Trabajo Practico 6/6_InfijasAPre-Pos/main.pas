program Main;
uses crt;
{
	Consigna:
	Conviértase las siguientes expresiones infijas
	en expresiones pre y postfijas
	a) ( x + m ) / ( p + q )
	b) x + m / p + q
	c) ( (m+o) + p * (q+r) + s ) * (t+u)
	d) ((( a-b) - c) - d) - e
}

procedure MostrarExpresion(infija, prefija, posfija: string);
begin
	writeln('Infija: ', infija);
	writeln('Prefija: ', prefija);
	writeln('Posfija: ', posfija);
end;

begin
	MostrarExpresion('( x + m ) / ( p + q )', '/+x m+p q', 'x m+p q+/');
	MostrarExpresion('x + m / p + q', '+x+q/m p', 'x q m p/++');
	MostrarExpresion('( (m+o) + p * (q+r) + s ) * (t+u)', '*+t u+s++m o*p+q r'
					,'m o+p q r+*+s+t u+*');
	MostrarExpresion('(((a-b)-c)-d)-e', '----a b c d e', 'a b c d e----');
end.