Clase 3:

{   Repaso:

    Definición: Un autómata finito determinista es una quíntupla
    M=(Q,Σ,q,F,δ)
    Donde:
    - Q es un conjunto finito de estados.
    - Σ es un alfabeto de entrada.
    - q es el estado inicial
    - F es una colección de estados finales o de aceptación
    - δ es una función de transicion δ:QxΣ -> Q que determina el único 
    estado  siguiente para todo par (qi,σ) correspondiente al 
    estado actual y a la entrada.

    ● Extensión de la función de transición: A partir de la 
    función de transición δ de un AFD, se puede definir 
    una nueva función  :QxΣ*Q que utiliza cadenas 
    en lugar de símbolos para pasar de un estado a 
    otro donde
    ^
    δ(q,x){ q       si x=λ
            ^
        {  δ(δ(q,a),y) si x=ay a∈Σ,y∈Σ*

    Sirve para simplificar un diagrama/Expresion

    Fin del Repaso
}

Autómata finito no determinista: podemos ver al 
AFND como una extensión del AFD en el que se permite 
que de un estado se realicen cero, una o mas transiciones 
mediante el mismo símbolo de entrada.

{Fundamentos03 - 9/58}

aceptador, es que tenga los 2 circulitos.

Definición: Un autómata finito no determinista es 
una quíntupla
M=(Q,Σ,q,F,Δ) donde:
- Q es un conjunto finito, no vacío de estados.
- Σ es el alfabeto de entrada.
- Δ es una relación sobre (QxΣ)xQ y se llama 
relación de transición.
- q es el estado inicial.
- F es el conjunto de estados aceptadores.

    --------------------
    | δ  |   a    | b   |   (b+ab*+aa*b)
    --------------|-----|
    |Q0  | q1, q2 |  q4 |
    |Q1  |   q1   |  q2 |
    |Q2  |   -    |  -  |
    |Q3  |   -    |  q3 |
    |Q4  |   -    |  -  |
    ---------------------

Ejercicios:
- Construya un AFND para el lenguaje 
(a*b*)*(aa+bb)(a*b*)*.
- Verifique si las cadenas babba y aabaaba son 
aceptadas por el autómata anterior.


M=(Q,Σ,q0,F,Δ)
- Q = {Q0,Q1,Q2,Q3}
- Σ = {a,b}
- F = {q3}

    -------------------------
    | δ  |   a    | b       |   (a*b*)*(aa+bb)(a*b*)*
    --------------|---------|
    |Q0  | q0, q1 |  q0, q2 |
    |Q1  |   q3   |  -      |
    |Q2  |   -    |  q3     |
    |Q3  |   q3   |  q3     |
    -------------------------

El tipo no determinista, podes elegir que camino tomar. LOL.

=================================

- Construya un AFND para el lenguaje ab*+ab*a.


Configuracion, es la representacion de un instante 
del reconocimiento de la cadena, un paso.

Definir formalmente cuando un automata finito acepta un 

Configuracion de los pasos.

cuando una cadena es aceptada por un automata
todas las cadenas que cumplen con eso.

lenguaje aceptado por un automata

Lenguaje reconocido por M

L(M)= {w E Σ*|(q0,w)˫*(qf,λ) con qf E F}



Simplificacion de Automata.





