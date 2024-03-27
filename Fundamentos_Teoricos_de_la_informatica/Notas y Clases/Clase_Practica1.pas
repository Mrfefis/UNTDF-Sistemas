TRABAJO PRÁCTICO Nº 2: 
Lenguajes Regulares, expresiones
regulares y autómatas finitos


a) a* + b + a 

    a,b aaaaaa.....a, λ

b) a*b+b+a

    b,a,aaaaaaaa, b

c) aa*(a+b)

    aa*a + aa*b
    aa, ab, aaaaaaa, a+aaaa+b

d) abab*+aba*

    aba, bbbbbb,  λ
    aba,ab, ababbbbb, abaaaaaaa

e) (ab+abc)*

    λ, ab, abc, abcab, ababc,abcabc,ababab,

f) ab*aa+bba*ab

    aaa, bbab, abbbbaa, bbaaaaaab

g) (aa)*b(aa)*+a(aa)*ba(aa)*

    λ b λ, a ba λ
    b, aa.b, aabaa, baa, aaaabaa, aba + aaaba, aaabaaaa

2) Sea T lenguaje definido sobre el alfabeto Σ = { a, b, c} / T = { a, c, ab, cb,
abb, cbb, abbb, cbbb, abbbb, cbbbb, ....}
Encuentre la expresión regular que lo define.

esta es la expresion verbal

crear la expresion regular

    ab* + cb* = (a+c)b*

3) Sea T el lenguaje definido sobre el alfabeto  = { a, b, c}, encuentre 
definiciones para un lenguaje:
    a) con al menos dos a, siendo  Σ = {a, b}
    b) con al menos una a y al menos una b;
    c) con exactamente dos a;


3)a) Σ = {a, b}
    
    |/ (a+b)* /,a, / (a+b)* /, a, / (a+b)* /|

3)b) 

    |/ (a+b+c)* /,a, / (a+b+c)* /, b, / (a+b+c)* /| + |/ (a+b+c)* /,b, / (a+b+c)* /, a, / (a+b+c)* /|

3)c) 

    |/ (b+c)* /,a, / (b+c)* /, a, / (b+c)* /| 


4) Hallar una expresión regular para los siguientes lenguajes (en el alfabeto
{a}, {a, b}, {a, b, c} o {0, 1}, según lo que proceda):

4)a) {a^n | n ≥ 0, n ≠ 4}  


    λ + a + aa + aaa + aaaaaa*

4)b) {a^n b^m | n+m es par }

    a+b pares, o a+b impares

    (aa)*(bb)* + a(aa)*b(bb)*

4)c) {w {a,b}* | #aw y #bw son los dos pares}

    no hacer

4)d) los números binarios que tienen exactamente un par de ceros consecutivos.

    |/ (01+1)* /,00, / (10+1)* /| 





5) Construir autómatas finitos para los siguientes lenguajes:
a) Constantes reales con signo  

{ 
    Q0, va a ser siempre mi estado inicial

    q es un conjunto, es el conjunto de estados del automata.
    la cantidad de estados que tiene el automata.
    
    F= Conjunto de estados finalizadores, normalmente en un automata determinista suele ser 1.
    en uno indereminado, puede ten varios

    Σ= El alfabeto del automata.

    Δ o δ =     δ:(QxΣ)-> qn

                Δ:(QxΣ)-> 



M=(Q,Σ,q0,F,Δ) indereminista

M=(Q,Σ,q0,F,δ) determinista

- Q = {Q0,Q1,Q2,Q3}
- Σ = {a,b}
- F = {q3}
}