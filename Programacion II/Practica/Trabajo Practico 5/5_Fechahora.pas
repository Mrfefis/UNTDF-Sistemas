program FecHora;
uses crt, Ufechahora, Uhora, Ufecha;
{
	Consigna:
	Escribir un TDA para manipular fecha y hora. Utilice las unidades que ya tiene para generar
	esta nueva.
	- Incorpore al TDA la posibilidad de retornar la fecha y la hora en distintos formatos (ej
	para las 24/03/2020 15:30hs):
	- corto sin hora DD/MM = 24/03
	- largo sin hora DD/MM/AAAA = 24/03/2020
	- corto con hora DD/MM – HH:mm = 24/03 - 15:30
	- largo con hora meridiana DD/MM/AAAA – HH:mm:aa = 24/03/2020 - 3:30 PM
}
var
	fechahora: Tfechahora;
	dia: Tdia;
	mes: Tmes;
	anio: Tanio;
	minutos: Tminutos;
	hora: Thora;
begin
	write('Dia: ');
	readln(dia);
	write('Mes: ');
	readln(mes);
	write('Anio: ');
	readln(anio);
	write('Hora: ');
	readln(hora);
	write('Minutos: ');
	readln(minutos);
	Ufechahora.iniciar(fechahora, dia, mes, anio, hora, minutos);
	writeln('Formato corto sin hora: ', cortosinhora(fechahora));
	writeln('Formato largo sin hora: ', largosinhora(fechahora));
	writeln('Formato corto con hora: ', cortoconhora(fechahora));
	writeln('Formato largo con hora: ', largoconhora(fechahora));
	readkey
end.