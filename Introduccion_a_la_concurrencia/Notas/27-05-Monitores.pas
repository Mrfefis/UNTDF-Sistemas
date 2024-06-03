Monitores:

Un monitor tiene operaciones, o podriamos decir, como una clase con metodos.
toda la logica, pasa a estar dentro del monitor, y la sincronizacion pasa a estar dentro del monitor.

migro la sincronizacion que tenia en mis procesos al monitor. 
justamente para sacarme responsabilidades.

<<Lector escritor, dejamos la zona critica afuera del monitor>>

No puede haber mas de un proceso ejecutando dentro del monitor. 
Solo un proceso puede existir vivo dentro del monitor, eso me garantiza la exclusion mutua.

variable de condicion:
- indica a un puntero, de procesos que estan dentro del monitor.

<< Garantizando la coherencia y la exclusión mutua en el acceso a esos datos por parte de varios procesos concurrentes >>


Semanticas:
Disciplinas de señalamiento (de Signaling):
    Signal and wait: el proceso que haga el wait

<<Lv1>>
Monitor de Hoare (SW):
    1. Thread A entra al monitor.
    2. Thread A espera por un recurso.
    3. Thread B entra al monitor.
    4. Thread B signals al recurso y entra a la cola de signal.
    5. Thread A reingresa al monitor.
    6. Thread A deja el monitor.
    7. Thread B reingresa al monitor.
    8. Thread B deja el monitor.
    9. Otro proceso de la entry queue puede ser admitido.

Cuando das un signal, quedas en wait, de manera implicita, no se escribe, pero si.

<<Lv2>>
Semántica MESA (L&R) (SC):
    1. Thread A entra al monitor
    2. Thread A espera por un recurso
    3. Thread B entra al monitor
    4. Thread B signals al recurso y Thread A va a la entry queue
    5. Thread B continúa en el monitor
    6. Thread B deja el monitor
    7. Thread A reingresa desde la entry queue al monitor
    8. Thread A deja el monitor
    9. Otro proceso de la entry queue puede ser admitido

=========================================================================================

Ejemplo: Implementación de un semáforo con un monitor SC.

monitor semaphore {
int s = 0; ## s>= 0
cond pos;
procedure semwait() {
while (s==0) cwait(pos);
s=s-1;
}
procedure semsignal() {
s=s+1;
csignal(pos);
} }

Ejemplo: Implementación de un semáforo con un monitor 
usando la técnica “passing the condition”.

monitor semaphore {
int s = 0; ## s>= 0
cond pos;
procedure semwait() {
if (s==0) cwait(pos);
else s=s-1;
}
procedure semsignal() {
if (empty(pos)) s=s+1;
else csignal(pos);
} }

##Productor consumidor, con buffer acotado

monitor BoundedBuffer {
    typeT buf[n];
    int front=0, rear=0, count=0;
    ## rear==(front+count)%n // invariante
    cond notFull, notEmpty;

    procedure deposit(typeT data) {
    while (count==n) cwait(notFull);
    buf[rear]=data; (rear++)%n; count++;
    csignal(notEmpty);
    }

    procedure fetch(typeT &result) {
    while (count==0) cwait(notEmpty);
    result=buf[front]; (front++)%n; count--;
    csignal(notFull);
    } 
}

Lectores y Escritores con broadcast.

monitor RWcontroller {
    int nr=0, nw=0;
    cond okToRead, okToWrite;

    procedure requestRead() {
    while (nw>0) cwait(okToRead);
    nr++; }

    procedure releaseRead() {
    nr--;
    if (nr==0) csignal(okToWrite); }
    procedure requestWrite() {
    while (nr>0 || nw>0) cwait(okToWrite);
    nw++; }

    procedure releaseWrite() {
    nw--;
    csignal(okToWrite); csignal_all(okToRead); }
}

======================================================================

Rendezvous: -Encuentro- forma de sincronización en la que 
los procesos se encuentran en un punto. 

Mecanismo de comunicación sincrónico.

Concepto similar a Barriers, aunque barreras es aplicado a 
algoritmos paralelos. 

Rendezvous permite la sincronización de distintos algoritmos, 
por ejemplo un server puede hacer rendezvous con clientes 
de distinto tipo.

(Sigue siendo un monitor)
<<Es una tecnica tal como la barrera de semaforos>>


Monitor dividido, separamos los elementos para proveer concurrencia.
