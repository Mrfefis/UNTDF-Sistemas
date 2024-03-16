program integrador;
uses crt;
const
	n = 10;
type
	Trayo = record
		valorinicial, fila, columna: integer;
		trayectoria: string[5];
	end;
	Tespejo = record
		tipo: string;
		acertado: boolean;
	end;
	Tcamara = record
		espejo: Tespejo;
		paso: boolean; //Si paso el rayo o no
	end;
	Ttablero = array[1..n, 1..n] of Tcamara;

//-----------------------------------Manejo del Rayo----------------------------------------------

procedure Entrada(var rayo: Trayo; aux: integer);
begin
	with rayo do case aux of
		0..n-1: begin
			columna:= 1;
			fila:= n-aux;
			trayectoria:= 'right';
		end;
		n..2*n-1: begin
			columna:= aux-n+1;
			fila:= 1;
			trayectoria:= 'down';
		end;
		2*n..3*n-1: begin
			columna:= n;
			fila:= -2*n+aux+1;
			trayectoria:= 'left';
		end;
		3*n..4*n-1: begin
			columna:= 4*n-aux;
			fila:= n;
			trayectoria:= 'up';
		end
	end;
	rayo.valorinicial:= aux;
end;

function Salida(var rayo: Trayo): integer;
begin
	case rayo.trayectoria of
		'up': salida:= rayo.columna + n - 1;
		'down': salida:= 4*n-rayo.columna;
		'left': salida:= n - rayo.fila;
		'right': salida:= 2*n-1 + rayo.fila;
	end;
end;

//---------------------------------------Manejo del Tablero---------------------------------------

procedure Inicializar(var tablero: Ttablero);
var
	i, j: integer;
begin
	for i:= 1 to n do
		for j:= 1 to n do begin
			tablero[i, j].espejo.tipo:= '-';
			tablero[i, j].espejo.acertado:= false;
			tablero[i, j].paso:= false;
		end;
end;

procedure CargarEspejos(var tablero: Ttablero);
var
	fila, columna, i, total: integer;
	repitioc, repitiof: array[1..n] of integer;
begin
	total:= 5;
	for i:=1 to n do begin
		repitioc[i]:= 0;
		repitiof[i]:= 0;
	end;
	while total>0 do begin
		columna:= random(n)+1;
		fila:= random(n)+1;
		if (repitioc[columna]<>columna) or (repitiof[fila]<>fila) then begin
			if random(2)=1 then
				tablero[fila, columna].espejo.tipo:= '/'
			else
				tablero[fila, columna].espejo.tipo:= '\';
			dec(total)
		end
	end
end;

procedure Disparar(var tablero: Ttablero; var rayo: Trayo);
begin
	with rayo do while (columna>0) and (columna<n+1) and (fila>0) and (fila<n+1) do begin
		tablero[fila, columna].paso:= true;
		if tablero[fila, columna].espejo.tipo='/' then
			case trayectoria of
				'up': trayectoria:= 'right';
				'right': trayectoria:= 'up';
				'down': trayectoria:= 'left';
				'left': trayectoria:= 'down';
			end
		else if tablero[fila, columna].espejo.tipo='\' then
			case trayectoria of
				'up': trayectoria:= 'left';
				'left': trayectoria:= 'up';
				'down': trayectoria:= 'right';
				'right': trayectoria:= 'down';
			end;
		case trayectoria of
			'up': dec(fila);
			'down': inc(fila);
			'right': inc(columna);
			'left': dec(columna);
		end;
	end;
end;

procedure MostrarTabla(const tablero: Ttablero; visible: boolean);
var
	i, j: integer;
begin
	write('   |');
	for i:=n to 2*n-1 do begin
		write(i, '|')
	end;
	writeln;

	for i:=1 to n do begin
		write(' ', n-i:2,'|');
		for j:=1 to n do
			if visible then begin
				if tablero[i,j].espejo.tipo<>'-' then
					write(' ',tablero[i,j].espejo.tipo, '|')
				else if tablero[i,j].paso then
					write(' x|')
				else
					write(' ',tablero[i,j].espejo.tipo, '|');
			end
			else write(' -|');
		writeln(i+2*n-1);
	end;

	write('   |');
	for i:=4*n-1 downto 3*n do begin
		write(i, '|')
	end;
	writeln;
end;

procedure Estimar(var tablero: Ttablero; var acierto: boolean);
var
	fila, columna: integer; 
	rayofila, rayocolumna: Trayo;
begin
	write('Fila: ');
	readln(fila);
	write('Columna: ');
	readln(Columna);
	Entrada(rayofila, fila);
	Entrada(rayocolumna, columna);
	with tablero[rayofila.fila, rayocolumna.columna].espejo do begin
		acierto:= tipo<>'-';
		if acierto then begin
			writeln('Hay un espejo en (',fila,', ', columna, ')');
			if acertado then
				acierto:= false
			else
				acertado:= true
		end
		else writeln('Error');
	end
end;

//-----------------------------------Interfaz Grafica---------------------------------------------

procedure Presentacion(visible: boolean);
var
	i: integer;
begin
	write('    ');
	for i:=1 to 3*n-1 do write('-');
	writeln;

	write('    ');
	write('':n-1);
	if visible then
		write('CAJA BLANCA')
	else
		write('CAJA NEGRA');
	writeln;

	write('    ');
	for i:=1 to 3*n-1 do write('-');
	writeln;
end;

procedure MenuPrincipal(var opcion: char; visible: boolean);
begin
	writeln('    1- Jugar.');
	if visible then
		writeln('    2- Ocultar Espejos.')
	else
		writeln('    2- Mostrar Espejos.');
	writeln('    3- Salir.');
	write('    Opcion: ');
	readln(opcion);
end;

procedure ElegirNivel(var nivel: integer; visible: boolean);
begin
	clrscr;
	Presentacion(visible);
	writeln('    Nivel 1.');
	writeln('    Nivel 2.');
	writeln('    Atras 3.');
	write('    Opcion: ');
	readln(nivel);
end;

procedure MenudeJuego(var opcion: char; aciertos, total: integer);
begin
	writeln;
	writeln('1. Estimar(aciertos=',aciertos,')');
	writeln('2. Disparar(Disponibles=',total,')');
	writeln('3. Terminar Juego');
	write('Opcion: ');
	readln(opcion);
end;

procedure IniciarJuego(var tablero: Ttablero; nivel: integer; visible: boolean);
var
	rayo: Trayo;
	total, puntuacion, aciertos, aux: integer;
	opcion: char;
	acierto: boolean;
begin
	total:= 0;
	puntuacion:= 0;
	aciertos:= 0;
	if nivel=1 then
		total:= 20
	else if nivel=2 then
		total:= 10;
	if total<>0 then begin
		while (total>0) and (aciertos<5) do begin
			clrscr;
			Presentacion(visible);
			MostrarTabla(tablero, visible);
			MenudeJuego(opcion, aciertos, total);
			case opcion of
				'1': begin 
					Estimar(tablero, acierto);
					if acierto then inc(aciertos);
				end;
				'2': begin
					write('Desde donde quieres disparar?: ');
					readln(aux);
					Entrada(rayo, aux);
					Disparar(tablero, rayo);
					writeln('Salida: ', Salida(rayo));
					dec(total);
				end;
				'3': total:= 0;
			end;
			if opcion<>'3' then begin
				writeln('Presiones cualquier tecla para continuar...');
				readkey;
			end
		end;
		clrscr;
		Presentacion(visible);
		MostrarTabla(tablero, true);
		puntuacion:= total + 2*aciertos;
		writeln('Total Puntos: ', puntuacion);
		writeln('Total Aciertos: ', aciertos);
		writeln('Presiones cualquier tecla para continuar...');
		readkey;
	end
end;

//----------------------------------Programa Principal--------------------------------------------

var
	opcion: char;
	visible: boolean;
	tablero: Ttablero;
	nivel: integer;
begin
	Randomize;
	visible:= false;
	repeat
		clrscr;
		Presentacion(visible);
		MenuPrincipal(opcion, visible);
		case opcion of
			'1': begin
				ElegirNivel(nivel, visible);
				if nivel<>3 then begin
					Inicializar(tablero);
					CargarEspejos(tablero);
					IniciarJuego(tablero, nivel, visible);
				end
			end;
			'2': visible:= not visible;
		end;
	until(opcion='3')
end.