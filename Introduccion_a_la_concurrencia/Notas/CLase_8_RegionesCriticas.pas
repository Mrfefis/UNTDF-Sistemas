{

Aprovechar la idea de no programar la esclucion mutua.

el monitor no es mas que un tipo abstracto de datos, donde yo lo declaro y tengo operaciones que trabajan bajo ese tipo de datos.

Como una clase, con atributos(Datos compartidos)
y hay metodos que operan sobre esos atributos.
unica forma de operar es atraves de los metodos.

Monitor:

es un modulo que modula un objeto abstracto de datos.
contienen variables dentro de la clase.
la exclusion mutua es implicita, no la programa el programador.
si no, no es monitor.

Esclusion atomica de grano grueso. cada operacion. dentro del monitor.

todos los metodos son sincronizados.

Características:
* Contiene variables que almacenan el estado del objeto.
* Un proceso puede acceder a las variables en un monitor únicamente llamando a las operaciones del mismo.
* La exclusión mutua es implícita. Se asegura que los procesos en el monitor no ejecutan concurrentemente.
|----------------------------------------------------------------
* La sincronización por condición se provee explícitamente por medio de las variables de condición. (Esto si se programa.)

Elemento fundamental de los monitores.

NO SON CLASES. Se pueden pensar como clases pero no lo son.

|----------------------------------------------------------------
Ejercicio pendiente:
Organismo, 2 bacterias:Rojas y blancas. y una entra de a 1 la otra de a 2
si entraba x cantidad te moris.
Hay que hacer este codigo.

|----------------------------------------------------------------

Operación Significado
cwait(cn)               Espera al final de la cola
cwait(cn, rank)         Espera en orden creciente de rank
csignal(cn)             Despierta al proceso al frente de la cola 
                        y continúa o no (SC o SW).
csignal_all(cn) ó       Despierta a todos los procesos en cn y 
broadcast(cn)           luego continúa o no (SD o SW)
empty(cn)               Devuelve true si la cola de cn está vacía.
minrank(cn)             Devuelve el valor de rank del proceso al frente de la cola




compilar con una o dos semanticas le jr.

el martes 14

}