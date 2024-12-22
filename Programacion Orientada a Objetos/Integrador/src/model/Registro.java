package model;

import db.Persistencia;

import java.time.LocalDate;
import java.util.StringTokenizer;

public class Registro implements Persistencia {
    // ATRIBUTOS
    private int notaParcial, notaFinal;
    private LocalDate fechaInicio, fechaFin;
    // REFERENCIAS
    private Materia materia;
    private Alumno alumno;
    // PATRON DE DISEÑO STATE
    private Estado estado;

    // CONSTRUCTORES
    public Registro(){}
    public Registro(LocalDate fechaInicio, LocalDate fechaFin, Materia materia, Alumno alumno) {
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.materia = materia;
        this.alumno = alumno;
        estado = new EnCurso(this);
    }

    // OPERACIONES
    public String obtenerEstado(){
        return estado.toString();
    }

    public Estado convertirEstado(String estado){
        return switch (estado) {
            case "Libre" -> new Libre(this);
            case "EnCurso" -> new EnCurso(this);
            case "Regular" -> new Regular(this);
            case "Aprobado" -> new Aprobado(this);
            case null, default -> null;
        };
    }

    // PATRON DE DISEÑO STATE
    public void setEstado(Estado estado){
        this.estado = estado;
    }
    public Estado getEstado() {
        return estado;
    }
    public void inscribir(){
        estado.inscribir();
    }
    public void evaluar(PlanEstudio plan){
        estado.evaluar(plan);
    }

    // GETTERS Y SETTERS
    public int getNotaParcial() {
        return notaParcial;
    }
    public void setNotaParcial(int notaParcial) {
        this.notaParcial = notaParcial;
    }
    public int getNotaFinal() {
        return notaFinal;
    }
    public void setNotaFinal(int notaFinal) {
        this.notaFinal = notaFinal;
    }
    public LocalDate getFechaInicio() {
        return fechaInicio;
    }
    public void setFechaInicio(LocalDate fechaInicio) {
        this.fechaInicio = fechaInicio;
    }
    public LocalDate getFechaFin() {
        return fechaFin;
    }
    public void setFechaFin(LocalDate fechaFin) {
        this.fechaFin = fechaFin;
    }
    public Materia getMateria() {
        return materia;
    }
    public void setMateria(Materia materia) {
        this.materia = materia;
    }
    public Alumno getAlumno() {
        return alumno;
    }
    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }

    // PERSISTANCE
    @Override
    public String toString(){
        return notaParcial + "?" +
                notaFinal + "?" +
                fechaInicio.toString() + "?" +
                fechaFin.toString() + "?" +
                estado.toString() + "?" +
                alumno.getLegajo();
    }

    @Override
    public void toObject(String object){
        StringTokenizer st = new StringTokenizer(object, "?");
        if (st.hasMoreTokens()) {
            setNotaParcial(Integer.parseInt(st.nextToken()));
            setNotaFinal(Integer.parseInt(st.nextToken()));
            setFechaInicio(LocalDate.parse(st.nextToken()));
            setFechaFin(LocalDate.parse(st.nextToken()));
            setEstado(convertirEstado(st.nextToken()));
        }
    }


}
