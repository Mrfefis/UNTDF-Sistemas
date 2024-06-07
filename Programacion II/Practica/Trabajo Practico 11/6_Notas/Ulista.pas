unit Ulista;

interface

	type

		Talumno = record
			nombre: string;
			dni: longword;
			nota: byte;
		end;

		Tinfo = Talumno;

		Tpuntero = ^Tnodo;

		Tnodo = record
			info: Tinfo;
			sig: Tpuntero;
		end;

		Tlista = record
			cabeza: Tpuntero;
			ascendente: boolean;
		end;

	procedure iniciar(var lista: Tlista; criterio: boolean);

	procedure insertar(var lista: Tlista; info: Tinfo);

	procedure eliminar(var lista: Tlista; var info: Tinfo);

	procedure eliminarElemento(var lista: Tlista; info: Tinfo);

implementation

end.