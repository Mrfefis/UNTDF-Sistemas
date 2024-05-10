unit interfaz;

interface

	uses crt;

	type
		Tcolores = (Rojo, Verde, Amarillo, Azul, Blanco, Gris, Cian, Morado);

	procedure CambiarColor(color: Tcolores);

	procedure Mensaje(mensaje: string; color1: Tcolores);

	procedure Separador;

	procedure Opciones(var opcion: char);

implementation

	procedure CambiarColor(color: Tcolores);
	begin
		case color of
			Azul: textcolor(lightblue);
			Verde: textcolor(lightgreen);
			Rojo: textcolor(lightred);
			Blanco: textcolor(white);
			Amarillo: textcolor(yellow);
			Cian: textcolor(lightcyan);
			Gris: textcolor(lightgray);
			Morado: textcolor(magenta)
		end;
	end;

	procedure Mensaje(mensaje: string; color1: Tcolores);
	begin
		CambiarColor(color1);
		write(Mensaje);
		CambiarColor(Blanco);
	end;

	procedure Separador;
	var
		i: integer;
	begin
		for i:=1 to 23 do
			write('- ');
		writeln;
	end;

	procedure Opciones(var opcion: char);
	begin
		Mensaje('1. Cargar numero', Amarillo);
		writeln;
		Mensaje('2. Listar pila', Verde);
		writeln;
		Mensaje('0. Salir', Azul);
		writeln;
		opcion:= readkey
	end;

end.