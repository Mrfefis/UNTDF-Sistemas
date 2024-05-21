program ListasConPolinomios;
uses crt, UlistaSimple, Umonomio;
{
	Consigna:
	4- Un polinomio de la forma:
	A . Xn + B . Xn-1 + ... + G
	Se almacena en una lista encadenada, para lo que se van leyendo sucesivamente los pares
	coeficiente-exponente ( (A,n) , (B,n-1) , .... , (G,0) ).
	Cada elemento de la lista tiene los dos valores numéricos indicados y un puntero al
	siguiente nodo:
	a- Escribir un procedimiento que lea los datos de la forma indicada y los almacene en la
	lista.
	b- Escribir una función que devuelva el valor del polinomio guardado en la lista, para un
	valor A para la indeterminada X (EVALUAPOLIN (PUNTERO , X) ).
}

type
	Tpolinomio = Tlista;

procedure Opciones(var opcion: char);
begin
	writeln('1. Agregar Monomio');
	writeln('2. Eliminar Monomio');
	writeln('3. Cambiar Monomio');
	writeln('4. Evaluar Polinomio');
	writeln('0. Salir');
	opcion:= readkey;
end;

procedure Cargar(var Polinomio: Tpolinomio);
var
	monomio: Tmonomio;
begin
	write('Coeficiente: ');
	readln(monomio.coeficiente);
	write('Exponente: ');
	readln(monomio.exponente);
	insertarFinal(Polinomio, monomio);
end;

procedure Alterar(var Polinomio: Tpolinomio);
var
	posicion, limite: Tindice;
	monomio: Tmonomio;
begin
	write('Posicion: ');
	readln(posicion);
	limite:= longitud(Polinomio);
	if ((posicion<1) or (posicion>limite)) then
	begin
		writeln('No existe dicha posicion');
		readkey;
	end
	else
	begin
		write('Coeficiente: ');
		readln(monomio.coeficiente);
		write('Exponente: ');
		readln(monomio.exponente);
		UlistaSimple.alterar(Polinomio, posicion, monomio);
	end;
end;

procedure MostrarPolinomio(Polinomio: Tpolinomio);
var
	elemento: Tmonomio;
	i, limite: Tindice;
begin
	limite:= longitud(Polinomio);
	if (limite>0) then
	begin
		elemento:= recuperar(Polinomio, 1);
		Umonomio.mostrar(elemento);
		for i:= 2 to limite do
		begin
			elemento:= recuperar(Polinomio, i);
			if (elemento.coeficiente>=0) then
				write(' +')
			else
				write(' ');
			Umonomio.mostrar(elemento);
		end;
	end;
	writeln;
end;

function Elevar(variable: real; exponente: word): real;
var
	i: word;
begin
	if (exponente=0) then
		Elevar:= 1
	else
	begin
		Elevar:= variable;
		for i:= 2 to exponente do
			Elevar:= Elevar*variable;
	end;
end;

function EvaluarPolinomio(Polinomio: Tpolinomio; variable: real): real;
var
	monomio: Tmonomio;
	i, limite: Tindice;
begin
	EvaluarPolinomio:= 0.0;
	limite:= longitud(Polinomio);
	for i:= 1 to limite do
	begin
		monomio:= recuperar(Polinomio, i);
		EvaluarPolinomio:= EvaluarPolinomio + monomio.coeficiente*Elevar(variable,monomio.exponente);
	end;
end;

procedure Calcular(Polinomio: Tpolinomio);
var
	variable: real;
begin
	write('Ingresa un valor para x:');
	readln(variable);
	writeln('P(', variable:0:2, ') = ', EvaluarPolinomio(Polinomio, variable):0:2);
	readkey;
end;

var
	Polinomio: Tpolinomio;
	opcion: char;
	monomio: Tmonomio;
begin
	iniciar(Polinomio);
	repeat
		clrscr;
		write('P(x) = ');
		MostrarPolinomio(Polinomio);
		Opciones(opcion);
		case (opcion) of
			'1': Cargar(Polinomio);
			'2': if not vacia(Polinomio) then EliminarFinal(Polinomio, monomio);
			'3': Alterar(Polinomio);
			'4': Calcular(Polinomio);
		end;
	until (opcion='0');
end.