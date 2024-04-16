Introduccion a semaforos.

suele ser el parcial:
    mitad de mayo(?)
porque el contenido siguiente es menor. 

la teoria normalmente se termina mucho antes.
es muy practica.

es manejaad por 2 operaciones indivisibles, inicializacion como otra primitiva mas.
no necesariamente es atomica.
es para tocar la parte entera del semaforo.

yo no debo meterme a toquetear la variable entera del semaforo.

nosotros tenemos, el 
P sistem
===================
proceso_1
wait
...
signal
...
===================
Proceso_2
wait
...
signal
...

el semaforo es unicamente manipulado por el wait y signal que son atomicas. y dice: el valor de un semafor es un entero no negativo.
algunas implementaciones si lo hacen, las que usaremos nosotros no.

Hay dos clases de semaforos:    generalmente se inicializa en 1. 
    Binarios: que solo toman valores 0 y 1.
    cuando hacemos exclusion mutua, con un binario alcanza.
    sin embargo, normalmente usamos un semaforo general, que es el que permite n valores positivos en el entero.

    Generales: que toman n valores, en general los valores de las variables enteras, se inicializan n siendo n el numero de recursos que queremos proteger.
    no es para exclusion mutua, tiene que ver con otras cosas.

    Problemas clasicos de IPC: Inter proces comunication.
    barberos, filosofos, problemas clasicos.
    semaforos, nos permiten hacer mas cosas.

    en general, para el manejo de la cola, se usa fifo, first in, first out. 
    Entran al semaforo en cola.

    wait y signal deben ser siempre: los n waits a lo largo de la ejecucion de un programa, tienen que ser menor o igual a los n signals + el valor de inicialisacion.

=======================================================================

sem mutex;
init(mutex,1);
process CS[i = 1 to n]
{
    while (true)
    {
        wait(mutex); // entry protocol: <await (mutex=1) mutex=0;>
        critical section;
        signal(mutex); // exit protocol: <mutex = 1>
        noncritical section;
    }
}

=======================================================================

wait atomico: 
mientras el wait esta activo, ningun otro puede entrar para cualquier cosa.
=======================================================================
Barreras con Semaforos

Barreras: señalización de eventos.
    Se usa un semáforo para cada flag de sincronización.
    Un proceso setea un flag ejecutando signal.
    Un proceso espera que el flag sea seteado y lo limpia con una operación wait

Un signaling semaphore s es usualmente inicializado a 0. 
Un proceso señaliza la ocurrencia de un evento ejecutando 
signal(s) y otro proceso espera la ocurrencia de ese evento 
ejecutando wait(s).

Sincronización Barrier básica de dos procesos con semáforos:

sem llega1 = 0, llega2 = 0;
process worker1 
{
    while (true)
    {
        ...
        signal(llega1);
        wait(llega2);
        ...
    }
}

process worker2 
{
    while (true)
    {
        ...
        signal(llega2);
        wait(llega1);
        ...
    }
}

Recordar que se deben cumplir 2 propiedades:
1. ninguno de los procesos puede pasar la barrera hasta 
que todos hayan arribado.
2. La barrera debe ser reusable.

======================================================
    Problema Productor/es Consumidor/es:

en los sistemas, estos problemas, es de lo mas comun.
siempre que hay un buffer, hay un Productor/Consumidor.


    Proceso Productor.

    Proceso Consumidor.

    Buffer, que puede ser un arreglo de una posicion.
    _______________________________
    | a  | b  |  c |  d | e  |  f |
    _______________________________

    El consumidor, no puede consimir si esta vacio el buffer.
    El productor no puede producir si esta lleno el buffer.

El productor tiene que esperar a que el buffer este vacio
buffer = semaforo inicializado en 1.

Meto un elemento en el buffo, decremento. aviso que esta lleno.
entonces ahora hay un elemento para consumir.

typeT buf;
sem empty = 1, full = 0;
process producer 
{
    while (true)  
    {
        producir data;
        wait(empty);
        buf = data;
        signal(full); 
    }
}

process consumer 
{
    while (true) 
    {
        wait(full);
        result = buf;
        signal(empty);
        consumir result;
    }
}
// 1 productor, 1 consumidor
// buffer simple

Buffer= amortiguador.
amortigua las velocidades. Inteligente.

Es un orden estricto a medida que se llena el buffer como vector.

Inicializado en 0.
Buffer:()()()()

Creador: 
Buffer:(1)()()()
Buffer:(1)(2)()()
Buffer:(1)(2)(3)()
Buffer:(1)(2)(3)(4)

Consumidor:
Buffer:()(2)(3)(4)
Buffer:()()(3)(4)
Buffer:()()()(4)
Buffer:()()()()

Semaforos generales, para contadores de recursos.
El buffer como tipo cualquiera,2 enteros, punteros a los indices del buffer
Dos semaforos, vacio y 1.
El vacio inicializado en n, quiere decir que puede tener n elementos.

Que hace el productor? Genera un item y pone wait.
n-1 en el primer ciclo.


typeT buf[n];
int front = 0, rear = 0;
sem empty = n, full = 0;
process producer 
{
while (true)  
    {
    producir data;
    wait(empty);
    buf[rear]=data;
    rear = (rear+1) % n;
    signal(full); 
    }
}

process consumer 
{
while (true) 
    {
    wait(full);
    result = buf[front];
    front=(front+1) % n;
    signal(empty);
    consumir result;
    }
}

=======================================================
Problema Productor/es Consumidor/es:
Múltiples Productores y Consumidores, buffer acotado.

typeT buf[n];
int front = 0, rear = 0;
sem empty = n, full = 0;
sem mutexD = 1, mutexF = 1;
process producer [i=1 to m] 
{
while (true)  
    {
    producir data;
    wait(empty);
    wait(mutexD);
    buf[rear]=data;
    rear = (rear+1) % n;
    signal(mutexD);
    signal(full); 
    } 
}

process consumer 
{
while (true) 
    {
    wait(full);
    wait(mutexF);
    result=buf[front];
    front=(front+1) % n;
    signal(mutexF);
    signal(empty);
    consumir result;
    }
}

Perdes el nivel de concurrencia al meter muchos waits.
Sirve como maxima, para la vida?
si tengo una solucion :

MiProgramaConcurrente:
800Mil lineas de codigo,

Codigo Critico(Porque tine variables compartidas que hay que proteger)
Si a esto le tenes que hacer esclucion mutua, hacelo lo mas chiquito posible.

Minimizar el uso de waits.

========================================================
Forma más compleja (selectiva) de exclusión mutua.

process philosopher[i=0 to 4] 
{
while (true) 
    {
    pensar;
    tomar 2 tenedores;
    comer;
    dejar los tenedores; 
    }
}

sem fork[5] = {1,1,1,1,1};
process philosopher[i=0 to 3] 
{
while (true) 
    {
    wait(fork[i]); wait(fork[i+1]);
    comer;
    signal(fork[i]); signal(fork[i+1]);
    pensar; 
    } 
}

process philosopher[4] 
{
while (true) 
    {
    wait(fork[0]); wait(fork[4]);
    comer;
    signal(fork[0]); signal(fork[4]);
    pensar; 
    } 
}

Solucion 1: que uno agarre los cubiertos invertidos, primero el izquiero y despues el derecho. esto hace que rompe el diseño circular.

========================================================

b) lectores escritores visto como un problema de SC:
Una solución muy restrictiva.

sem rw = 1;
process reader[i=1 to m] 
{
while (true) 
    {
    ...
    wait(rw);
    leer;
    signal(rw); 
    } 
}

process writer[j=1 to n] 
{
while (true) 
    {
    ...
    wait(rw);
    escribir;
    signal(rw); 
    } 
}

