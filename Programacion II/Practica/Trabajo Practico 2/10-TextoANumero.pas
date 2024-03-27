program TextoaNumero;
uses crt;
{
	Consigna:
	Escribir un procedimiento que lea una cadena de caracteres e ignore 
	cualquier caracter que no sea dígito, calculando el número formado por los dígitos
	Ej.: cadena leída $4#5,4*3YJ0P% valor NUMÉRICO devuelto: 45430
}

procedure Presentacion;
begin
	writeln('Calculadora':20);
	writeln;
end;

procedure Opciones(var opcion: string);
begin
	writeln('1- Sumar');
	writeln('2- Restar');
	writeln('0- Terminar');
	write('Opcion: '); readln(opcion);
end;

function StringAInt(texto: string): integer;
var
	i: integer;
	total: integer;
begin
	total:= 0;
	for i:=1 to length(texto) do
		if (texto[i]>='0') and (texto[i]<='9') then
			total:= 10*total + ord(texto[i]) - ord('0');
	StringAInt:= total;
end;

procedure PedirDatos(var num1, num2: integer);
var
	aux1, aux2: string;
begin
	write('Ingresa el primer valor: '); readln(aux1);
	write('Ingresa el segundo valor: '); readln(aux2);
	writeln;
	num1:= StringAInt(aux1);
	num2:= StringAInt(aux2);
end;

var
	opcion: string;
	num1, num2: integer;
begin
	repeat
		clrscr;
		Presentacion;
		Opciones(opcion);
		case opcion of
			'0': ;
			'1'..'5': begin
				PedirDatos(num1, num2);
				case opcion of
				'1': writeln('La suma es: ', num1 + num2);
				'2': writeln('La resta es: ', num1 - num2);
				end;
				readkey
			end;
			else begin
				writeln('Error, opcion incorrecta');
				writeln('Presiona cualquier tecla para continuar...')
			end
		end
	until(opcion='0');
end.