program HelloWorld;
uses crt, Sysutils;
{
  Consigna:
  2- Dada la definición del ejercicio anterior se pide.
  a) Permitir la carga de números, puede utilizar un valor específico para
  terminar.
  b) Listar los elementos del archivo.
  c) Buscar un elemento en el archivo e indicar que posición que ocupa
  dentro del mismo o -1 en caso de no estar.
  1. suponiendo un archivo desordenado.
  2. suponiendo el archivo ordenado en forma creciente. En ambos casos se
  considera que no hay registros repetidos dentro del archivo.
  d) Localizar el elemento de mayor valor dentro del archivo (los
  elementos no están
  ordenados) e imprimirlo junto con la posición que ocupa.
  e) Generar otro archivo, ArchiPares, con los elementos pares de Archi.
}

type
  TipoArchivo = file of Integer;
  TipoPosicion = 0 .. MaxInt; // representa el máximo integer

procedure listararchivo (var Archi: TipoArchivo);
var
  elemento: integer;
begin
  Seek(Archi, 0);
  while not EOF(Archi) do begin
    read(Archi, elemento);
    writeln(elemento)
  end
end;

procedure cargararchivo (var Archi: TipoArchivo);
var
  dato: integer;
begin
  Seek(Archi, FileSize(Archi));
  write ('Ingrese dato numerico: ');
  readln (dato);
  while dato<>0 do
  begin
    write(Archi, dato);
    clrscr;
    write ('Ingrese dato numerico: ');
    readln (dato);
  end;
end;

procedure AbrirArchivo (var Archivo: TipoArchivo; Direccion: string);
begin
  Assign(Archivo, Direccion);
  {$I-}
  Reset(Archivo);
  {$I+}
  if IOresult<>0 then
    rewrite (Archivo);
end;

procedure CrearArchivo (var Archivo: TipoArchivo; Direccion: string);
begin
  Assign(Archivo, Direccion);
  rewrite (Archivo);
end;

function BuscarOrdenado(var Archivo: TipoArchivo;buscado:integer): integer;
var
  infimo,supremo,medio: TipoPosicion;
  i:integer;
  encontrado:boolean;
begin
  infimo:= 0;
  supremo:= FileSize(Archivo)-1;
  encontrado:=false;
  while (infimo<=supremo) and (not encontrado) do
      begin
      medio:=(infimo + supremo) div 2;
      seek (archivo, medio);
      read (archivo,i);
      if i=buscado then
        encontrado:=true
      else if i> buscado then
        supremo:=medio -1
      else 
        infimo:= medio + 1;
      end;
  if encontrado then
    BuscarOrdenado:=medio
    else
    BuscarOrdenado:=-1;
end;

procedure GuardarPares(var Archi, ArchiPares: TipoArchivo);
var
  i: integer;
begin
  Seek(Archi, 0);
  Seek(ArchiPares, FileSize(ArchiPares));
  while not EOF(Archi) do begin
    read(Archi, i);
    if (i mod 2)=0 then
      write(ArchiPares, i)
  end
end;

function BuscarDesordenado(var Archivo: TipoArchivo; buscado: integer): integer;
var
  i: TipoPosicion;
  elemento: integer;
  encontrado: boolean;
begin
  i:= 0;
  Seek(Archivo, 0);
  encontrado:= false;
  while (i<FileSize(Archivo)) and not encontrado do begin
    read(Archivo, elemento);
    if elemento=buscado then encontrado:= true
    else inc(i)
  end;
  if encontrado then
    BuscarDesordenado:= i
  else
    BuscarDesordenado:= -1;
end;

function Maximo(var Archivo: TipoArchivo): integer;
var
  i: integer;
begin
  Seek(Archivo, 0);
  read(Archivo, Maximo);
  while not EOF(Archivo) do begin
    read(Archivo, i);
    if i>Maximo then
      Maximo:= i;
  end;
end;

var
  Archi, ArchiPares : TipoArchivo;
  dato: integer;
begin
  AbrirArchivo(Archi, '2_Archivo.dat');
  CrearArchivo(ArchiPares, '2_Archivo2.dat');
  // a)
  Writeln('Cargando el Archivo':20);
  Writeln('Ingresa 0 para terminar');
  CargarArchivo(Archi);
  // b)
  ListarArchivo(Archi);
  // c)
  write('Ingresa un Dato para Buscar: ');
  readln(dato);
  writeln('Esta en la posicion: ', BuscarDesordenado(Archi, dato));
  // d)
  writeln('El elemento maximo es: ', Maximo(Archi));
  // e)
  GuardarPares(Archi, ArchiPares);
  writeln('Los elementos Pares del archivo son: ');
  ListarArchivo(ArchiPares);
  Close(ArchiPares);
  Close(Archi)
end.