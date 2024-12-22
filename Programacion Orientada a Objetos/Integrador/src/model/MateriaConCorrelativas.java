package model;

import java.util.List;

public class MateriaConCorrelativas extends Materia {
    // PATRON DE DISEÑO COMPOSITE
    private List<Materia> correlativas;

    // CONSTRUCTORES
    public MateriaConCorrelativas() {}
    public MateriaConCorrelativas(Materia materia) {
        setNombre(materia.getNombre());
        setCuatrimestre(materia.getCuatrimestre());
        setOptativa(materia.isOptativa());
        setPlanillas(materia.getPlanillas());
        setCodigo(materia.getCodigo());
    }
    // PATRON DE DISEÑO COMPOSITE
    public void agregarCorrelativa(Materia materia) {
        correlativas.add(materia);
    }
    public void eliminarCorrelativa(Materia materia) {
        correlativas.remove(materia);
    }
    public List<Materia> obtenerCorrelativas(){
        return correlativas;
    }
}
