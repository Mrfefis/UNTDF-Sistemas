unit Ucliente;
interface
	type
		Tcliente = record
			nrocliente: longint;
			preferencial: boolean;
		end;

	function comparar(cliente1, cliente2: Tcliente): boolean;

implementation

	function comparar(cliente1, cliente2: Tcliente): boolean;
	begin
		comparar:= cliente1.nrocliente=cliente2.nrocliente;
	end;

end.