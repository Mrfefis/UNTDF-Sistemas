program main;
uses crt, UarbolAVL;
{
	Consigna:

}
var
	arbol: Tarbol;
	i: integer;
begin
	iniciar(arbol);
	for i:=1 to 10 do
		insertar(arbol, random(100));
	listarOrden(arbol);
	readkey
end.