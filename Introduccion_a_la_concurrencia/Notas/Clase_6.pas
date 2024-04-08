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





}