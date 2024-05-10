unit Upila;

interface
	
	const
		limit = 1000;

	type
		Telement = integer;

		Tstack = record
			elements: array[1..limit] of Telement;
			total: word;
		end;

	procedure create(var stack: Tstack);

	procedure push(var stack: Tstack; element: Telement);

	procedure push_ordenado(var stack: Tstack; element: Telement);

	procedure pop(var stack: Tstack);

	function empty(const stack: Tstack): boolean;

	function length(const stack: Tstack): word;

	function top(const stack: Tstack): Telement;

implementation

	procedure create(var stack: Tstack);
	var
		i: word;
	begin
		for i:=1 to limit do begin
			stack.elements[i]:= 0;
		end;
		stack.total:= 0;
	end;

	procedure push(var stack: Tstack; element: Telement);
	begin
		if stack.total<limit then begin
			inc(stack.total);
			stack.elements[stack.total]:= element;
		end
	end;

	procedure push_ordenado(var stack: Tstack; element: Telement);
	var
		aux: Telement;
	begin
		if empty(stack) or (top(stack)>element) then
			push(stack, element)
		else begin
			aux:= top(stack);
			pop(stack);
			push_ordenado(stack, element);
			push(stack, aux);
		end
	end;

	procedure pop(var stack: Tstack);
	begin
		if stack.total>0 then
			dec(stack.total)
	end;

	function empty(const stack: Tstack): boolean;
	begin
		empty:= stack.total=0;
	end;

	function length(const stack: Tstack): word;
	begin
		length:= stack.total;
	end;

	function top(const stack: Tstack): Telement;
	begin
		top:= stack.elements[stack.total]
	end;
end.