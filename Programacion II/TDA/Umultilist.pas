unit Umultilist;

interface

	type
		// Elemento de las listas

		Trelation1 = integer;

		Trelation2 = integer;

		// Listas de elementos

		Trelation1List = ^TnodoRelation1;

		Trelation2List = ^TnodoRelation2;

		Tmutilist = ^TnodoMultilist;

		// Nodos de elementos

		TnodoRelation1 = record
			element: Trelation1;
			next: Trelation1List;
			multi: Tmutilist;
		end;

		TnodoRelation2 = record
			element: Trelation2;
			next: Trelation2List;
			multi: Tmutilist;
		end;

		TnodoMultilist = record
			relation1: Trelation1List;
			relation2: Trelation2List;
			nextrelation1, nextrelation2: Tmutilist;
		end;

	procedure insert(relation1: Trelation1List; relation2: Trelation2List);

	//procedure elminiar(var relation1: Trelation1List; var relation2: Trelation2List);

	procedure listarRelacion1(relation: Trelation1List);

	//procedure listarRelacion2(relation: Trelation2List);

implementation

	procedure insert(var multilist: Tmutilist; relation1: Trelation1List; relation2: Trelation2List);
	var
		nodo: Tmutilist;
	begin
		if (relation1<>nil) and (relation2<>nil) then
		begin
			// Creacion del nodo y relacion con los elmentos
			new(nodo);
			nodo^.nextrelation1:= relation1;
			nodo^.nextrelation2:= relation2;
			// Conecta la relacion 1 con los elementos de la lista de relacion 2
			if (relation1^.multilist=nil) then
				nodo^.nextrelation2:= nil
			else
				nodo^.nextrelation2:= relation1^.multilist;
			relation1^.multilist:= multilist
			// Conecta la relacion 2 con los elementos de la lista de relacion 1
			if (relation2^.multilist=nil) then
				nodo^.nextrelation1:= nil
			else
				nodo^.nextrelation1:= relation2^.multilist;
			relation2^.multilist:= multilist
		end;
	end;

	procedure listarRelacion1(relation: Trelation1List);
	begin
	end;

end.