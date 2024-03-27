LiveLock

    #Quiskit ibm, Cuantum computing fundamentals.

+   Es la version "espera ocupada" de deadlock

+   Los procesos que compiten por entrar a su sc estan vivos.

+   Ausencia de livelock, asi como de deadlock es una propiedad de seguridad.


    una variante al deadlock, es livelock: tiene que ver con una forma de acceder a los recursos compartidos, que no ocurre mediante interrupciones.
    es una forma primitiva de acceder a los recursos, sin interrupciones.
    
    los procesos estan trabajando, mantienen ocupado el procesador, en vano.

    quedan dando vueltas. se les llava vivo.


Starvation:
        Situcion en la que a uno o mas pricesos no se les condecen los recursos que requieren para continuar.

    Es una desicion del so, de no entregarle los recursos, porque, por ejemplo tiene la prioridad muy baja, y 
    siempre se le dan recursos a otros de mayor prioridad.

Sincronizacion de variables compartidas:

Siempre toma 2 formas: 
    La exclucion mutua: Solo 1 puede entrar, y nadie mas puede entrar, hasta que sale.  
        Los demas, compiten por entrar.

    sinc por condicion:
        Aca tenemos, por ejemplo al cocinero, que tenia que esperar a que le entreguen la salsa, eso es
        una demora en el programa, hasta que el otro termine de terminar la pasta.

Siempre que hacemos sinc, hacemos 1 u otra de estas dos formas.

Locks:
    * protegen secciones criticas de codigo.
    * tipicamente se utiliza para implementar exclusion mutua.

Barrier:
    * Es un punto de sincronisacion que todos los procesos denem alcanzar antes de que 





El problema de la seccion critica:

codigo critico, se llama a un codigo que da acceso a recursos compartidos.

se pone un lock, cuando uno entra, hasta que sale, avisa que sale al terminar, y se abre la llave.

es un sistema de seguridad para garantizar que entra 1 solo proceso al recurso, a la vez.

Nuestra tarea:
    al encontrar cosas de codigo critico, tenemos que diseñar soluciones.
    4 propiedades tiene que tener nuestro diseño.

    1)  Exclusion Mutua: 

    2)  Ausencia de deadlock(LiveLock): generar safety property. minimo entren 1 o 2 recursos.

    3)  Ausencia de retardos innecesarios:  si la seccion critica esta libre, los recursos, el proceso deberia poder hacerlo sin demoras innecesarias. (Safety Prop)

    4)  Entrada eventual: Un proceso que quiere entrar, debo garantizar que en algun momento le toque ser procesado.( Liveness Prop)

mis soluciones, para que trabajen correctamente, deben tener estar 4 propiedades.

Un proceso que entran en SC, seccion critica, siempre debe salir de ahi, exitosamente.


    Protocolo de Entrada
    Acceso a la seccion Critica.
    Protocolo de salida

Condicion de Carrera: que era? xD

###############  Ejemplo: ###############

bool in1 = false, in2 = false;
#MUTEX: !(in1^in2) //Global variant.

process CS1
{
    while (true)
    {
        < await (!in2) in1 = true; >  // todo esto deberia ser atomico, si no no anda.
        critical section;
        in1 = false;
        noncritical section;
    }
}

process CS2
{
    while (true)
    {
        < await (!in1) in2 = true; > // todo esto deberia ser atomico, si no no anda.
        critical section;
        in2 = false;
        noncritical section;
    }
}


###############  Seguimos: ###############

En un sistema se puede hacer:

Process INT1
{   
    while(true)
    {
        disable interrupts;
        critical section;
        enable interrupts;
        noncritical section;
    }
}

no es adminisble como solucion, hoy.

###############  Ejemplo Lock: Spin-Lock ###############

bool Lock = false;

process CS1
{
    while (true)
    {
        < await (!Lock) Lock = true; >  
        critical section;
        Lock = false;
    salida;
        noncritical section;
    }
}

//Grano fino, grano grueso, son dos cosas diferentes. Ojo.
process CS2
{
    while (true)
    {
        < await (!Lock) Lock = true; >  
        critical section;
        Lock = false;
    salida;
        noncritical section;
    }
}


###############  Seguimos ###############

Spin-Lock: test and set( solucion por hard).
    Instruccion atomica(de maquina) que se puede utilizar para implementar accion atomica condicional como:

    <await (!Lock) Lock = true; >


// Definicion de Andrew
Bool TS(bool lock)
{
    <bool initial = Lock;
    Lock = true;
    return initial; >
}

// definición de Stallings
function testset (var i: integer): boolean;
begin
    if i = 0 then
    begin
        i := 1;
        testset := true
    end
    else 
    testset := false
end.





vamos a generalizar la solucion a n procesos, y usar la test_and_set, testeo y seteo en una operacion atomica.


bool lock = false; // shared lock
process CS[i = 1 to n]
{
    while (true)
    {
        While (TS(lock)) skip; // protocolo ent.
        critical section;
        lock = false; // protocolo salida
        noncritical section;
    }
}

El truco es cerrar todo de forma atomica, para que no haya una condicion de carrera.
hice una inst que hace 2 cosas a la ves, te asegurar la tomisidad, 
ves y trabas, ahi el poder, garantiza la atomisdad de la operacion.
con eso puedo armar una exclucion mutua.

===============================================================

    Mejorado:
    Test And Test and Set:

bool lock = false; // shared lock
process CS[i = 1 to n]
{
    while (true)
    {
        while (lock) skip; // protocolo entrada
        while (TS(lock)); // protocolo entrada
        {
            while (lock) skip; // protocolo entrada
        }
        critical section;
        lock = false; // protocolo salida
        noncritical section;
    }
}

aca la variable pesa en que uno lee la variable muchas veces, 
pero no es lo mismo leer muchas veces, que ejecutar la funcion de entrar al TS
esto es mucho mas eficiente. lo cual, es mas sano para la longevidad de la vida util de la cache.
es mas importante que no rompa al sistema operativo, mas que a la vida util del hard.

Todo tiene que ser atomico.
clave: instrucciones del procesador que hagan 2 cosas a la vez.

===================  Entonces: ===================

Algoritmos clásicos de soluciones fair.

Fair solutions a las Critical Sections.
    Las soluciones tipo spin-lock 
        a) aseguran la exclusión mutua.
        b) son libres de deadlock y 
        c) evitan retardos innecesarios. Sin embargo, 
        d) requieren de una política de strong fairness scheduling para asegurarse que alguna 
    vez lograrán entrar.
    
    Las políticas de scheduling prácticas son weakly fair => 
    con las soluciones spin-lock un proceso que intenta entrar 
    a su SC, quizás no lo logre.
    Para remediar esto, se verán tres soluciones fair al 
    problema de la SC: 
    
    1. Tie-breaker, 
    2. Ticket y 
    3. Bakery.


Si no podemos cortar el spining podria romperse algo.

en general hay muchas politicas debilmente justas, lo cual, es problematico.

hoy casi son siempre fuertemente justas.
y mecanismos hibridos.

===========================================================================

Intentos de solucion: algunos no funcionan. ojo.

program sc;
var turn: 0 .. 1;
turn := 0; // o 1
cobegin
    process0;
    process1;
coend

process0
{
...
while (turn <> 0) skip;
critical section;
turn := 1;
noncritical section;
...
}

process1
{
...
while (turn <> 1) skip;
critical section;
turn := 0;
noncritical section;
...
}

Problemas:
Alternancia estricta.
Si uno de los dos falla, el otro no podrá avanzar.
es malarda.

===========================================================================

program sc;
var flag: array[0..1] of 
boolean; // init false
cobegin
    process0;
    process1;
coend

process0
{ ...
    while (flag[1]) skip;
    flag[0] := true;
    critical section;
    flag[0] := false;
...
}

process1
{ ...
    while (flag[0]) skip;
    flag[1] := true;
    critical section;
    flag[1] := false;
...
}

Problemas:
No garantiza la propiedad de exclusión mutua.
A favor:
No adolece de alternancia estricta.
Si un proceso falla fuera de su SC, el otro puede 
seguir.

esto esta peor. xD

===========================================================================

program sc;
var flag: array[0..1] of 
boolean; // init false
cobegin
    process0;
    process1;
coend

process0
{ ...
    flag[0] := true;
    while (flag[1]) skip;
    critical section;
    flag[0] := false;
...
}

process1
{ ...
    flag[1] := true;
    while (flag[0]) skip;
    critical section;
    flag[1] := false;;
...
}

A favor:
Garantiza la propiedad de exclusión mutua.
Si uno falla fuera de su SC, el otro puede continuar.
Problemas:
Posible livelock.

Sigue siendo una mierda. se puede romper.

===========================================================================

program sc;
var flag: array[0..1] of 
boolean; // init false
co
    process0;
    process1;
oc

process0
{ 
    flag [ 0 ] := true;
    while (flag [ 1 ] ) 
    {
        flag [ 0 ] := false;
        delay;
        flag [ 0 ] := true; 
    }
    critical section;
    flag [ 0 ] := false;
}

process1
{ 
    flag [ 1 ] := true;
    while (flag [0] ) 
    {
        flag [ 1 ] := false;
        delay;
        flag [ 1 ] := true; 
    }
    critical section;
    flag [ 1 ] := false;
}

A favor:
Garantiza la propiedad de exclusión mutua.
Problemas:
Dependiendo del timing de los dos procesos, puede 
haber espera indefinida.

================================================================

program sc;
var  flag: array[0..1] of boolean;
turn: 0 .. 1;
flag[0] := false;
flag[1] := false;
turn := 1;
cobegin
    process0;
    process1;
coend

process0
{ 
    while (true) 
    {
        flag [ 0 ] := true;
        while (flag [1] ) 
        {
            if turn = 1 
            {
                flag[0] := false;
                while (turn=1) skip; 
                flag[0] := true; 
            }
        }     
    }
    critical section;
    turn := 1;
    flag[0] := false;
    ...
}

process1
{ 
    while (true) 
    {
        flag [ 1 ] := true;
        while (flag [0] ) 
        {
            if turn = 0 
            {
                flag[1] := false;
                while (turn=0) skip; 
                flag[1] := true; 
            } 
        }
    }
critical section;
turn := 0;
flag[1] := false;
...
}

Esto anda.























