{

Problemas de la seccion critica:

si el so no tiene un sistema d eplanificacion fuertemente justa, podria no salir de un spinning

Algoritmos clasicos de soluciones fair

fuertemente justa. es lo que necesita.

Situaciones de empate, donde los dos estan pugnando tratando de entrar.
se va a tratar de favorecer a uno y no otro para generar una secuencia de entrada

tie-break.

tratando de darle turnos, de uno a otro.

Dekker: 

denominamos instrucciones de software(?)

Petterson, variantes de un rompimiento de empate(Tie-Break)

Andrews: 


Algoritmos clásicos de soluciones fair: Tie-Breaker.
Algoritmo de Peterson, según Andrews. Solución fine-
grained para n procesos

}

Exclusivamente software:

int in[1:n] = ([n] 0), last[1:n] = ([n]) 0);
process CS[i = 1 to n] 
{
    while (true) 
    {
        for [j = 1 to n] 
        {
            in[i] = j; last[j] = i;
            for [k = 1 to n st i <> k] 
            {
                while (in[k] >= in[i] and last[j] == i) skip; 
            }
        }
        critical section;
        in[i] := 0;
        noncritical section;
    }
}
=========================================================
Soluciones Hibridas, hacen 2 cosas en 1: Ticket
En la test and set, omparaba un valor y seteaba.
ahora lo que hace esta:
incremente un valor y devuelve un resultado. de forma atomica.

int number = 1, next = 1, turn[1:n] = ([n] 0);
process CS[i = 1 to n] 
{
    while (true) 
    {
    turn[i] = FA(number, 1);
    while (turn[i] != next) skip;
    //critical section;
    next = next + 1;
    //noncritical section;
    }
}

//Fetch and Add: FA, es una instruccion hard atomica.
//incrementa un valor y devuelve el resultado.
//es una instruccion de hardware.

//Hay metodos para hacer sincronizar un bloque como si fuera atomico.


==============================================================

Algoritmos clásicos de soluciones fair: Bakery. Una solución 
más simple que tie-break.
Solución fine-grained, fair, que no requiere instrucciones de 
máquina especiales:
le pregunto a todos los demas, me llevo el numero mas alto con un +1. facilito.


int turn[1:n] = ([n] 0);
process CS[i = 1 to n] 
{
while (true) 
    {
    turn[i] = 1; turn[i] = max(turn[1:n]) + 1;
    for [j = 1 to n st j != i]
    while (turn[j] != 0 and 
        (turn[i],i) > (turn[j],j)) skip;
    //critical section;
    turn[i] = 0;
    //noncritical section;
    }
}

===============================================================

Hasta ahora esas son las unicas formas, herramientas que conoces para 
solucionar el problema de la seccion critica:

Se soluciona haciendo: Exclusion mutua. 

    Podemos llegar que con esas variantes, tie-breaker, bakery,Ticket.

Formas de sincronizacion 2: Una demora.
Sincronizacion por condicion:

lo que haya sea una condicion de demora: Ejemplo: el cocinero con el ayudante si.

lo que tengo ahi,es una condicion de demora en los dos procesos.
hasta que el otro finalice, basicamente.
ambos esperan hasta que ambos esten en ok.

se demoran hasta el momento correcto.

Un caso especial de la Sincronizacion por condicion: Barrier.
Llamada así debido a que el punto de retardo al final de 
cada iteración representa una barrera a la que todos los 
procesos tienen que llegar antes que se les permita pasar.

Tipo de sincronización típicamente utilizado en soluciones 
paralelas.

process worker[i = 1 to n] 
{
    while (true) 
    {
        código para implementar la tarea i;
        Esperar hasta que las n tareas lleguen aquí;
    }
}
//Esto se suele usar en programacion paralela, son iguales solo que trabajan con distintos conjutos de datos.


Entonces:
Posibles soluciones: 1. Contador compartido.
Es la forma más simple de especificar los requerimientos 
para una barrier.

// Solución coarse-grained
int count = 0;
process worker[i = 1 to n] {
while (true) {
código de la tarea i;
< count = count + 1; >
< await (count == n); >
}
}

// Solución fine-grained
int count = 0;
process worker[i = 1 to n] {
while (true) {
código de la tarea i;
FA(count,1);
while (count != n) skip;
}
}


Todos se van a quedar esperando en un: Livelock.

Flags y cordinadores:
Posibles soluciones: 2. Flags y coordinadores:
Se pueden solucionar los problemas de shared counter 
utillizando un conjunto adicional de variables compartidas 
y un nuevo proceso coordinador.

int arrive[1:n] = ([n] 0), 
continue[1:n] = ([n] 0);
process worker[i = 1 to n] {
while (true) {
código de la tarea i;
arrive[i] = 1;
< await (continue[i] ==1); >
continue[i] = 0;
}
}

process coordinator {
while (true) {
for [i = 1 to n] {
< await (arrive[i] == 1); >
arrive[i] = 0;
}
for[i=1 to n] continue[i]=1;
}
}

El coordinador lo obliga a ser secuencial


los workers se pueden usar en arboles:
    
Posibles soluciones: 3. Arboles.
las barreras se usan en procesos paralelos, por eso en formas de arboles los procesos.
// Leaf node L:
arrive[L] = 1;
< await (continue[L] == 1); >
continue[L] = 0;

// Root node R:
< await (arrive[left] == 1); >
arrive[left] = 0;
< await (arrive[right] == 1); >
arrive[right] = 0;
continue[left]=1; continue[right]=1;

// Interior node I:
< await (arrive[left] == 1); >
arrive[left] = 0;
< await (arrive[right] == 1); >
arrive[right] = 0;
arrive[I] = 1;
< await (continue[I] == 1); >
continue[I] = 0;
continue[left]=1; continue[right]=1;


=================================================================================

Posibles soluciones: 4. Barreras simétricas.
Propone una mejora respecto a la presunción de que 
todos los procesos en un multiprocesador llegan a su 
barrera casi al mismo tiempo.

// barrier code for worker w[i]
< await (arrive[i] == 0); >
arrive[i] = 1;
< await (arrive[j] == 1); >
arrive[j] = 0;

// barrier code for worker w[j]
< await (arrive[j] == 0); >
arrive[j] = 1;
< await (arrive[i] == 1); >
arrive[i] = 0;

Una solución para n procesos se construye combinando 
instancias de barreras de 2 procesos.
    El modo de interconexión constituye una variante:
        Butterfly barrier => n debe ser potencia de 2.
        Dissemination barrier => cualquier n


algoritmo de hearth-beat
los procesos organizados en arbol: nodos de una red
y vos tenes que contar los nodos de una red.

===============================================================================================

Introduccion a los semaforos:
Definición, características, sintaxis y semántica:

Es un tipo especial de variable compartida que es 
manipulada sólo por dos operaciones indivisibles: P y V (o 
wait y signal).

* signal: señala la ocurrencia de un evento, e incrementa el 
valor del semáforo.

* wait: demora a un proceso hasta que ocurra un evento. La 
espera es hasta que el valor del semáforo sea positivo, 
entonces decrementa el mismo.

* Se puede pensar en un semáforo como una instancia de 
una clase Semáforo (tipo de dato abstracto), siendo wait y 
signal dos métodos atómicos.

* El valor de un semáforo es un entero no-negativo.

Normalmente la onda es un proceso quiere entrar, pide permiso y si puede entra.
destrabando al salir.

primitivas, 



}