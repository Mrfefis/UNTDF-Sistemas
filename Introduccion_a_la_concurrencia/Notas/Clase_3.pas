{ 
VER POLITICAS DE SCHEDULING Y FAIRNESS.


Es incondicionalmente justa, si en algun momento se va a activar.

elegibles, seria la accion atomica, a continar, de manera incondicional, no son de gran gruezo,
una instruccion del procesador.


-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

Cosas:
Uncondicional Fairness

Weak Fairness

Strong Fairness

-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
Politica, debilmente justa.

las acciones condicionales, que tienen condiciones de demora, no hace x cosa sin antes otra cosa.

una politica debilmente justa dice, que asi:
si es incondicionalmente justa, pero que ademas, toda accion atomica, condicional, que sea elegible, 
eventualmente se ejecutara.
asumiendo que su estado se vuelve (Amenudo) true, para poder seguir ejecutando serie de instrucciones

"Incondicionalmente justa"

Ejemplo:

Procesos:

Proceso 1
Bool continue = true, try = false;
{
    cobegin
    {
        While (Continue) {Try=true; try=False;}
        //
        <Await (try) continue = false;>
    }
    coend
}

//try es infinitamente amenudo true, y tambien es infinitamenta amenudo false. ?¡?¡?¡?¡?¡? Waath????
//VER URGENTE UN LIBRO DEL TEMA.

una politica debilmente justa, si yo te doy un procesador, yo so, a vos proceso, para ejecutarse hasta terminar.
que pasa.
si solo ejecuto, el so, no recupera el control de la cpu. hasta que te mueras proceso.
debilmente justa, muere el pc xD

de algun modo, se ejecuta... si tengo una debilmente justa...

Strongly fair, 
Weakly fair.
    Ver urgente definiciones.

    quitarle el control al proceso es tener poder, en el cpu, para con el sistema operativo(SO)


Una politica de planificacion fuertemente justa(strongly fair),


Codigo adicional, 


Si mi planificador del sistema operativo, es debilmente justo, algunas soluciones concurrentes, no funciones

si es fuertemente justa, en algun moemento esto va a ocurrir.
entonces todo el programa puede terminar normalmente.


/////////////////////////////////////////////////////////////////////

Deadlock, livelock, starvation;  // Evitar, dataso.

Un deadlock, es:
    2 o mas procesos que estan compitiendo por el uso de recursos, se quedan bloqueados esperando obtenerlos.

    es como que A, requiere de B y B de A, entonces quedan bloquados, porque no puedem liberar el espacio de su recurso.

    Los recursos son:
        Reusables: los que pueden ser usados  y no se agotam como el hard.

        Consumibles: un elemento de un buffer, una variable, algo en una cache. creados y destruidos. luego de ser consumido, deja de existir.

Para que realmente sea asi, se tienen que dar estas 4 condiciones:
    1) Exclucion mutua: Un recurso es utilizado por un proceso a la ves, mientras es usado, nadie mas lo puede utilizar.
    2) Hold and Wait: hasta no devolver, lo sigue reteniendo al recurso, un proceso.  me asignan un recurso, lo guardo, pido otro, y espero. no suelto lo que ya tengo.
    3) No Preemption: quitar, desasignar. si un proceso tiene asignado un recurso, no se lo puedo quitar. 
    4) Circular Wait: Si no detectamos una espera circular, entre procesos y recursos, tampoco tenemos un deadlock.

    si existen las 3 primeras, puede ser que no se rompa, porque es como la ultima para reventarte la pc.

    1,2,3 son condiciones necesarias, mas no suficientes.

    Hacer ejercicio: 
    la tasa de criminalidad???
    una buena solucion, necesita que trabajes con exclucion mutua
    como que retroceda uno, para que otro avance(?) retroceder, libero el recurso de uno, para que otro pase(?)
    pero no puedo.

    ES INDESIABLE
    Prevencion:

    Es restrictiva: antes de que valla a ocurrir, darse cuenta y entonces, hay 2 formas de hacer Prevencion
    Indirecto: Ataca a las 3 condiciones necesarias.
    Directo: previene la ocurrencia de la 4 condicion.

    Otra estrategia:
    Deteccion:
    si tenes una tasa baja de deadlock, te la jugas(?), consume mucho tiempo el detectar esto.
    muchos checks, al pedo, y aveces no podes permitir,
    alternativas:
        Si detectas, es que ya paso, que hago?
        Alternativas para recuperarme de un deadlock:
            1) Abortar todos los procesos.
            2) Volver todos los procesos a un estado previo (???? ALTA PILA FALOPA)
            3) Ir matando de a 1 los procesos(? xDDDD ruleta rusa)
            4) Desasignar recursos, hasta salir del deadlock.
        TODAS LAS SOLUCIONES ESTAS SON MALAS.
        si usas esto, se conciente de que vas a perder informacion.

    Evasion(Avoidance):
    evitar que ocurra.
    la cosa pasa por asignar recursos, dinamicamente, entonces, yo tengo 2 tipos de soluciones
    inteligencia a la hora de asignar recursos.
    no comenzar un proceso si su demanda, puede, quizas generar un deadlock.
    entonces, si la sumatoria del max de los recursos, que necesitan todos los procesos, es mayor no largo el nuevo proceso.
    esto tiene el problema de que es super restrictivo.
    es muy raro que pase que el so este usando todo a la vez. es raro que pase. para eso se pausa todo, todo el tiempo, y entra uno y sale otro, etc.
    Esto, ademas, requiere que un proceso declare todos los recursos que vas a usar.

    que se hace, hacerlo a medida que se van pidiendo los recursos.
    a medida que se va ejecutando cada proceso, va requiriendo nuevos recursos.

    ante un requerimiento, el SO, se lo va a asignar a ese recurso, siempre que se mantenga el sistema en un estado seguro.
    El SO intenta siempre que el sistema es te en un estado seguro, y que toda asignacion de recusos, siga llevando mi sistema a otro estado seguro.

    si uno quiere una solucion integral:
        -siempre basado en parametros-
        sino, todo es relativo. 
    
    puede ser, clasificar los tipos de recursos, y tenerlos como, discos, pantallas etc, y ademas dentro de cada uno de los tipos, usar un orden.
    y en cada iuno de esos tipos, ahi, aplicar... porque hay recursos que quizas...
    asdasdasd

    el algoritmo del banquero(????)

    PODEMOS ARRANCAR POR LA PRACTICA!!!
    


























}