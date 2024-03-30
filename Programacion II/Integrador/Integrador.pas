program integrador;
uses crt, SysUtils;
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
		color: integer;
	end;
	Ttablero = array[1..n, 1..n] of Tcamara;
//----------------------------------------Dibujos-------------------------------------------------

procedure Gato;
begin
	textcolor(lightblue);
	writeln(' /|  _');
	writeln('(+ - /       _  _  _____  __  __');
	writeln(' |   |   \  ( \/ )(  _  )(  )(  )');
	writeln(' |    \  /   \  /  )(_)(  )(__)(');
	writeln(' |_|_  )/    (__) (_____)(______)');
	textcolor(white);
end;

procedure Gato2;
begin
	textcolor(lightblue);
	writeln(' /|  _');
	writeln('(- + /       _  _  _____  __  __    _    _  ____  _  _   /\  /\  /\');
	writeln(' |   |   \  ( \/ )(  _  )(  )(  )  ( \/\/ )(_  _)( \( )  ||  ||  ||');
	writeln(' |    \  /   \  /  )(_)(  )(__)(    )    (  _)(_ |    |  \/  \/  \/');
	writeln(' |_|_  )/    (__) (_____)(______)  (__/\__)(____)(_)\_)  ()  ()  ()');
	textcolor(white);
end;

procedure Petia;
begin
	textcolor(lightred);
	writeln('         uu$$$$$$$$$$$uu');
	writeln('       uu$$$$$$$$$$$$$$$uu');
	writeln('     u$$$$$$$$$$$$$$$$$$$$$u');
	writeln('    u$$$$$     *$*     $$$$$u');
	writeln('     $$$u      u$u      u$$$');
	writeln('      *$$$$uu$$   $$uu$$$$*');
	writeln('        *$$$$$*   *$$$$$*');
	writeln('         u$*$*$*$*$*$*$u');
	writeln('         $$u$ $ $ $ $u$$');
	writeln('  u$       $$$u$u$u$$$    ');
	writeln('u$$$$$$$uu             uuu$$$$$$');
	writeln('$$$$$$$$$$$$$uuu   uu$$$$$***$$*');
	writeln(' ***      **$$$$$$$$$uu   **$*');
	writeln(' uuuu$$$$$$$$uu **$$$$$$$uuu$$$');
	writeln(' $$$$$$****           **$$$$$$*');
	writeln('   *$*                   **$*');
	writeln('                              ');
	textcolor(white);
end;
procedure Petia2;
begin
	textcolor(lightred);
	writeln('         uu$$$$$$$$$$$uu');
	writeln('       uu$$$$$$$$$$$$$$$uu');
	writeln('     u$$$$$$$$$$$$$$$$$$$$$u');
	writeln('    u$$$$$     *$*     $$$$$u');
	writeln('     $$$u      u$u      u$$$');
	writeln('      *$$$$uu$$   $$uu$$$$*');
	writeln('        *$$$$$*   *$$$$$*');
	writeln('         u$*$*$*$*$*$*$u');
	writeln;
	writeln('         $$u$ $ $ $ $u$$');
	writeln('  u$       $$$u$u$u$$$    ');
	writeln('u$$$$$$$uu             uuu$$$$$$');
	writeln('$$$$$$$$$$$$$uuu   uu$$$$$***$$*');
	writeln(' ***      **$$$$$$$$$uu   **$*');
	writeln(' uuuu$$$$$$$$uu **$$$$$$$uuu$$$');
	writeln(' $$$$$$****           **$$$$$$*');
	writeln('   *$*                   **$*');
	writeln('                              ');
	textcolor(white);
end;

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
			tablero[i, j].color:= 0;
		end;
end;

procedure CargarEspejos(var tablero: Ttablero);
var
	fila, columna, total: integer;
begin
	total:= 5;
	while total>0 do begin
		columna:= random(n)+1;
		fila:= random(n)+1;
		if tablero[fila, columna].espejo.tipo='-' then begin
			if random(2)=1 then
				tablero[fila, columna].espejo.tipo:= '/'
			else
				tablero[fila, columna].espejo.tipo:= '\';
			tablero[fila, columna].espejo.acertado:= false;
			dec(total)
		end
	end
end;

procedure Disparar(var tablero: Ttablero; var rayo: Trayo);
var
	color: integer;
begin
	color:= random(4)+1;
	with rayo do while (columna>0) and (columna<n+1) and (fila>0) and (fila<n+1) do begin
		tablero[fila, columna].paso:= true;
		tablero[fila, columna].color:= color;
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
				else if tablero[i,j].paso then begin
					case tablero[i, j].color of
						1: textcolor(lightred);
						2: textcolor(lightblue);
						3: textcolor(yellow);
						4: textcolor(green);
						else textcolor(white)
					end;
					write(' x');
					textcolor(white);
					write('|');
				end
				else
					write(' ',tablero[i,j].espejo.tipo, '|');
			end
			else if tablero[i,j].espejo.acertado then
				write(' ',tablero[i,j].espejo.tipo, '|')
			else
				write(' -|');
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
	readln(fila); writeln;
	write('Columna: ');
	readln(Columna); writeln;
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
	clrscr;
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
	writeln('    1. Jugar'); writeln;
	if visible then
		writeln('    2. Ocultar Espejos')
	else
		writeln('    2. Mostrar Espejos');
	writeln;
	writeln('    0. Salir');
	opcion:= readkey
end;

procedure ElegirNivel(var disparos: integer);
var
	nivel: char;
begin
	writeln('    Nivel 1.'); writeln;
	writeln('    Nivel 2.'); writeln;
	writeln('    Atras 0.');
	nivel:= readkey;
	case nivel of
		'1': disparos:= 20;
		'2': disparos:= 10;
		else disparos:= 0
	end
end;

procedure Opciones(var opcion: char; disparos, aciertos: integer; disparo: boolean; rayo: Trayo);
begin
	writeln;
	write('Puntaje = ', 2*aciertos, '':10,'Disparos = ', disparos);
	if disparo then write('':5,'Ultimo disparo: ', rayo.valorinicial,', ', Salida(rayo));
	writeln; writeln;
	if disparos>0 then writeln('1. Disparar', #10)
	else writeln('1. Finalizar', #10);
	if disparo then writeln('2. Estimar', #10);
	writeln('0. Salir al Menu'); writeln;
	opcion:= readkey
end;

procedure MenudeJuego(var tablero: Ttablero; var rayo: Trayo; var aciertos, disparos: integer; var disparo, rendirse: boolean);
var
	opcion: char;
	acierto: boolean;
	aux: integer;
begin
	Opciones(opcion, disparos, aciertos, disparo, rayo);
	case opcion of
		'1': if disparos>0 then begin
			write('Desde donde quieres disparar?: ');
			readln(aux); writeln;
			Entrada(rayo, aux);
			Disparar(tablero, rayo);
			writeln('Salida: ', Salida(rayo)); writeln;
			dec(disparos);
			disparo:= true;
			writeln('Presiones cualquier tecla para continuar...');
			readkey;
			end
			else dec(disparos);
		'2': if disparo then begin 
			Estimar(tablero, acierto);
			if acierto then inc(aciertos);
			disparo:= false;
			writeln;
			writeln('Presiones cualquier tecla para continuar...');
			readkey;
		end;
		'0': rendirse:= true;
	end;
end;

procedure Perdio(aciertos: integer);
var
	presionada: boolean;
begin
	presionada:= false;
	repeat
		clrscr;
		if (aciertos<5) then Petia
		else Gato;
		writeln; writeln('Presiones cualquier tecla para continuar...');
		delay(500);
		clrscr;
		if (aciertos<5) then Petia2
		else Gato2;
		writeln; writeln('Presiones cualquier tecla para continuar...');
		delay(500);
		if KeyPressed then
			presionada:= true
	until (presionada);
	readkey;
end;

procedure Puntuacion(aciertos, disparos: integer);
begin
	inc(disparos);
	writeln;
	writeln('   Total de aciertos  : ', aciertos:2, ' x2   ', 2*aciertos:2);
	writeln('                              +');
	writeln('   Disparos Sobrantes : ', disparos:2, ' x1   ', disparos:2);
	writeln('                              ____');
	writeln('   Puntaje total      : ', '':8,(2*aciertos + disparos):2); writeln;
	writeln('   Presiona cualquier tecla para continuar');
	readkey; 
end;

//----------------------------------Programa Principal--------------------------------------------

var
	opcion: char;
	disparo, visible, redirse: boolean;
	tablero: Ttablero;
	disparos, aciertos: integer;
	ultimoDisparo: Trayo;
begin
	Randomize;
	visible:= false;
	repeat
		Presentacion(visible);
		MenuPrincipal(opcion, visible);
		if opcion='1' then begin
			Presentacion(visible);
			ElegirNivel(disparos);
			if disparos<>0 then begin
				Inicializar(tablero);
				CargarEspejos(tablero);
				aciertos:= 0;
				disparo:= false;
				redirse:= false;
				while (disparos>-1) and (aciertos<5) and (not redirse) do begin
					Presentacion(visible);
					MostrarTabla(tablero, visible);
					MenudeJuego(tablero, ultimoDisparo, aciertos, disparos, disparo, redirse);
				end;
				if not redirse then begin
					Perdio(aciertos);
					Presentacion(visible);
					MostrarTabla(tablero, true);
					Puntuacion(aciertos, disparos);
				end
			end
		end
		else if opcion='2' then visible:= not visible;
	until (opcion='0')
end.