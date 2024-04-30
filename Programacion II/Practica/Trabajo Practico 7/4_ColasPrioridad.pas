program ColasPrioridad;
{
	Consigna:
	4.- Un sistema operativo (ficticio), almacena los trabajos en colas para ejecutarlos según el
	siguiente esquema:
	Los usuarios del sistema tienen prioridades según el número ID:
	 ID 100 a 199 prioridad mayor
	 ID 200 a 299 prioridad siguiente a la mayor
	 ID 300 a 399 .........
	 ID 800 a 899 prioridad anterior a la menor
	 ID 900 a 999 prioridad más baja (sus trabajos serán 3 de la madrugada
	 los fines de semana)
	- Dentro de cada grupo de prioridad, los trabajos se realizan en orden de llegada
	Las colas se van atendiendo por orden de prioridad, y solamente se atenderá un trabajo
	de prioridad inferior cuando TODAS las colas de prioridad superior estén vacías.
	• El sistema tiene un vector ( TRABAJOS : ARRAY [1..9] OF TIPOCOLA ) para almacenar
	las colas de distintos niveles de prioridad.
	• Puede llamarse a cualquiera de los procedimientos sobre colas (INSCOLA , COLAVACIA)
	Se pide:
	a) Escribir un procedimiento AGREGTRABAJO que reciba el nro. ID del usuario y un token
	(representando al trabajo a ejecutar) y agregue el trabajo a la cola adecuada según el ID del
	usuario.
	b) Escribir un procedimiento OBTENERSIGUIENTETRABAJO que devuelva el token del trabajo
	que corresponda ejecutarse a continuación.
	c) Hay que apagar el sistema para el mantenimiento. Todos los trabajos se han de quitar de las
	colas, pero, sin embargo, este sistema es muy amistoso y avisa a los usuarios que sus
	trabajos han de destruirse.
	d) Realizar el procedimiento NOTIFICAR (TOKEN, IDMENSAJE) que realiza la notificación .
	e) Escribir un procedimiento LIMPIATRABAJOS que a medida que va borrando los trabajos, va
	enviando los mensajes (invoca a NOTIFICAR). Se realiza por orden de mayor prioridad.

}
type
	Ttoken = record
		id: integer;
		trabajo: string;
	end;

procedure AgregarTrabajo(var Colas: Tcolasdeprioridad; token: Ttoken);
begin
end;

function ObtenerSiguienteTrabajo(var Colas: Tcolasdeprioridad): Ttoken;
begin
end;

procedure Notificar(token: Ttoken; mensaje: string);
begin
end;

procedure LimpiarTrabajos(var Colas: Tcolasdeprioridad);
begin
end;

var
	SistemaOperativo: Tcolasdeprioridad;
begin
end.