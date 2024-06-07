unit Uauto;

interface

	type
		Tclave = string[8];
		Tauto = record
			identificacion: Tclave;
			fechaAlta: string[10];
			numeroChasis: longint;
			marca: string[20];
			modelo: string[20];
			anio: integer;
		end;

	procedure cargar(var auto: Tauto);

	procedure imprimir(const auto: Tauto);

implementation

	procedure cargar(var auto: Tauto);
	begin
		write('Identificacion: '); readln(auto.identificacion);
		write('Fecha de Alta: '); readln(auto.fechaAlta);
		write('Numero de Chasis: '); readln(auto.numeroChasis);
		write('Marca: '); readln(auto.marca);
		write('Modelo: '); readln(auto.modelo);
		write('Anio: '); readln(auto.anio);
	end;

	procedure imprimir(const auto: Tauto);
	begin
		write('[');
		write(auto.identificacion, ', ');
		write(auto.fechaAlta, ', ');
		write(auto.numeroChasis, ', ');
		write(auto.marca, ', ');
		write(auto.modelo, ', ');
		write(auto.anio);
		writeln(']');
	end;

end.
