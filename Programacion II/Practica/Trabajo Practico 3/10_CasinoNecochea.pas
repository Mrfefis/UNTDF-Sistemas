program Necochea;
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
const
    maxmesas = 13;
    maxcroupiers = 3;
    maxempleados = 100;
    maxsemanas = 3;
type
    Templeados = array[1..maxempleados] of string;

    Tdia = record
        mesas: array[1..maxmesas, 1..maxcroupiers] of byte;
        monto_apertura, monto_cierre, monto_max: real;
    end;

    Tfinde = (Viernes, Sabado, Domingo);

    Tsemanas = array[1..maxsemanas, Viernes..Domingo] of Tdia;

    Tcasino = record
        semanas: Tsemanas;
        empleados: Templeados;
    end;

procedure InicializarEmpleados(var empleados: Templeados);
var
    i: integer;
begin
    for i:=1 to maxempleados do
        empleados[i]:= '';
end;

procedure CargarEmpleados(var empleados: Templeados);
begin
    empleados[1]:= 'Alberto Ramirez';
    empleados[2]:= 'Beatriz Martinez';
    empleados[3]:= 'Carlos Lopez';
    empleados[4]:= 'David Sanchez';
    empleados[5]:= 'Elena Gomez';
    empleados[6]:= 'Francisco Rodriguez';
    empleados[7]:= 'Gabriela Perez';
    empleados[8]:= 'Hugo Gonzalez';
    empleados[9]:= 'Isabel Hernandez';
    empleados[10]:= 'Juan Garcia';
    empleados[11]:= 'Karina Diaz';
    empleados[12]:= 'Luis Fernandez';
    empleados[13]:= 'Maria Gonzalez';
    empleados[14]:= 'Nicolas Perez';
    empleados[15]:= 'Olivia Martinez';
    empleados[16]:= 'Pedro Sanchez';
    empleados[17]:= 'Quintin Rodriguez';
    empleados[18]:= 'Rosa Lopez';
    empleados[19]:= 'Sergio Ramirez';
    empleados[20]:= 'Teresa Gomez';
    empleados[21]:= 'Ulises Martinez';
    empleados[22]:= 'Valentina Diaz';
    empleados[23]:= 'Walter Gonzalez';
    empleados[24]:= 'Ximena Lopez';
    empleados[25]:= 'Yolanda Garcia';
    empleados[26]:= 'Zacarias Perez';
    empleados[27]:= 'Ana Martinez';
    empleados[28]:= 'Bruno Sanchez';
    empleados[29]:= 'Clara Perez';
    empleados[30]:= 'Daniel Lopez';
    empleados[31]:= 'Eva Gonzalez';
    empleados[32]:= 'Fernando Ramirez';
    empleados[33]:= 'Gloria Diaz';
    empleados[34]:= 'Hector Martinez';
    empleados[35]:= 'Ines Garcia';
    empleados[36]:= 'Javier Sanchez';
    empleados[37]:= 'Karen Perez';
    empleados[38]:= 'Lorenzo Lopez';
    empleados[39]:= 'Marta Ramirez';
end;

procedure InicializarSemanas(var semana: Tsemanas);
var
    i, j, k: integer;
    l: Tfinde;
begin
    for i:=1 to maxsemanas do for l:=Viernes to Domingo do
    with semana[i,l] do begin
        for j:=1 to maxmesas do for k:=1 to maxcroupiers do
            mesas[j, k]:= 0;
        monto_apertura:= 0;
        monto_cierre:= 0;
        monto_max:= 0;
    end
end;

procedure CargarSemanas(var semanas: Tsemanas);
var
    i, j, k: integer;
    l: Tfinde;
begin
    for i:=1 to maxsemanas do for l:=Viernes to Domingo do
    with semanas[i,l] do begin
        for j:=1 to maxmesas do for k:=1 to maxcroupiers do
            mesas[j, k]:= k + maxcroupiers*(j-1);
        monto_apertura:= 100*(random(200));
        monto_cierre:= 100*(random(600)-300);
        monto_max:= 10*(random(300)-100);
    end
end;

procedure ListarEmpleados(var empleados: Templeados);
var
    i: integer;
begin
    i:=1;
    clrscr;
    while (empleados[i]<>'') and (i<=maxempleados) do begin
        writeln(i, '- ', empleados[i]);
        delay(10);
        inc(i);
    end
end;

procedure MostrarMesas(const dia: Tdia; const empleados: Templeados);
var
    i, j: integer;
begin
    clrscr;
    writeln('Mesas', 'Tipo':10,'':5, 'Croupier 1':20, 'Croupier 2':20, 'Croupier 3':20);
    for i:=1 to 3 do begin
        write(i:3, '':2, 'Punto y Banca':15);
        for j:=1 to maxcroupiers do
            write(empleados[dia.mesas[i, j]]:20);
        writeln;
    end;
    for i:=4 to maxmesas do begin
        write(i:3, '':7, 'Ruleta', '':4);
        for j:=1 to maxcroupiers do
            write(empleados[dia.mesas[i, j]]:20);
        writeln;
    end;
    writeln('Monto de Apertura: ', dia.monto_apertura:0:2);
    writeln('Monto de Cierre: ', dia.monto_cierre:0:2);
    writeln('Monto de Maximo de Apuesta: ', dia.monto_max:0:2);
end;

procedure MostrarSeguimiento(const casino: Tcasino);
var
    semana: integer;
    dia: Tfinde;
begin
    clrscr;
    write('Semana: ');
    readln(semana);
    writeln;
    write('Dia: ');
    readln(dia);
    writeln;
    case semana of
        1..maxsemanas: MostrarMesas(casino.semanas[semana, dia], casino.empleados);
        else begin
            writeln('La semana no existe');
            writeln('Pulsa cualquier tecla para continuar...');
        end
    end;
end;

procedure DiasconMayorGanancia(const semanas: Tsemanas);
var
    maximo, aux: real;
    i, total: integer;
    j: Tfinde;
begin
    maximo:= semanas[1, Viernes].monto_cierre - semanas[1, Viernes].monto_apertura;
    total:= 1;
    for i:=1 to maxsemanas do
        for j:=Viernes to Domingo do begin
            aux:= semanas[i, j].monto_cierre - semanas[i, j].monto_apertura;
            if (aux>maximo) then begin
                total:= 1;
                maximo:= aux;
            end
            else if (aux=maximo) then inc(total)
        end;
    if maximo>0 then begin
        writeln;
        writeln('Monto maximo = ', maximo:0:2);
        writeln;
        i:= 1;
        while (total>0) and (i<=maxsemanas) do begin
            j:= Viernes;
            while (total>0) and (j<=Domingo) do begin
                aux:= semanas[i, j].monto_cierre - semanas[i, j].monto_apertura;
                if (aux=maximo) then begin
                    writeln('Semana = ', i);
                    writeln('Dia = ', j);
                    dec(total)
                end;
                j:= succ(j);
            end;
            inc(i)
        end
    end
    else writeln('No hay Ganancias')
end;

procedure DiasconMayorPerdida(const semanas: Tsemanas);
var
    minimo, aux: real;
    i, total: integer;
    j: Tfinde;
begin
    minimo:= semanas[1, Viernes].monto_cierre - semanas[1, Viernes].monto_apertura;
    total:= 1;
    for i:=1 to maxsemanas do
        for j:=Viernes to Domingo do begin
            aux:= semanas[i, j].monto_cierre - semanas[i, j].monto_apertura;
            if (aux<minimo) then begin
                total:= 1;
                minimo:= aux;
            end
            else if (aux=minimo) then inc(total)
        end;
    if minimo<0 then begin
        writeln;
        writeln('Monto maximo = ', minimo:0:2);
        writeln;
        i:= 1;
        while (total>0) and (i<=maxsemanas) do begin
            j:= Viernes;
            while (total>0) and (j<=Domingo) do begin
                aux:= semanas[i, j].monto_cierre - semanas[i, j].monto_apertura;
                if (aux=minimo) then begin
                    writeln('Semana = ', i);
                    writeln('Dia = ', j);
                    dec(total)
                end;
                j:= succ(j);
            end;
            inc(i)
        end
    end
    else writeln('No hay Perdidas')
end;

var
    casino: Tcasino;
    promedio: real;
    dia: Tfinde;
    opcion: char;
begin
    Randomize;
    InicializarSemanas(casino.semanas);
    InicializarEmpleados(casino.empleados);
    CargarEmpleados(casino.empleados);
    CargarSemanas(casino.semanas);
    repeat
        clrscr;
        writeln('1. Listar Empleados');
        writeln('2. Ver Seguimiento');
        writeln('3. Dias con Mayor Ganancia');
        writeln('4. Recargar Analisis');
        writeln('5. Dias con Mayor Perdida');
        writeln('0. Terminar');
        write('Opcion: ');
        readln(opcion);
        case opcion of
            '1': begin
                ListarEmpleados(casino.empleados);
                readkey;
            end;
            '2': begin
                MostrarSeguimiento(casino);
                readkey;
            end;
            '3': begin
                DiasconMayorGanancia(casino.semanas);
                readkey;
            end;
            '4': CargarSemanas(casino.semanas);
            '5': begin
                DiasconMayorPerdida(casino.semanas);
                readkey;
            end;
        end;
    until(opcion='0');
    {DiasconMayorPerdida(casino);
    FindeconMayorGanancia(casino);
    promedio:= PromediodeGanancia(casino);
    writeln('Promedio de Ganancia por dia: ', promedio);
    DiasconMenosdelPromedio(casino, promedio);
    write('Ingresa un dia: ');
    readln(dia);
    MaximoApostado(casino, dia);}
end.