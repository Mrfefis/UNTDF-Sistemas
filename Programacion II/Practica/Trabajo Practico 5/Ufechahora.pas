unit Ufechahora;

interface
	
	uses Uhora, Ufecha;

	type
		Tfechahora = record
			hora: Ttiempo;
			fecha: Tfecha;
		end;

	procedure iniciar(var fechahora: Tfechahora; dia: Tdia; mes: Tmes; anio: Tanio; hora: Thora; minutos: Tminutos);

	function cortosinhora(fechahora: Tfechahora): string;

	function largosinhora(fechahora: Tfechahora): string;

	function cortoconhora(fechahora: Tfechahora): string;

	function largoconhora(fechahora: Tfechahora): string;

implementation

	procedure iniciar(var fechahora: Tfechahora; dia: Tdia; mes: Tmes; anio: Tanio; hora: Thora; minutos: Tminutos);
	begin
		Ufecha.iniciar(fechahora.fecha, dia, mes, anio);
		Uhora.iniciar(fechahora.hora, minutos, hora);
	end;

	function cortosinhora(fechahora: Tfechahora): string;
	begin
		cortosinhora:= Ufecha.formatocorto(fechahora.fecha);
	end;

	function largosinhora(fechahora: Tfechahora): string;
	begin
		largosinhora:= Ufecha.formatolargo(fechahora.fecha);
	end;

	function cortoconhora(fechahora: Tfechahora): string;
	begin
		cortoconhora:= Ufecha.formatocorto(fechahora.fecha) + ' - ' + Uhora.formatocorto(fechahora.hora);
	end;

	function largoconhora(fechahora: Tfechahora): string;
	begin
		largoconhora:= Ufecha.formatolargo(fechahora.fecha) + ' - ' + Uhora.formatomeridiano(fechahora.hora);
	end;

end.