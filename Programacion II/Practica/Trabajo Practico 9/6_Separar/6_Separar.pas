program Separar;
uses crt, Upersona, UlistaSimple;
{
	Consigna:
	6- Dada una lista que contenga la siguiente información por nodo:
	NOMBRE - EDAD - SEXO - SIG
	Construir un procedimiento que cree dos listas, una por cada sexo.
}
type
	Tpersonas = Tlista;

procedure Opciones(var opcion: char);
begin
	writeln('1. Ingresar nuevo empleado');
	writeln('2. Categorizar');
	writeln('3. Listar empleados');
	writeln('0. Salir');
	opcion:= readkey;
end;

procedure Categorizar(var origen, destino1, destino2: Tlista);
var
	i, limite: Tindice;
	elemento: Tpersona;
begin
	limite:= longitud(origen);
	for i:=1 to limite do
	begin
		elemento:= recuperar(origen, i);
		if elemento.sexo='m' then
			insertarFinal(destino1, elemento)
		else
			insertarFinal(destino2, elemento)

	end;
end;

procedure CargarPersona(var personas: Tpersonas);
var
	persona: Tpersona;
begin
	writeln('Ingresa los datos del nuevo Empleado');
	with persona do
	begin
		write('Nombre: '); readln(nombre);
		write('Edad: '); readln(edad);
		write('Sexo (M:masculino; F:femenino): '); readln(sexo);
	end;
	UlistaSimple.insertarFinal(personas, persona);
end;

var
	inclusivo: Tpersonas;
	hombres, mujeres: Tpersonas;
	opcion: char;
begin
	iniciar(inclusivo);
	iniciar(hombres);
	iniciar(mujeres);
	
	repeat
		clrscr;
		writeln('--------------------------------');
		writeln('BIENVENIDO A UNA EMPRESA ANONIMA');
		writeln('--------------------------------');
		writeln;
		Opciones(opcion);
		case opcion of
			'1': CargarPersona(inclusivo);
			'2': Categorizar(inclusivo, hombres, mujeres);
			'3': begin
				write('Todos: ');
				Listar(inclusivo);
				write('Hombres: ');
				Listar(hombres);
				write('Mujeres: ');
				Listar(mujeres);
				writeln('Pulsa cualquier tecla para continuar...');
				readkey;
			end;
		end;
	until (opcion='0');
end.