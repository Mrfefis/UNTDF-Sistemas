unit UarbolAVL;

interface

	type
		Telemento = integer;

		Tarbol = ^Tnodo;

		Tnodo = record
			info: Telemento;
			altura: integer;
			izq, der: Tarbol;
		end;

	procedure iniciar(var arbol: Tarbol);

	procedure insertar(var arbol: Tarbol; const elemento: Telemento);

	//procedure eliminar(var arbol: Tarbol; elemento: Telemento);

	//function buscar(const arbol: Tarbol; elemento: Telemento): boolean;

	function vacio(const arbol: Tarbol): boolean;

	function altura(const arbol: Tarbol): integer;

	procedure listarOrden(const arbol: Tarbol);

implementation

	procedure iniciar(var arbol: Tarbol);
	begin
		if (arbol<>nil) then
		begin
			iniciar(arbol^.izq);
			dispose(arbol^.izq);
			iniciar(arbol^.der);
			dispose(arbol^.der);
		end;
	end;

	function altura(const arbol: Tarbol): integer;
	begin
		if (arbol=nil) then
			altura:= -1
		else
			altura:= arbol^.altura
	end;

	function max(const arbol1, arbol2: Tarbol): integer;
	begin
		if (altura(arbol1)>altura(arbol2)) then
			max:= altura(arbol1)
		else
			max:= altura(arbol2)
	end;

	procedure rotacionSimpleDerecha(var arbol: Tarbol);
	var
		aux: Tarbol;
	begin
		aux:= arbol^.izq;
		arbol^.izq:= aux^.der;
		aux^.der:= arbol;
		arbol^.altura:= 1 + max(arbol^.izq, arbol^.der);
		aux^.altura:= 1 + max(aux^.izq, aux^.der);
		arbol:= aux;
	end;

	procedure rotacionSimpleIzquierda(var arbol: Tarbol);
	var
		aux: Tarbol;
	begin
		aux:= arbol^.der;
		arbol^.der:= aux^.izq;
		aux^.izq:= arbol;
		arbol^.altura:= 1 + max(arbol^.izq, arbol^.der);
		aux^.altura:= 1 + max(aux^.izq, aux^.der);
		arbol:= aux;
	end;

	procedure rotacionDobleDerecha(var arbol: Tarbol);
	begin
		rotacionSimpleDerecha(arbol^.der);
		rotacionSimpleIzquierda(arbol);
	end;

	procedure rotacionDobleIzquierda(var arbol: Tarbol);
	begin
		rotacionSimpleIzquierda(arbol^.izq);
		rotacionSimpleDerecha(arbol);
	end;

	procedure insertar(var arbol: Tarbol; const elemento: Telemento);
	begin
		if (arbol=nil) then
		begin
			new(arbol);
			arbol^.izq:= nil;
			arbol^.der:= nil;
			arbol^.info:= elemento
		end
		else if (elemento<arbol^.info) then
		begin
			insertar(arbol^.izq, elemento);
			if (altura(arbol^.der)-altura(arbol^.izq))=-2 then
				if (elemento<arbol^.izq^.info) then
					rotacionSimpleDerecha(arbol)
				else
					rotacionDobleIzquierda(arbol);
		end
		else
		begin
			insertar(arbol^.der, elemento);
			if (altura(arbol^.der)-altura(arbol^.izq))=2 then
				if (elemento>=arbol^.der^.info) then
					rotacionSimpleIzquierda(arbol)
				else
					rotacionDobleDerecha(arbol)
		end;
		arbol^.altura:= 1 + max(arbol^.izq, arbol^.der);
	end;

	function vacio(const arbol: Tarbol): boolean;
	begin
		vacio:= arbol=nil;
	end;

	procedure listarOrden(const arbol: Tarbol);
	begin
		if (arbol<>nil) then
		begin
			listarOrden(arbol^.izq);
			write(arbol^.info, ' ');
			listarOrden(arbol^.der);
		end;
	end;

end.