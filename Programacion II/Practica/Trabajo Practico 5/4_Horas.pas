program Hors;
uses crt, Uhora;
{
	Consgina:
	Escriba un TDA para manipular el tiempo. Se debe poder iniciar una hora pasando los
	argumentos hora, minutos y segundos.
	- Incorpore al TDA la posibilidad de retornar la hora en distintos formatos (ej para
	las 15:30hs):
	- Formato corto HH:mm = 15:30
	- Formato meridiano hh:mm aa = 3:00 PM
}
var
	minutos: Tminutos;
	hora: Thora;
	tiempo: Ttiempo;
begin
	write('Hora: ');
	readln(hora);
	write('Minutos: ');
	readln(minutos);
	iniciar(tiempo, minutos, hora);
	writeln('Formato Corto: ', formatocorto(tiempo));
	writeln('Formato Meridiano: ', formatomeridiano(tiempo));
	readkey
end.