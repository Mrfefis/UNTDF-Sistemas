program concurrencia_Lore;
//Exclusion Mutua

var
  turno: integer;
  flag: array[0..1] of boolean;

procedure P0;
begin
  flag[0] := true;
  turno := 1;
  while flag[1] and (turno = 1) do
  ;
  // Sección crítica
  writeln('Proceso P0 en la sección crítica');
  // Fin de la sección crítica
  flag[0] := false;
end;

procedure P1;
begin
  flag[1] := true;
  turno := 0;
  while flag[0] and (turno = 0) do
    ;
  // Sección crítica
  writeln('Proceso P1 en la sección crítica');
  // Fin de la sección crítica
  flag[1] := false;
end;

begin
  P0;
  P1;
end.

//=================================================

program SincronizacionPorCondicion;

var
  mutex: integer;
  condicion: integer;

procedure Productor;
begin
  while true do
  begin
    // Producir dato
    writeln('Productor produjo un dato');
    mutex := 1;
    // Agregar dato al buffer
    writeln('Productor agregó dato al buffer');
    condicion := 1; // Señalar que hay un dato disponible
  end;
end;

procedure Consumidor;
begin
  while true do
  begin
    while condicion <> 1 do
      ; // Esperar a que haya datos disponibles
    mutex := 1;
    // Eliminar dato del buffer
    writeln('Consumidor eliminó un dato del buffer');
    mutex := 0;
  end;
end;

begin
  mutex := 0;
  condicion := 0;
  Productor;
  Consumidor;
end.