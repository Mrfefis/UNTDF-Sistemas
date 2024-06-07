program main;
uses crt, Umap, strings;
{
	Consigna:
	Utilizando direccionamiento abierto, resuelva los puntos a y b del ejercicio anterior.

	a. Almacenar los valores en una tabla HASH con 20 posiciones usando el método del
	resto de la división del hashing y el método de direccionamiento cerrado de
	resolución de colisiones.
	b. Almacenar los valores en una tabla HASH con 20 posiciones. Usar CLAVE MOD
	TAMAÑO_TABLA como función HASH y (CLAVE + 3) MOD TAMAÑO_TABLA como
	función REHASH. Direccionamiento abierto.
}
var
	mapa: Tmapa;
begin
	iniciar(mapa);
	insertar(mapa, 620, 'Bruno');
	insertar(mapa, 735, 'Mica');
	insertar(mapa, 66, 'JuanPa');
	insertar(mapa, 47, 'Raul');
	insertar(mapa, 87, 'Colo');
	insertar(mapa, 90, 'Fernando');
	insertar(mapa, 126, 'Mauricio');
	insertar(mapa, 140, 'Roberto');
	insertar(mapa, 145, 'Alejo');
	insertar(mapa, 153, 'Pedro');
	insertar(mapa, 177, 'Luis');
	insertar(mapa, 285, 'Cami');
	insertar(mapa, 393, 'Jonas');
	insertar(mapa, 395, 'Asus');
	insertar(mapa, 467, 'Antonio');
	insertar(mapa, 566, 'Jose');
	imprimir(mapa);
	readkey
end.