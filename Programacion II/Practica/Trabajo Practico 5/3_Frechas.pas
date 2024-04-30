program Fech;
uses crt, Ufecha;
{
	Consigna:
	- Escriba un TDA para manipular fechas. Se debe poder iniciar una fecha pasando los
	argumentos año, mes y día.
	- Incorpore al TDA la posibilidad de retornar la fecha en distintos formatos (ej para
	el 24 de marzo de 2020):
	- Formato corto DD/MM = 24/03
	- Formato largo DD/MM/AAAA = 24/03/2020
}
var
	fecha: Tfecha;
	dia: Tdia;
	mes: Tmes;
	anio: Tanio;
begin
	write('Dia: ');
	readln(dia);
	write('Mes: ');
	readln(mes);
	write('Anio: ');
	readln(anio);
	iniciar(fecha, dia, mes, anio);
	writeln('Formato corto: ', formatocorto(fecha));
	writeln('Formato largo: ', formatolargo(fecha));
	readkey
end.