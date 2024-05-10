unit Upila;

interface
	
	uses Ulista;

	type
		Tstack = Tlista;

	procedure create(var stack: Tstack);

	procedure push(var stack: Tstack; element: Telement);

	procedure pop(var stack: Tstack);

	function empty(const stack: Tstack): boolean;

	function length(const stack: Tstack): word;

	function top(const stack: Tstack): Telement;

implementation

end.