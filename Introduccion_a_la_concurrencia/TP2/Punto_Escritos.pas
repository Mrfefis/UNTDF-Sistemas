{
    === * === * === * === * === * === * === * === * === * === * === * ===
1. Explique las diferencias entre espera ocupada o activa (busy waiting) y bloqueo. 

¿Es la espera activa menos eficiente (en términos de uso del procesador) que el bloqueo?

    Respuesta:
    La espera ocupada o activa (busy waiting) y el bloqueo son dos técnicas de sincronización utilizadas en programación concurrente para evitar condiciones de carrera y asegurar la consistencia de los datos compartidos entre múltiples procesos o hilos.

1. Espera Ocupada o Activa (Busy Waiting):
   - En la espera activa, un proceso o hilo continúa ejecutando un bucle de verificación repetidamente hasta que se cumple una condición específica.
   - Durante este bucle, el proceso está activamente consumiendo ciclos de CPU verificando la condición de sincronización, sin realizar ninguna otra tarea útil.
   - No hay bloqueo real del proceso o hilo durante este tiempo, y el sistema operativo considera que el hilo está en un estado de ejecución.
   - Es una técnica simple pero puede ser ineficiente en términos de uso del procesador, ya que consume recursos de CPU incluso cuando no hay ninguna acción útil que realizar.

2. Bloqueo:
   - En el bloqueo, un proceso o hilo solicita acceso a un recurso compartido, como una sección crítica o un objeto sincronizado.
   - Si el recurso está disponible, el proceso o hilo lo obtiene y continúa su ejecución.
   - Si el recurso está ocupado, el proceso o hilo se bloquea y se coloca en un estado de espera hasta que el recurso esté disponible.
   - Durante este tiempo de espera, el proceso o hilo no consume ciclos de CPU y se libera para que otros procesos o hilos puedan utilizar el procesador.
   - El proceso o hilo bloqueado se despierta cuando el recurso se libera y está disponible para su uso.

En cuanto a la eficiencia en términos de uso del procesador, la espera activa es generalmente menos eficiente que el bloqueo. Esto se debe a que, durante la espera activa, el proceso o hilo está consumiendo ciclos de CPU continuamente, incluso cuando no hay ninguna tarea útil que realizar. En contraste, durante el bloqueo, el proceso o hilo se coloca en un estado de espera y no consume recursos de CPU hasta que el recurso necesario esté disponible. Por lo tanto, el bloqueo tiende a ser más eficiente en situaciones donde se espera que los tiempos de espera sean largos, ya que permite que otros procesos o hilos utilicen el procesador de manera más efectiva mientras se espera la disponibilidad del recurso.

    === * === * === * === * === * === * === * === * === * === * === * ===

2. ¿Porqué las operaciones sobre los semáforos deben ser atómicas?

    Las operaciones sobre los semáforos deben ser atómicas para garantizar la consistencia y evitar condiciones de carrera en entornos de programación concurrente. La atomicidad en este contexto significa que una operación sobre un semáforo se realiza como una unidad indivisible e irreversible, es decir, no puede ser interrumpida ni dividida en partes por otros procesos o hilos mientras se está ejecutando. Hay varias razones por las cuales es crucial que las operaciones sobre semáforos sean atómicas:

1. Evitar condiciones de carrera: 
En un sistema concurrente, múltiples procesos o hilos pueden intentar acceder al mismo semáforo simultáneamente. Si las operaciones sobre el semáforo no son atómicas, existe el riesgo de que se produzcan condiciones de carrera, donde el resultado de las operaciones depende del orden de ejecución de los procesos o hilos, lo que puede llevar a comportamientos no deseados o inconsistentes en el programa.

2. Consistencia del semáforo: 
Si una operación sobre un semáforo no es atómica, podría ocurrir que un proceso o hilo lea o modifique el valor del semáforo en medio de una operación realizada por otro proceso o hilo. Esto puede llevar a resultados impredecibles y a un mal funcionamiento del sistema de sincronización.

3. Integridad de los datos: 
Los semáforos suelen utilizarse para coordinar el acceso a recursos compartidos. Si las operaciones sobre los semáforos no son atómicas, podría ocurrir que varios procesos o hilos intenten modificar el estado del semáforo al mismo tiempo, lo que podría provocar una corrupción de los datos o un acceso incorrecto a los recursos compartidos.


    === * === * === * === * === * === * === * === * === * === * === * ===
3. Suponga que una máquina tiene instrucciones atómicas de incremento y decremento:
INC(var) y DEC(var). Estas operaciones suman y restan respectivamente 1 a var.
Asumiendo que las lecturas y escrituras a memoria son operaciones atómicas:
    
    a) Es posible simular las operaciones wait y signal de un semáforo general s?. Si lo es, proporcione la simulación y explique el funcionamiento. Caso contrario, explique detalladamente porqué no es posible.

    b) Ahora asuma que INC y DEC también devuelven el bit de signo del valor final de
    var. En particular, si el valor final de var es negativo, las operaciones devuelven 1, en otro caso, 0. Es posible en este caso simular las operaciones wait y signal para un semáforo general s?. Si lo es, escriba la simulación y explique su funcionamiento, sino, explique detalladamente porqué no es posible.

--
a) Simulación de las operaciones wait y signal sin bit de signo:

Para simular las operaciones wait y signal de un semáforo general `s` utilizando las instrucciones atómicas de incremento (INC) y decremento (DEC), podemos implementar un algoritmo basado en una variable compartida que actúe como el valor del semáforo. Aquí está una posible simulación:

1. Inicialización del semáforo:
   Inicializamos el semáforo `s` con un valor entero no negativo que representa la cantidad de recursos disponibles. Por ejemplo, si `s = 1`, indica que hay un recurso disponible.

2. Operación wait (esperar):
   La operación wait intenta adquirir un recurso. Si `s > 0`, decrementamos `s` utilizando la operación DEC para adquirir el recurso. Si `s = 0`, la operación wait se bloquea hasta que el semáforo se incremente por medio de la operación signal.

   ```python
   def wait(s):
       while True:
           if s > 0:
               DEC(s)  # Adquirir recurso
               break
   ```

3. Operación signal (liberar):
   La operación signal libera un recurso. Incrementamos `s` utilizando la operación INC para indicar que el recurso está disponible.

   ```python
   def signal(s):
       INC(s)  # Liberar recurso
   ```

Este algoritmo asegura que solo un hilo puede adquirir un recurso cuando está disponible. Sin embargo, no es una implementación real de un semáforo, ya que la operación DEC podría no ser atómica si se ejecuta en paralelo con otras operaciones de lectura/escritura.

b) Simulación de las operaciones wait y signal con bit de signo:

Si INC y DEC también devuelven el bit de signo del valor final de var (1 para negativo, 0 para no negativo), podemos usar esta información para simular las operaciones wait y signal de manera más robusta. Aquí está una posible simulación:

1. Inicialización del semáforo:
   Al igual que en el caso anterior, inicializamos el semáforo `s` con un valor entero no negativo que representa la cantidad de recursos disponibles.

2. Operación wait (esperar):
   La operación wait intenta adquirir un recurso. Si `s > 0`, decrementamos `s` utilizando la operación DEC y verificamos si el resultado es no negativo (bit de signo = 0). Si el resultado es negativo (bit de signo = 1), significa que no se pudo adquirir el recurso y esperamos hasta que el semáforo se incremente por medio de la operación signal.

   ```python
   def wait(s):
       while True:
           DEC(s)
           if SIGN_BIT(DEC(s)) == 0:  # Verificar bit de signo
               break  # Adquirir recurso
           else:
               INC(s)  # Restaurar valor si no se adquiere recurso
   ```

3. Operación signal (liberar):
   La operación signal libera un recurso. Incrementamos `s` utilizando la operación INC.

   ```python
   def signal(s):
       INC(s)  # Liberar recurso
   ```

Esta implementación utiliza la información del bit de signo para asegurar que solo un hilo pueda adquirir el recurso cuando esté disponible y evita bloqueos potenciales. Sin embargo, aún existen posibles problemas de concurrencia que podrían surgir en entornos de ejecución real, como la reentrada o la ejecución simultánea de varias operaciones DEC y INC.

    === * === * === * === * === * === * === * === * === * === * === * ===
    4. Implemente la operación TestAndSet en JR, utilizando los semáforos provistos.

    Este punto lo hago separado. Como TP2_4.jr

    === * === * === * === * === * === * === * === * === * === * === * ===
    5. Utilice semáforos en JR para proporcionar una solución al clásico problema “productores / consumidores” con las siguientes variantes:
    a) búffer simple, 1 productor y 1 consumidor.
    b) búffer ilimitado, 1 productor y 1 consumidor.
    c) búffer ilimitado, n productores y m consumidores.
    d) búffer acotado, 1 productor y 1 consumidor.
    e) búffer acotado, n productores y m consumidores.

    Este punto lo hago separado. Como TP2_5.jr
    === * === * === * === * === * === * === * === * === * === * === * ===
    6. Implemente semáforos binarios en JR valiéndose de los semáforos que éste provee.

    Este punto lo hago separado. Como TP2_6.jr
    === * === * === * === * === * === * === * === * === * === * === * ===
    7. Este punto lo hago separado. Como TP2_7.jr
    === * === * === * === * === * === * === * === * === * === * === * ===
    8. Este punto lo hago separado. Como TP2_8.jr
    === * === * === * === * === * === * === * === * === * === * === * ===
    9. Este punto lo hago separado. Como TP2_9.jr
    === * === * === * === * === * === * === * === * === * === * === * ===
    10. Este punto lo hago separado. Como TP2_10.jr
    === * === * === * === * === * === * === * === * === * === * === * ===
    11. Este punto lo hago separado. Como TP2_11.jr
    === * === * === * === * === * === * === * === * === * === * === * ===
    12. Este punto lo hago separado. Como TP2_12.jr
    === * === * === * === * === * === * === * === * === * === * === * ===

}