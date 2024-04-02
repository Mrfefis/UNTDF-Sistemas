program casino;
uses crt;

{
	Consigna:
  Realizar un programa en Pascal, para resolver el siguiente problema:
  El casino de la ciudad de Necochea decide llevar a cabo un estudio estadístico sobre
  ingresos-egresos efectuados durante el receso de invierno a fin de tener una proyección
  de lo que podrá ocurrir durante la temporada estival.
  Durante las vacaciones de invierno el casino abre solamente 10 mesas de ruleta y tres
  de punto y banca. el seguimiento se lleva a cabo durante tres fines de semana
  consecutivos (se tiene en cuenta viernes, sábado y Domingo). De cada mesa se dispone
  de la siguiente información:
  nombre de los croupier (tres por mesa)
  monto en pesos correspondiente a la cantidad de fichas que posee la mesa al:
  1) abrir el casino
  2) cerrar el casino
  monto máximo pagado en una jugada en la mesa.
  Se desea guardar toda la información en la memoria de una computadora con la
  estructura más adecuada, obtener e imprimir:
  a) El o los días en que el casino ganó más.
  b) El o los días en que el casino perdió más.
  c) El fin de semana en el que casino ganó más.
  d) En promedio cuánto gana por día el casino y cuáles fueron los días en el que el casino
  ganó menos que el promedio diario.
  e) Dado un día que se ingresa por el teclado, imprimir el máximo ganado en una sola
	jugada por los apostadores en las mesas de punto y banca y el nombre de los
	croupier que estaban en la mesa.
}

const n=13;
type

	Tfinde = (Viernes, Sabado, Domingo);

	Tmesa = record
  	croopier1, croopier2, croopier3: string;
  end;

	Tdia = record
  	dia: Tfinde;
    mesas: array[1..n] of Tmesa;
    monto_inicial, monto_final, monto_max: real;
  end;

  Tsemana = array[1..3] of Tdia;

procedure Inicializar(var semana: Tsemana);
var
	i, j: integer;
begin
	for j:=1 to 3 do with semana[j] do begin
    for i:=1 to n do with mesas[i] do begin
    	croopier1:= '';
      croopier2:= '';
      croopier3:= '';
    end
  end;
  semana[1].dia:= Viernes;
  semana[2].dia:= Sabado;
  semana[3].dia:= Domingo;
end;

procedure PedirMonto (var dia:Tdia);
	begin
   	with dia do begin  
      write ('Monto Inicial: ');
      readln (monto_inicial);
      write ('Monto Final: ');
      readln (monto_final);
      write ('Monto Maximo: ');
      readln (monto_max);
    end;
	end;

procedure CargarMesa(var mesa:Tmesa);
	begin
    with mesa do begin
    write('Pedir croopier 1: ');
    readln (croopier1);
    write('Pedir croopier 2: ');
    readln (croopier2);
    write('Pedir croopier 3: ');
    readln (croopier3);
    end;
  end;
{
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣤⣶⣶⣶⣶⣶⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀
⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆
⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣋⣩⣭⣭⣭⣉⡻⣿⣿⣿⣿⣿⣿
⠀⣠⣴⣭⣹⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⢣⣼⣿⣿⠛⠁⠘⠿⠿⢻⣿⣿⣿⣿⣿
⠀⠛⠛⠁⣿⣿⡯⣫⣤⣴⣶⣶⣤⣭⣛⡸⣿⣿⣇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿
⠀⠀⢀⣴⣷⠬⣉⣀⣈⣹⣿⣿⣿⣿⣿⣷⣮⣝⣛⣯⣤⣤⣤⣤⣭⣛⠿⣿⣿⣿
⠀⠈⠉⣽⣶⣶⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢛⡛⠛⠿⣿⣿⣷⡌⢻⣿
⣀⢰⣿⣦⡝⠛⢷⣮⡛⠻⣿⣿⣿⠿⢛⣫⣵⣶⣿⣿⣿⣿⣿⣿⣿⠿⠛⣣⣾⣿
⣿⢸⣿⡿⠀⣿⣶⣝⢿⣿⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⡿⠟⣩⣵⣶⠇⣿⣿⣿⢹
⣿⢸⣿⠀⡇⢹⣿⣿⡶⠎⣙⠿⠿⠿⠿⠿⢟⣛⣩⣴⣾⣿⣿⣿⡟⣸⣿⣿⠇⣸
⣿⡇⠛⢠⣿⡀⣿⣿⠀⠀⠀⠈⠛⠻⠿⠿⣿⣿⠿⠿⠛⠛⠛⠁⠀⣿⡿⠃⠀⣿
⣿⣿⣧⣿⣿⣷⡘⢿⡇⢸⣦⣤⣀⣀⡀⠀⠀⠀⠀⠀⣀⣀⣤⡄⠼⢋⣴⡇⠸⢋
⣿⣿⣿⣿⣿⣿⣷⣮⡃⣸⣿⣿⣿⣿⣿⣿⣿⣶⣾⣿⣿⣿⣿⣷⣶⣿⡿⢀⣠⣾
}
procedure pedir (var semana:Tsemana);
var
  i, j,mesa: integer;
begin
  for j:=1 to 3 do with semana[j] do
    begin
    repeat
    	clrscr;
      write ('Numero de mesa: ');
      readln (mesa);
      CargarMesa(mesas[mesa]);
    until(mesa=0);
    PedirMonto (semana[j])
    end;
end;

procedure Presentacion;
var
	i: integer;
begin
	clrscr;
	for i:=1 to 15 do write('- -');
	writeln;
	writeln(' CASINO ':20);
	for i:=1 to 15 do write('- -');
	writeln;
end;

procedure Opciones(var opcion: char);
begin
	writeln;
	writeln('Mostrar Mesas (1)'); writeln;
	writeln('Salir del Sistema (0)');
	opcion:= readkey
end;

procedure MostrarMesas(Semana: Tsemana);
begin
end;

var
	Semana1, Semana2, Semana3: Tsemana;
  opcion: char;
begin
	Inicializar(Semana1);
  Inicializar(Semana2);
  Inicializar(Semana3);
  repeat
  	Presentacion;
  	Opciones(opcion);
    case opcion of
    	'1': begin
      	MostrarMesas(Semana1);
        MostrarMesas(Semana2);
        MostrarMesas(Semana3);
      end;
      '2': ;
    end;
  until(opcion='0');
end.