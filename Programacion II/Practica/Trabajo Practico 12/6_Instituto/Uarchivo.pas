unit Uarchivo;

interface

	uses Ualumno;

	type
		Tarchivo = file of Talumno;

	procedure AbrirArchivo(var archivo: Tarchivo; ubicacion: string);

	procedure Mostrar(var archivo: Tarchivo);

implementation

	procedure AbrirArchivo(var archivo: Tarchivo; ubicacion: string);
	begin
		Assign(archivo, ubicacion);
		{$I-}
		Reset(archivo);
		{$I+}
		if (IOresult<>0) then
			Rewrite(archivo);
	end;

	procedure Mostrar(var archivo: Tarchivo);
	var
		aux: Talumno;
	begin
		seek(archivo, 0);
		while not EOF(archivo) do
		begin
			read(archivo, aux);
			Ualumno.Imprimir(aux);
		end
	end;

end.