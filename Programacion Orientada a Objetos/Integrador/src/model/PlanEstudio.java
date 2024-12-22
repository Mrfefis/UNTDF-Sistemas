package model;

import java.util.ArrayList;
import java.util.List;

public class PlanEstudio {
    // ATRIBUTOS
    private int notaAprobar, notaPromocion;
    // REFERENCIAS
    private Carrera carrera;
    // PATRON DE DISEÑO STRATEGY
    private Estrategia estrategia;

    // CONSTRUCTORES
    public PlanEstudio(){}
    public PlanEstudio(int notaAprobar, int notaPromocion, Carrera carrera, Estrategia estrategia) {
        this.notaAprobar = notaAprobar;
        this.notaPromocion = notaPromocion;
        this.carrera = carrera;
        this.estrategia = estrategia;
    }
    // OPERACIONES

    // PATRON DE DISEÑO STRATEGY
    public Estrategia getEstrategia() {
        return estrategia;
    }
    public void setEstrategia(Estrategia estrategia) {
        this.estrategia = estrategia;
    }
    public boolean puedeCursar(Alumno alumno, Materia materia){
        List<Registro> registros = alumno.obtenerRegistros();
        // SI LA MATERIA YA FUE CURSADA PUEDE INSCRIBIRSE SI ESTA LIBRE
        for (Registro r: registros) {
            if (r.getMateria()==materia) {
                return r.getEstado() instanceof Libre;
            }
        }
        // SI LA MATERIA NO FUE CURSADA
        // Y TIENE CORRELATIVAS
        if (materia instanceof MateriaConCorrelativas)
            return estrategia.puedeCursar(alumno, materia);
        // Y NO TIENE CORRELATIVAS LA PUEDE CURSAR
        return true;
    }

    // GETTERS Y SETTERS
    public int getNotaAprobar() {
        return notaAprobar;
    }
    public void setNotaAprobar(int notaAprobar) {
        this.notaAprobar = notaAprobar;
    }
    public int getNotaPromocion() {
        return notaPromocion;
    }
    public void setNotaPromocion(int notaPromocion) {
        this.notaPromocion = notaPromocion;
    }
    public Carrera getCarrera() {
        return carrera;
    }
    public void setCarrera(Carrera carrera) {
        this.carrera = carrera;
    }
}
