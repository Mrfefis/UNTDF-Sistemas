unit Uqueue;

interface
	
	const
		limit = 100;

	type
		Telement = integer;

		Tqueue = record
			elements: array[1..limit] of Telement;
			first, last: word;
		end;

	procedure create(var queue: Tqueue);

	procedure push(var queue: Tqueue; element: Telement);

	procedure pop(var queue: Tqueue);

	function empty(const queue: Tqueue): boolean;

	function full(const queue: Tqueue): boolean;

	function top(const queue: Tqueue): Telement;

implementation

	procedure create(var queue: Tqueue);
	var
		i: word;
	begin
		for i:=1 to limit do begin
			queue.elements[i]:= 0
		end;
		queue.first:= 1;
		queue.last:= 1;
	end;

	procedure push(var queue: Tqueue; element: Telement);
	begin
		queue.elements[queue.last]:= element;
		queue.last:= (queue.last+1) mod limit;
	end;

	procedure pop(var queue: Tqueue);
	begin
		queue.first:= (queue.first+1) mod limit;
	end;

	function empty(const queue: Tqueue): boolean;
	begin
		empty:= queue.first = queue.last;
	end;

	function full(const queue: Tqueue): boolean;
	begin
		full:= ((queue.last+1) mod limit) = queue.first;
	end;

	function top(const queue: Tqueue): Telement;
	begin
		top:= queue.elements[queue.first];
	end;

begin
end.