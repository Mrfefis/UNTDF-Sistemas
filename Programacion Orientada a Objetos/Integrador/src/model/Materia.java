package model;

import db.Persistencia;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class Materia implements Persistencia {
    /*
     * Detalles del problema:
     * Cada carrera incluye materias obligatorias y materias optativas
     * */

    // GENERADOR DE ID
    private static Integer id = 1000;
    // IDENTIFICADOR
    private Integer codigo;
    // ATRIBUTOS
    private String nombre;
    private int cuatrimestre;
    private boolean optativa;
    // REFERENCIAS
    private List<Planilla> planillas;

    // CONSTRUCTORES
    public Materia() {
        codigo = id++;
    }
    public Materia(String nombre, int cuatrimestre, boolean optativa) {
        this.nombre = nombre;
        this.cuatrimestre = cuatrimestre;
        this.optativa = optativa;
        codigo = id++;
        planillas = new ArrayList<>();
    }

    // OPERACIONES
    public void generarPlanilla(int anio, LocalDate fechaInicio, LocalDate fechaFin){
        Planilla planilla = new Planilla(fechaInicio, fechaFin, anio, this);
        planillas.add(planilla);
    }
    public List<Planilla> obtenerPlanillas(int anio){
        List<Planilla> planillas = new ArrayList<>();
        for (Planilla planilla: this.planillas){
            if (planilla.getAnio()==anio)
                planillas.add(planilla);
        }
        return planillas;
    }
    public List<Planilla> obtenerPlanillas(LocalDate fechaInicio, LocalDate fechaFin){
        List<Planilla> planillas = new ArrayList<>();
        for (Planilla planilla: this.planillas){
            if (planilla.getFechaInicio().compareTo(fechaInicio)>=0 && planilla.getFechaFin().compareTo(fechaFin)<=0)
                planillas.add(planilla);
        }
        return planillas;
    }

    // GETTERS Y SETTERS
    public static void incID() { id++; }
    public Integer getCodigo() {
        return codigo;
    }
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public int getCuatrimestre() {
        return cuatrimestre;
    }
    public void setCuatrimestre(int cuatrimestre) {
        this.cuatrimestre = cuatrimestre;
    }
    public boolean isOptativa() {
        return optativa;
    }
    public void setOptativa(boolean optativa) {
        this.optativa = optativa;
    }
    public List<Planilla> getPlanillas() {
        return planillas;
    }
    public void setPlanillas(List<Planilla> planillas) {
        this.planillas = planillas;
    }

    // Persistencia
    @Override
    public void toObject(String object){
        StringTokenizer st = new StringTokenizer(object, "?");
        if (st.hasMoreTokens()){
            setCodigo(Integer.parseInt(st.nextToken()));
            setNombre(st.nextToken());
            setCuatrimestre(Integer.parseInt(st.nextToken()));
            setOptativa(Boolean.parseBoolean(st.nextToken()));
            planillas = new ArrayList<>();
        }
    }
    @Override
    public String toString(){
        return  getCodigo() + "?" +
                getNombre() + "?" +
                getCuatrimestre() + "?" +
                isOptativa();
    }
}
