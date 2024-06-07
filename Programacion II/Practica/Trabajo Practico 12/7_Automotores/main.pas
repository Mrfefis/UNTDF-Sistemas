program main;
uses crt, Uauto, Ulista, Uhash, Uarchivo;
{
	Consigna:
	Desde el registro del automotor lo contratan para realizar mejoras al sistema que ya
	poseen. El mismo cuenta con la información de sus patentes en un archivo, de las 
	cuales se sabe la identificación (AA-000-AA ej.), fecha de alta, número de chasis, marca
	de auto, modelo y año.
	El requerimiento que realizan es para mejorar las búsquedas por medio de la
	identificación de la patente.
	Proponga una estructura y las operaciones que de soporte al requerimiento.
	Implemente la carga de la estructura, la búsqueda de una patente y el detalle en caso
	de encontrarla.
}
type
	Tauto = Uauto.Tauto;
	Tmapa = Uhash.Tmapa;
	Tarchivo = Uarchivo.Tarchivo;
	Tclave = Uhash.Tclave;

procedure CargarAuto(var mapa: Tmapa; var autos: Tarchivo);
var
	auto: Tauto;
begin
	Uauto.cargar(auto);
	Uarchivo.insertar(autos, auto);
	Uhash.insertar(mapa, auto.identificacion, FilePos(autos)-1);
end;

procedure BuscarAuto(const mapa: Tmapa; var autos: Tarchivo);
var
	identificacion: Tclave;
	posicion: integer;
begin
	write('Identificacion:');
	readln(identificacion);
	posicion:= Uhash.buscar(mapa, identificacion);
	if (posicion=-1) then
		writeln('No existe el auto')
	else begin
		Seek(autos, posicion);
		Uauto.imprimir(leer(autos));
	end
end;

var
	mapa: Tmapa;
	autos: Tarchivo;
	opcion: char;
begin
	Abrir(autos, 'autos.dat');
	iniciar(mapa, autos);
	repeat
		clrscr;
		writeln('1. Insertar Auto');
		writeln('2. Buscar Auto');
		writeln('3. Mostrar Autos');
		writeln('0. Terminar');
		opcion:= readkey;
		case opcion of
			'1': CargarAuto(mapa, autos);
			'2': begin
				BuscarAuto(mapa, autos);
				readkey;
			end;
			'3': begin
				Mostrar(autos);
				readkey;
			end;
		end;
	until(opcion='0');
	Close(autos);
end.