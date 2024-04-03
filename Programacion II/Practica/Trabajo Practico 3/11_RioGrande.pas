program RioGrande;
{
	Consigna:
	Defina los tipos de datos que a su juicio son los más convenientes para resolver el siguiente
	problema. Justifique claramente su elección:

	Una compañía de seguros ofrece dos tipos de seguros. De automotor y de vida
	En el primer caso se conoce los datos del auto (Nro. de motor, chasis, patente, tipo de
	vehículo y el valor del auto).
	En el caso del seguro de vida se conoce el nombre del beneficiario y el valor por el cual se
	desea asegurar la persona.
	En ambos casos son datos el nombre del titular de la póliza, el número de la misma y su
	costo.
	Declare los tipos de datos para:
	a) Almacenar el nombre de la compañía de seguros y los datos de hasta 20 pólizas.
	b) Almacenar el nombre de las 10 compañías de seguros que operan en Ushuaia
	(teniendo en cuenta que la cantidad de pólizas para cada una es de a lo sumo 20
	pólizas)
	c) ídem b) pero ahora para las 10 compañías que operan en Ushuaia y las 10 que
	operan en Río Grande. 
}
const
	n = 20;
	m = 10;
type
	Tseguro = (Automotor, Vida);
	Tpoliza = record
		titular: string[30];
		poliza: string[10];
		costo, valor: real;
		case seguro:Tseguro of
			Automotor: (motor, chasis, tipo: string[10]; patente: string[6]);
			Vida: (beneficiario: string[30]);
	end;
	Tcompania = record
		nombre: string;
		polizas: array[1..n] of Tpoliza;
	end;
	Tciudad = array[1..m] of Tcompania;

function Letra: char;
begin
	Letra:= chr(ord('A') + random(ord('Z')-ord('A')+1));
end;

procedure Inicializar(var ciudad: Tciudad);
var
	i, j: integer;
	aux: Tseguro;
begin
	for i:=1 to m do
		with ciudad[i] do begin
			nombre:= Letra + Letra + Letra + Letra;
			aux:=
			for j:=1 to n do with poliza[j] do begin
			end
		end
end;

procedure Mostrar(const ciudad: Tciudad);
begin
end;

var
	Ushuaia, Rio: Tciudad;
begin
	Inicializar(Ushuaia);
	Inicializar(Rio);
	writeln('Ciudad de Ushuaia':20); writeln;
	Mostrar(Ushuaia);
end.