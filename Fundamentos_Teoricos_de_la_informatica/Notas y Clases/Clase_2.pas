{
    
Definicion de alfabetos, definimos cadenas sobre el alfabeto, 


operaciones sobre simbolos, cadenas y lenguajes

clausuras positivos del alfabeto y que un lenguaje es un subconjunto de

conjunto infinito.

Hoy veremos los Lenguajes regulares:
Se pueden expresar con expresiones regulares.

expresion regular sobre un alfabeto sigma, son cadenas obtenidas a partir del alfabeto

vacio, lamba, son Expresion Regular (ER)

todo simbolo iE Sigma es ER             Sigma: La E de sumatoria.



Expresiones regulares equivalentes:

se usa para sintaxis en los compiladores.

para reconocer los tokens de los lenguajes regulares.


=============================

Lenguajes regulares y autómatas finitos
● Hemos definido los lenguajes regulares y que forma  
tienen las cadenas que los componen. ¿Cómo 
verificamos que una cadena pertenece a un lenguaje 
regular?.
● Un autómata finito es una máquina abstracta que 
utilizaremos como:
- dispositivo reconocedor de que una cadena pertenece 
a un lenguaje determinado.
- como traductor de una cadena a otra

● Un AF puede imaginarse como una máquina capaz de 
leer símbolos de una cinta.
● Se representa como un grafo dirigido
- los nodos del grafo se llaman estados y representan 
hasta que lugar se ha analizado la cinta.
- las aristas del grafo se llaman transiciones y están 
etiquetadas con símbolos del alfabeto.
- definiremos uno de los estados como estado inicial.
- definiremos uno o mas estados como estados finales


Funcionamiento:
Comenzamos por el estado inicial, el autómata lee un 
símbolo de la cinta, si el carácter leído concuerda con la 
etiqueta de alguna transición, nos desplazamos al estado 
donde nos lleve la transición. Luego el autómata lee el 
siguiente símbolo y se procede de la misma forma. Una vez 
que se han consumido todos los símbolos de la cinta, si nos 
encontramos en un estado final o aceptador la cadena es 
aceptada, por lo tanto pertenece al lenguaje, en otro caso la 
cadena es rechazada.

Definición: Un autómata finito determinista es una quíntupla
M=(Q,Σ,q,F,δ)
Donde:
- Q es un conjunto finito de estados.
 - Σ es un alfabeto de entrada.
 - q es el estado inicial
 - F es una colección de estados finales o de aceptación
 - δ es una función  δ:QxΣ -> Q que determina el único 
estado  siguiente para todo par (qi,σ) correspondiente al 
estado actual y a la entrada.


Ejercicios:
- Sobre el alfabeto Σ={0,1}, construya un 
autómata finito determinista que acepte las 
cadenas que contengan un número par de ceros.


Definicion formal del automata: el grafo es para guiarse nomas.


Q0 --- 0 ----> Q1  
   <--- 1 ----



M=(Q,Σ,q0,F,δ)
Q={Q0,Q1}
Σ={0,1}
F={Q0}

δ(Q0, 0) = Q1;
δ(Q0, 1) = Q0;
δ(Q1, 1) = Q1;
δ(Q1, 0) = Q0;


- Sobre el alfabeto Σ={a,b} construya un 
autómata finito determinista que acepte las 
cadenas w que contengan la subcadena abab

M=(Q,Σ,q0,F,δ)
Q={Q0,Q1,Q2,Q3,Q4}
Σ={a,b}
F={Q4}
    --------------
    | δ  |a   | b |
    -----------   |
    |Q0  |q1  |q0 |
    |Q1  |q1  |q2 |
    |Q2  |q3  |q0 |
    |Q3  |q1  |q4 |
    |Q4  |q4  |q4 |
    ---------------

    (a+b)* abab (a+b)*

(Fundamentos03)

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





}