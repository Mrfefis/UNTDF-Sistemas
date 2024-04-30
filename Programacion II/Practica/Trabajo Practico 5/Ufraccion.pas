unit Ufraccion;

interface
	
	type
		Tfraccion = record
			numerador, denominador: integer;
		end;

		procedure iniciar(var fraccion:Tfraccion; numerador, denominador: integer);

		function suma(fraccion1, fraccion2: Tfraccion): Tfraccion;

		function resta(fraccion1, fraccion2: Tfraccion): Tfraccion;

		procedure imprimir(fraccion: Tfraccion);

		function getnumerador(fraccion: Tfraccion): integer;

		function getdenominador(fraccion: Tfraccion): integer;

		function getsigno(fraccion: Tfraccion): integer;

implementation

		procedure iniciar(var fraccion: Tfraccion; numerador, denominador: integer);
		begin
			fraccion.numerador:= numerador;
			fraccion.denominador:= denominador;
		end;

		function suma(fraccion1, fraccion2: Tfraccion): Tfraccion;
		begin
			suma.denominador:= fraccion1.denominador*fraccion2.denominador;
			suma.numerador:= fraccion1.numerador*fraccion2.denominador + fraccion2.numerador*fraccion1.denominador;
		end;

		function resta(fraccion1, fraccion2: Tfraccion): Tfraccion;
		begin
			resta.denominador:= fraccion1.denominador*fraccion2.denominador;
			resta.numerador:= fraccion1.numerador*fraccion2.denominador - fraccion2.numerador*fraccion1.denominador
		end;

		procedure imprimir(fraccion: Tfraccion);
		begin
			if ((fraccion.numerador>0) and (fraccion.denominador<0)) or ((fraccion.numerador<0) and (fraccion.denominador>0)) then
				write('-');
			writeln(abs(fraccion.numerador),'/', abs(fraccion.denominador))
		end;

		function getnumerador(fraccion: Tfraccion): integer;
		begin
			getnumerador:= abs(fraccion.numerador);
		end;

		function getdenominador(fraccion: Tfraccion): integer;
		begin
			getdenominador:= abs(fraccion.denominador);
		end;

		function getsigno(fraccion: Tfraccion): integer;
		begin
			if ((fraccion.numerador>0) and (fraccion.denominador<0)) or ((fraccion.numerador<0) and (fraccion.denominador>0)) then
				getsigno:= -1
			else getsigno:= 1;
		end;
end.