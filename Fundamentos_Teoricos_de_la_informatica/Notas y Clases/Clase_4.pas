Para cada no determinista, existe uno determinista.


Lenguajes regulares y autómatas finitos:

● Transiciones-λ: 
    llamaremos transiciones-λ a las 
    transiciones que no consumen símbolos de la 
    cinta.

- Las transiciones-λ permiten realizar cambios de 
estado sin la necesidad de leer símbolos.

● Autómata finito no determinista con  
transiciones λ (AFND-λ) es una quíntupla.

M=(Q,Σ,q,F,Δ)
 - Q es un conjunto finito, no vacío de estados.
 - Σ es el alfabeto de entrada.
 - Δ es una relación sobre (QxΣ U {λ})xQ y se llama 
    relación de transición.
 - q es el estado inicial.
 - F es el conjunto de estados aceptadores.  


● Clausura lambda de un estado (λc) 
  λc(q)= 
    {p/p es un estado del autómata accesible   
    directamente desde q sin consumir ningún símbolo 
    de la entrada}

 - q pertenece siempre a λc(q) ya que puedo   
quedarme en el estado sin consumir ningún 
símbolo.

● Clausura lambda de un conjunto de estados (λc) 
 λc({q1,q2,...,qn})= U^n v(k=1) λvc(qvk)
