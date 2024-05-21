unit Upersona;

interface

	type
		Tpersona = record
			nombre: string;
			edad: word;
			sexo: char;
		end;

	function comparar(persona1, persona2: Tpersona): boolean;

	procedure mostrar(persona: Tpersona);

implementation


	function comparar(persona1, persona2: Tpersona): boolean;
	begin
		comparar:= persona1.nombre=persona2.nombre;
	end;

	procedure mostrar(persona: Tpersona);
	begin
		write('(',persona.nombre, ', ', persona.edad, ', ', persona.sexo, ')');
	end;

end.