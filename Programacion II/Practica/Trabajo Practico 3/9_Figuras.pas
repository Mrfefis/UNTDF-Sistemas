program FigurasGeometricas;
uses crt;
{
	Consigna:
	Escribir la declaración de un registro que tenga una parte variante para cuatro figuras
	geométricas: TRIÁNGULO, RECTÁNGULO, CUADRADO y CIRCULO.
	Para el TRIÁNGULO se debe almacenar el valor de los tres lados;
	para el RECTÁNGULO el de su base y su altura;para el CUADRADO, el de su lado;
	y para el CIRCULO su radio.
	Escribir un programa en Pascal que lea una letra T (TRIÁNGULO), R (RECTÁNGULO),
	C (CUADRADO) y X (CIRCULO); y a continuación calcule el área
	NOTAS
	AREA DE TRIÁNGULO: [ p(p-a)(p-b)(p-c) ]1/2 p=(a+b+c)/2
	AREA DE RECTÁNGULO : base x altura
	AREA DE CUADRADO : lado2
	AREA DE CIRCULO : π x radio2
}
const
	pi = 3.1415;
type
	Tvalor = (TRIANGULO, RECTANGULO, CUADRADO, CIRCULO);
	Tfigura = record
		case tipo: Tvalor of
		TRIANGULO: (lado1, lado2, lado3: word);
		RECTANGULO: (base, altura: word);
		CUADRADO: (lado: word);
		CIRCULO: (radio: word);
	end;

procedure Cargar(var Registro: Tfigura);
begin
	with Registro do case tipo of
		TRIANGULO: begin
			writeln('TRIANGULO':20);
			write('Lado1: '); readln(lado1);
			write('Lado2: '); readln(lado2);
			write('Lado3: '); readln(lado3);
		end;
		RECTANGULO: begin
			writeln('RECTANGULO':20);
			write('Base: '); readln(base);
			write('Altura: '); readln(altura);
		end;
		CUADRADO: begin
			writeln('CUADRADO':20);
			write('Lado: '); readln(lado);
		end;
		CIRCULO: begin
			writeln('CIRCULO':20);
			write('Radio: '); readln(radio);
		end;
	end
end;

procedure SeleccionarTipo(var figura: Tfigura; opcion: char);
begin
	with figura do case opcion of
		'T': tipo:= TRIANGULO;
		'R': tipo:= RECTANGULO;
		'C': tipo:= CUADRADO;
		'X': tipo:= CIRCULO;
	end;
end;

procedure Opciones(var opcion: char);
begin
	writeln('Calculo de Areas':30); writeln;
	writeln('':5,'T (TRIANGULO)');
	writeln('':5,'R (RECTANGULO)');
	writeln('':5,'C (CUADRADO)');
	writeln('':5,'X (CIRCULO)');
	writeln('':5,'ENTER (SALIR)');
	opcion:= readkey;
end;

function Area(const figura: Tfigura): real;
var
	p: real;
begin
	with figura do case tipo of
		TRIANGULO: begin
			p:= (lado1 + lado2 + lado3) / 2;
			Area:= sqrt(p*(p-lado1)*(p-lado2)*(p-lado3))
		end;
		RECTANGULO: Area:= base*altura;
		CUADRADO: Area:= sqr(lado);
		CIRCULO: Area:= pi*sqr(radio);
	end
end;

var
	figura: Tfigura;
	opcion: char;
begin
	Opciones(opcion);
	while (opcion<>#13) do begin
		case opcion of
			'T', 'R', 'C', 'X': begin
				clrscr;
				SeleccionarTipo(figura, opcion);
				Cargar(figura);
				writeln;
				writeln('El area de la figura es: ', Area(figura):0:2, 'u^2');
				readkey
			end;
		end;
		clrscr;
		Opciones(opcion)
	end
end.