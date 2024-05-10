unit Umenu1;

interface

	uses crt;

	type

		Tcolores = (Rojo, Azul, Verde, Blanco, Amarillo);

	procedure Opciones(var opcion: char);

	procedure Colorear(color: Tcolores);

	procedure Mensaje(men: string; color: Tcolores);

implementation

	procedure Colorear(color: Tcolores);
	begin
		case color of
			Rojo: textcolor(lightred);
			Amarillo: textcolor(yellow);
			Azul: textcolor(lightblue);
			Verde: textcolor(green);
			Blanco: textcolor(white);
		end
	end;

	procedure Mensaje(men: string; color: Tcolores);
	begin
		Colorear(color);
		write(men);
		Colorear(Blanco);
	end;

	procedure Opciones(var opcion: char);
	begin
		clrscr;
		Mensaje('1. Cargar al inicio', Rojo);
		writeln;
		Mensaje('2. Cargar al final', Azul);
		writeln;
		Mensaje('3. Listar', Amarillo);
		writeln;
		Mensaje('0. Terminar.', Verde);
		opcion:= readkey;
		clrscr;
	end;

end.