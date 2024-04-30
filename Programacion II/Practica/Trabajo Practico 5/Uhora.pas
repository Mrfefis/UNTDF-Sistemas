unit Uhora;

interface

	type

		Tminutos = 0..59;

		Thora = 0..23;

		Ttiempo = record
			minutos: Tminutos;
			hora: Thora;
		end;

	procedure iniciar(var tiempo: Ttiempo; minutos: Tminutos; hora: Thora);

	function formatocorto(tiempo: Ttiempo): string;

	function formatomeridiano(tiempo: Ttiempo): string;

implementation

	procedure iniciar(var tiempo: Ttiempo; minutos: Tminutos; hora: Thora);
	begin
		tiempo.minutos:= minutos;
		tiempo.hora:= hora;
	end;

	function formatocorto(tiempo: Ttiempo): string;
	var
		aux: string;
	begin
		Str(tiempo.hora, formatocorto);
		if tiempo.hora<10 then
			formatocorto:= '0' + formatocorto;
		Str(tiempo.minutos, aux);
		if tiempo.minutos<10 then
			aux:= '0' + aux;
		formatocorto:= formatocorto + ':' + aux;
	end;

	function formatomeridiano(tiempo: Ttiempo): string;
	var
		aux: string;
	begin
		if tiempo.hora<12 then
			Str(tiempo.hora, formatomeridiano)
		else
			Str(tiempo.hora-12, formatomeridiano);
		if tiempo.hora<10 then
			formatomeridiano:= '0' + formatomeridiano;
		Str(tiempo.minutos, aux);
		if tiempo.minutos<10 then
			aux:= '0' + aux;
		formatomeridiano:= formatomeridiano + ':' + aux;
		if tiempo.hora<12 then
			formatomeridiano:= formatomeridiano + ' AM'
		else
			formatomeridiano:= formatomeridiano + ' PM';
	end;

end.