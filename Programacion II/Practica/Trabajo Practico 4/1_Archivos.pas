program Archivos;
uses crt;
{
	Consigna:
	Crear subprogramas para:
	a) Verificar la existencia del archivo, si existe abrirlo y sino crearlo.
	b) Cargar el archivo con 20 entradas de números enteros.
	c) Listar el contenido del archivo
}
type
	Tarchivo = file of integer;
	Tposicion = 0..MaxInt;

procedure AbrirArchivo(var Archi: Tarchivo; ruta: string);
begin
	Assign(Archi, ruta);
	{$I-}
	Reset(Archi);
	{$I+}
	if (IOResult<>0) then
		rewrite(Archi)
end;

procedure CargarArchivo(var Archi: Tarchivo);
var
	i: integer;
begin
	Seek(Archi, FileSize(Archi));
	for i:=1 to 20 do
		write(Archi, i)
end;

procedure ListarArchivo(var Archi: Tarchivo);
var
	i: integer;
begin
	Seek(Archi, 0);
	while not EOF(Archi) do begin
		read(Archi, i);
		write(i, ', ');
	end
end;

var
	Archi: Tarchivo;
begin
	AbrirArchivo(Archi, '1_Enteros.dat');
	CargarArchivo(Archi);
	ListarArchivo(Archi);
	readkey;
	Close(Archi);
end.