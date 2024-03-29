Estados distinguibles

- Si todos los pares de estados son distinguibles, 
M no tiene estados redundantes y M es el 
autómata mínimo

- Si M contiene uno o mas conjuntos de estados 
no distinguibles se puede eliminar la redundancia 
reemplazando cada conjunto por un único estado.

es para crear uno minimo
Obtenemos el AFD mínimo M=(Q/E,Σ,C1,C2,δ')


========================================================

● Autómata Cociente:
Sea A = (Q,Σ, q0,δ , F) un AFD. A partir de este se 
construye otro autómata llamado autómata cociente, 
M' = (Q/E,Σ, [q0],δ', F'), donde
- Q/E es la partición de estados equivalentes de Q.
- [q0] es la clase de equivalencia a la que pertenece 
q0.
- δ' : Q/ExΣ->Q/E tal que δ'([q]; e) = [δ(q,e)]
- F' = {[q] |q E F}