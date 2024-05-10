unit Uoperaciones;

interface

	uses Upilachar, Upilaint;

	type
		Toperadores = Upilachar.Tpila;
		Texpresion = Toperadores;
		Toperandos = Upilaint.Tpila;
		Toperador = Upilachar.Telemento;
		Toperando = Upilaint.Telemento;

	procedure StringtoExpresion(var expresion: Texpresion; cadena: string);

	procedure Mostrar(operadores: Toperadores; operandos1, operandos2: Toperandos);

implementation

	procedure StringtoExpresion(var expresion: Texpresion; cadena: string);
	var
		i, limite: byte;
	begin
		Upilachar.init(expresion);
		limite:= length(cadena);
		i:= 1;
		while not Upilachar.full(expresion) and (i<=limite) do
		begin
			if cadena[i]<>' ' then
				Upilachar.push(expresion, cadena[i]);
			inc(i)
		end;
	end;

	procedure Mostrar(operadores: Toperadores; operandos1, operandos2: Toperandos);
	var
		operador: Upilachar.Telemento;
		operando: Upilaint.Telemento;
	begin
		writeln('Operandos:');
		while not Upilachar.empty(operadores) do begin
			Upilachar.pop(operadores, operador);
			write(operador, ' ');
		end;
		writeln;
		writeln('Operandos 1:');
		while not Upilaint.empty(operandos1) do begin
			Upilaint.pop(operandos1, operando);
			write(operando, ' ');
		end;
		writeln;
		writeln('Operandos 2:');
		while not Upilaint.empty(operandos2) do begin
			Upilaint.pop(operandos2, operando);
			write(operando, ' ');
		end;
		writeln;
	end;

	procedure RealizarOperaciones(var operadores: Toperadores; var operandos1, operandos2: Toperandos);
	var
		operador: Upilachar.Telemento;
		operando1, operando2: Upilaint.Telemento;
	begin
		while not (Upilachar.empty(operadores) or Upilaint.empty(operandos1) or Upilaint.empty(operandos2)) do begin
			Upilachar.pop(operadores, operador);
			Upilaint.pop(operandos1, operando1);
			Upilaint.pop(operandos2, operando2);
			write(operando1:3, ' ', operador, ' ', operando2:3, ' = ');
			case operador of
				'+': writeln((operando1 + operando2):5);
				'-': writeln((operando1 - operando2):5);
				'*': writeln((operando1 * operando2):5);
				'/': begin
					if operando2=0 then
						writeln('Indef')
					else
						writeln((operando1 / operando2):5:2);
				end
			end;
		end;
	end;

end.