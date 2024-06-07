unit Uarchivo;

interface

	uses Uauto;

	type
		Telemento = Tauto;

		Tarchivo = file of Telemento;

	procedure Abrir(var archivo: Tarchivo; ubicacion: string);

	procedure insertar(var archivo: Tarchivo; elemento: Telemento);

	procedure Mostrar(var archivo: Tarchivo);

	function leer(var archivo: Tarchivo): Telemento;

implementation

	procedure Abrir(var archivo: Tarchivo; ubicacion: string);
	begin
		Assign(archivo, ubicacion);
		{$I-}
		Reset(archivo);
		{$I+}
		if IOresult<>0 then
			Rewrite(archivo);
	end;

	procedure insertar(var archivo: Tarchivo;  elemento: Telemento);
	begin
		Seek(archivo, FileSize(archivo));
		write(archivo, elemento);
	end;

	function leer(var archivo: Tarchivo): Telemento;
	var
		elemento: Telemento;
	begin
		read(archivo, elemento);
		leer:= elemento;
	end;

	procedure Mostrar(var archivo: Tarchivo);
	begin
		Seek(archivo, 0);
		while not EOF(archivo) do
			Uauto.imprimir(leer(archivo));
	end;

end.