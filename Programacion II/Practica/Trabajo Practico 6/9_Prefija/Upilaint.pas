unit Upilaint;

interface

	const
		n = 255;

	type
		Telemento = integer;
		Tpila = record
			elementos: array[1..n] of Telemento;
			limite: integer;
		end;

	procedure init(var pila: Tpila);

	procedure invertir(var pila: Tpila);

	procedure push(var pila: Tpila; elemento: Telemento);

	procedure pop(var pila: Tpila; var elemento: Telemento);

	function seek(var pila: Tpila): Telemento;

	function empty(var pila: Tpila): boolean;

	function full(var pila: Tpila): boolean;

implementation

	procedure init(var pila: Tpila);
	begin
		pila.limite:= 0;
	end;

	procedure push(var pila: Tpila; elemento: Telemento);
	begin
		with pila do begin
			inc(limite);
			elementos[limite]:= elemento;
		end;
	end;

	procedure pop(var pila: Tpila; var elemento: Telemento);
	begin
		with pila do begin
			elemento:= elementos[limite];
			dec(limite)
		end
	end;

	function seek(var pila: Tpila): Telemento;
	begin
		seek:= pila.elementos[pila.limite]
	end;

	function empty(var pila: Tpila): boolean;
	begin
		empty:= pila.limite=0;
	end;

	function full(var pila: Tpila): boolean;
	begin
		full:= pila.limite=n
	end;

	procedure invertir(var pila: Tpila);
	var
		elemento: Telemento;
		aux: Tpila;
	begin
		init(aux);
		while not empty(pila) do begin
			pop(pila, elemento);
			push(aux, elemento);
		end;
		pila:= aux;
	end;


end.