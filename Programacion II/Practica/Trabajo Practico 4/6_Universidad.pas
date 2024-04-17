program Universidad;
{
	Consigna:
	6- Se desea mantener la siguiente información relativa a los alumnos de la Universidad
	Nacional de Tierra del Fuego:
	• Apellido y Nombres
	• Legajo
	• Domicilio
	• Teléfono
	• Código de la Carrera (entero entre 1 y 15)
	• Cantidad de Materias aprobadas
	• Fecha de Ingreso
	• Baja (0/1)
	Sobre esta información, se desean realizar las siguientes operaciones:
	a) Asociar al archivo un índice de acceso directo (Legajo, posición). Tener en cuenta
	dicha estructura para desarrollar las siguientes operaciones.
	b) Incorporar un nuevo alumno verificando que ya no estuviese cargado.
	c) Dar de baja lógicamente a un alumno determinado.
	d) Proponga una manera de recuperar el espacio generado por estas bajas lógicas.
	e) Mostrar por pantalla la información sobre un alumno particular, a partir de un
	número de legajo.
	f) Modificar la dirección y/o teléfono de un alumno en caso de cambio de domicilio. 
}
const
	n = 1000;
type
	Talumno = record
		nombre: string[100];
		legajo: longword;
		domicilio: string;
		telefono: string[15];
		codigo: 0..999;
		materias: 0..50;
		fecha: string[6];
		baja: boolean;
	end;

	Tciu = file of Talumno;

	Tuni = array[1..n] of longword;

var
	UNTDF: Tciu;
	acceso: Tuni;
begin
	AbrirArchivo(UNTDF, '6_UNTDF.dat');
	
	Close(UNTDF);
end.