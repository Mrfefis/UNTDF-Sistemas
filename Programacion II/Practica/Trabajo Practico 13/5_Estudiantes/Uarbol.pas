unit Uarbol;

interface

	uses Uarbolpila, Uarbolcola, Utipos;

	type
		Tinfo = Utipos.Tinfo;

		Tpuntero = Utipos.TpunteroArbol;

		Tarbol = Tpuntero;

	procedure iniciar(var arbol: Tarbol);

	procedure insertar(var arbol: Tarbol; info: Tinfo);

	procedure eliminar(var arbol: Tarbol; info: Tinfo);

	procedure listarPreOrden(arbol: Tarbol);

	procedure listarPostOrden(arbol: Tarbol);

	procedure listarEnOrden(arbol: Tarbol);

	procedure listarPorNivel(arbol: Tarbol);

	function buscar(arbol: Tarbol; info: Tinfo): Tpuntero;

	function vacio(arbol: Tarbol): boolean;

	function recuperar(puntero: Tpuntero): Tinfo;

	function izquierda(puntero: Tpuntero): Tpuntero;

	function derecha(puntero: Tpuntero): Tpuntero;

implementation

	procedure iniciar(var arbol: Tarbol);
	begin
		arbol:= nil;
	end;

	procedure insertar(var arbol: Tarbol; info: Tinfo);
	var
		peregrino, guia, nodo: Tpuntero;
	begin
		new(nodo);
		nodo^.info:= info;
		nodo^.izq:= nil;
		nodo^.der:= nil;
		if (arbol=nil) then
			arbol:= nodo
		else
		begin
			peregrino:= nil;
			guia:= arbol;
			while (guia<>nil) do
			begin
				peregrino:= guia;
				if criterio(guia^.info,info) then
					guia:= guia^.izq
				else
					guia:= guia^.der
			end;
			if criterio(peregrino^.info,info) then
				peregrino^.izq:= nodo
			else
				peregrino^.der:= nodo
		end
	end;

	procedure eliminarHoja(var arbol, padre, hijo: Tpuntero);
	begin
		if (padre=nil) then
			arbol:= nil
		else if (padre^.izq=hijo) then
			padre^.izq:= nil
		else
			padre^.der:= nil
	end;

	procedure eliminarIntermedio(var arbol, padre, hijo: Tpuntero);
	begin
		if (padre=nil) then
			if (arbol^.izq=nil) then
				arbol:= arbol^.der
			else
				arbol:= arbol^.izq
		else
		begin
			if (padre^.izq=hijo) then
			begin
				if (hijo^.izq=nil) then
					padre^.izq:= hijo^.der
				else
					padre^.izq:= hijo^.izq
			end
			else
			begin
				if (hijo^.izq=nil) then
					padre^.der:= hijo^.der
				else
					padre^.der:= hijo^.izq
			end
		end
	end;

	procedure eliminarCompleto(var NodoEliminar: Tpuntero);
	var
		padre, sucesor: Tpuntero;
	begin
		padre:= NodoEliminar;
		sucesor:= NodoEliminar^.der;
		while (sucesor^.izq<>nil) do
		begin
			padre:= sucesor;
			sucesor:= sucesor^.izq
		end;
		NodoEliminar^.info:= sucesor^.info;
		if (padre=NodoEliminar) then
			padre^.der:= sucesor^.der
		else
			padre^.izq:= sucesor^.der;
		NodoEliminar:= sucesor;
	end;

	procedure eliminar(var arbol: Tarbol; info: Tinfo);
	var
		peregrino, guia: Tpuntero;
	begin
		peregrino:= nil;
		guia:= arbol;
		while (guia<>nil) and comparar(guia^.info,info) do
		begin
			peregrino:= guia;
			if criterio(guia^.info,info) then
				guia:= guia^.izq
			else
				guia:= guia^.der;
		end;
		if (guia<>nil) then
		begin
			if (guia^.izq=nil) and (guia^.der=nil) then
				eliminarHoja(arbol, peregrino, guia)
			else if (guia^.izq=nil) or (guia^.der=nil) then
				eliminarIntermedio(arbol, peregrino, guia)
			else
				eliminarCompleto(guia);
			dispose(guia);
		end
	end;

	function buscar(arbol: Tarbol; info: Tinfo): Tpuntero;
	begin
		while (arbol<>nil) and not comparar(arbol^.info,info) do
			if criterio(arbol^.info,info) then
				arbol:= arbol^.izq
			else
				arbol:= arbol^.der;
		buscar:= arbol;
	end;

	function vacio(arbol: Tarbol): boolean;
	begin
		vacio:= arbol=nil;
	end;

	function recuperar(puntero: Tpuntero): Tinfo;
	begin
		recuperar:= puntero^.info;
	end;

	function izquierda(puntero: Tpuntero): Tpuntero;
	begin
		izquierda:= puntero^.izq;
	end;

	function derecha(puntero: Tpuntero): Tpuntero;
	begin
		derecha:= puntero^.der;
	end;

	procedure listarEnOrden(arbol: Tarbol);
	var
		pila: Uarbolpila.Tpila;
	begin
		Uarbolpila.init(pila);
		write('[ ');
		repeat
			while (arbol<>nil) do
			begin
				Uarbolpila.push(pila, arbol);
				arbol:= arbol^.izq
			end;
			if not Uarbolpila.empty(pila) then
			begin
				Uarbolpila.pop(pila, arbol);
				Imprimir(arbol^.info);
				write(' ');
				arbol:= arbol^.der
			end
		until (arbol=nil) and Uarbolpila.empty(pila);
		writeln(']');
	end;

	procedure listarPreOrden(arbol: Tarbol);
	var
		pila: Uarbolpila.Tpila;
	begin
		Uarbolpila.init(pila);
		write('[ ');
		while (arbol<>nil) or not (Uarbolpila.empty(pila)) do
		begin
			if (arbol<>nil) then
			begin
				Imprimir(arbol^.info);
				write(' ');
				if (arbol^.der<>nil) then
					Uarbolpila.push(pila, arbol^.der);
				arbol:= arbol^.izq;
			end
			else if not Uarbolpila.empty(pila) then
				Uarbolpila.pop(pila, arbol);
		end;
		writeln(']');
	end;

	procedure listarPostOrden(arbol: Tarbol);
	var
		pila, pila2: Uarbolpila.Tpila;
	begin
		Uarbolpila.init(pila);
		Uarbolpila.init(pila2);
		write('[ ');
		while (arbol<>nil) or not (Uarbolpila.empty(pila)) do
		begin
			if (arbol<>nil) then
			begin
				Uarbolpila.push(pila2, arbol);
				if (arbol^.izq<>nil) then
					Uarbolpila.push(pila, arbol^.izq);
				arbol:= arbol^.der;
			end
			else if not Uarbolpila.empty(pila) then
				Uarbolpila.pop(pila, arbol);
		end;
		while not Uarbolpila.empty(pila2) do
		begin
			Uarbolpila.pop(pila2, arbol);
			Imprimir(arbol^.info);
			write(' ');
		end;
		writeln(']');
	end;

	procedure listarPorNivel(arbol: Tarbol);
	var
		cola: Uarbolcola.Tcola;
	begin
		Uarbolcola.init(cola);
		Uarbolcola.push(cola, arbol);
		write('[ ');
		while not Uarbolcola.empty(cola) do
		begin
			Uarbolcola.pop(cola, arbol);
			if (arbol<>nil) then
			begin
				Imprimir(arbol^.info);
				write(' ');
				Uarbolcola.push(cola, arbol^.izq);
				Uarbolcola.push(cola, arbol^.der);
			end;
		end;
		writeln(']');
	end;

end.