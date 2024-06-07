unit Utipos;

interface

	type
		Tshortstring = string[15];

		Tdomicilio = record
			calle, ciudad, provincia: Tshortstring;
			numero: word;
		end;

		Tcliente = record
			nombre, correo: string;
			celular: Tshortstring;
			dni: longword;
			domicilio: Tdomicilio;
			alquileres: word;
		end;

		TpunteroArbol = ^Tnodoarbol;

		TpunteroLista = ^Tnodolista;

		Tnodoarbol = record
			info: Tcliente;
			izq, der: TpunteroArbol;
		end;

		Tnodolista = record
			info: TpunteroArbol;
			sig: TpunteroLista;
		end;

	procedure Cargar(var cliente: Tcliente);

	procedure Mostrar(const cliente: Tcliente);

	function criterioDNI(const c1, c2: Tcliente): boolean;

	function criterioAlquiler(const c1, c2: Tcliente): boolean;

implementation

	procedure Cargar(var cliente: Tcliente);
	begin
		with cliente do
		begin
			write('Nombre: '); readln(nombre);
			write('Correo: '); readln(correo);
			write('Dni: '); readln(dni);
			with domicilio do
			begin
				writeln('Domicilio');
				write('Calle: '); readln(calle);
				write('Ciudad: '); readln(ciudad);
				write('Provincia: '); readln(provincia);
				write('Numero: '); readln(numero);
			end;
			write('Cantidad de Alquileres: '); readln(alquileres);
		end
	end;

	procedure Mostrar(const cliente: Tcliente);
	begin
		with cliente do
		begin
			writeln(nombre, ', ', correo, ', ', dni);
			with domicilio do
			begin
				write(calle, ', ');
				write(ciudad, ', ');
				write(provincia, ', ');
				writeln(numero, ', ');
			end;
			writeln(alquileres);
		end
	end;

	function criterioDNI(const c1, c2: Tcliente): boolean;
	begin
		criterioDNI:= c1.dni > c2.dni;
	end;

	function criterioAlquiler(const c1, c2: Tcliente): boolean;
	begin
		criterioAlquiler:= c1.alquileres>c2.alquileres;
	end;

end.