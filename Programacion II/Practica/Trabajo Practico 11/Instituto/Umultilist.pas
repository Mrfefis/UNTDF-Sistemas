unit Umultilist;

interface

	uses Udatos;

	type
		// Elemento de las listas

		Trelation1 = Udatos.Talumno;

		Trelation2 = Udatos.Tcurso;

		// Listas de elementos

		Trelation1List = ^TnodoRelation1;

		Trelation2List = ^TnodoRelation2;

		Tmultilist = ^TnodoMultilist;

		// Nodos de elementos

		TnodoRelation1 = record
			element: Trelation1;
			next: Trelation1List;
			multilist: Tmultilist;
		end;

		TnodoRelation2 = record
			element: Trelation2;
			next: Trelation2List;
			multilist: Tmultilist;
		end;

		TnodoMultilist = record
			relation1: Trelation1List;
			relation2: Trelation2List;
			nextrelation1, nextrelation2: Tmultilist;
		end;

	procedure insert(relation1: Trelation1List; relation2: Trelation2List);

	//procedure elminar(var relation1: Trelation1List; var relation2: Trelation2List);

	procedure listarRelacion1(relation: Trelation2List);

	procedure listarRelacion2(relation: Trelation1List);

implementation

	procedure insert(relation1: Trelation1List; relation2: Trelation2List);
	var
		nodo: Tmultilist;
	begin
		if (relation1<>nil) and (relation2<>nil) then
		begin
			// Creacion del nodo y relacion con los elmentos
			new(nodo);
			nodo^.relation1:= relation1;
			nodo^.relation2:= relation2;
			// Conecta la relacion 1 con los elementos de la lista de relacion 2
			if (relation1^.multilist=nil) then
				nodo^.nextrelation2:= nil
			else
				nodo^.nextrelation2:= relation1^.multilist;
			relation1^.multilist:= nodo;
			// Conecta la relacion 2 con los elementos de la lista de relacion 1
			if (relation2^.multilist=nil) then
				nodo^.nextrelation1:= nil
			else
				nodo^.nextrelation1:= relation2^.multilist;
			relation2^.multilist:= nodo
		end;
	end;

	procedure listarRelacion1(relation: Trelation2List);
	var
		aux: Tmultilist;
	begin
		aux:= relation^.multilist;
		while (aux<>nil) do
		begin
			MostrarAlumno(aux^.relation1^.element);
			aux:= aux^.nextrelation1;
		end
	end;

	procedure listarRelacion2(relation: Trelation1List);
	var
		aux: Tmultilist;
	begin
		aux:= relation^.multilist;
		while (aux<>nil) do
		begin
			MostrarAlumno(aux^.relation1^.element);
			aux:= aux^.nextrelation1;
		end
	end;

	

end.