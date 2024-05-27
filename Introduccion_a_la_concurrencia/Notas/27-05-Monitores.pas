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

