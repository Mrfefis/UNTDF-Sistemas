unit Ufecha;

interface
	
	type
		Tdia = 1..31;
		Tmes = 1..12;
		Tanio = 1900..2100;

		Tfecha = record
			dia: Tdia;
			mes: Tmes;
			anio: Tanio;
		end;

	procedure iniciar(var fecha: Tfecha; dia: Tdia; mes: Tmes; anio: Tanio);

	function formatocorto(var fecha: Tfecha): string;

	function formatolargo(var fecha: Tfecha): string;

implementation

	procedure iniciar(var fecha: Tfecha; dia: Tdia; mes: Tmes; anio: Tanio);
	begin
		fecha.dia:= dia;
		fecha.mes:= mes;
		fecha.anio:= anio;
	end;

	function formatocorto(var fecha: Tfecha): string;
	var
		aux: string;
	begin
		Str(fecha.dia, formatocorto);
		Str(fecha.mes, aux);
		formatocorto:= formatocorto + '/' + aux
	end;

	function formatolargo(var fecha: Tfecha): string;
	var
		aux: string;
	begin
		Str(fecha.dia, formatolargo);
		Str(fecha.mes, aux);
		formatolargo:= formatolargo + '/' + aux;
		Str(fecha.anio, aux);
		formatolargo:= formatolargo + '/' + aux;
	end;

end.