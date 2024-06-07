program main;
uses crt, Uhash;
{
	Consigna:
	En una biblioteca, los socios son almacenados usando como función de Hashing la que
	devuelve las tres últimas cifras del nro. de documento y como estrategia para tratar las
	colisiones direccionamiento cerrado. Asuma que la cantidad de socios no puede superar
	los 1000.
	a) Declare la estructura de datos que permitirá realizar el armado y posterior
	utilización.
	b) Genere una función para almacenar un nuevo socio.
	c) Genere un subprograma que permita imprimir la cantidad de sinónimos que tiene
	un determinado socio.
	d) Genere un subprograma que permita imprimir por orden alfabético esos sinónimos.
}

procedure Cargar(var mapa: Tmapa);
var
	clave: Tclave;
	valor: Tvalor;
begin
	clave:= random(90000000)+10000000;
	write('Entero: ');
	readln(valor);
	insertar(mapa, clave, valor);
end;

procedure Buscar(const mapa: Tmapa);
var
	clave: Tclave;
	valor: Tvalor;
begin
	write('Clave: ');
	readln(clave);
	valor:= Uhash.buscar(mapa, clave);
	if (valor='') then
		writeln('No existe el dato')
	else
		writeln('El dato es: ', valor);
end;

procedure ImprimirSinonimos(var mapa: Tmapa);
var
	aux: Tclave;
begin
	write('Dni: ');
	readln(aux);
	Uhash.ImprimirSinonimos(mapa, aux);
end;

var
	mapa: Tmapa;
	opcion: char;
begin
	randomize;
	iniciar(mapa);
	repeat
		clrscr;
		writeln('****  Socios de la UNTDF  ****');
		writeln('1. Ingresar nuevo socio');
		writeln('2. Buscar un socio');
		writeln('3. Imprimir socios');
		writeln('4. Imprimir Sinonimos de un Socio');
		writeln('0. Terminar');
		opcion:= readkey;
		case opcion of
			'1': Cargar(mapa);
			'2': begin
				Buscar(mapa);
				readkey;
			end;
			'3': begin
				Imprimir(mapa);
				readkey
			end;
			'4': ImprimirSinonimos(mapa);
		end
	until(opcion='0')
end.