package model;

import db.Persistencia;

import java.time.LocalDate;
import java.util.*;

public class Planilla implements Persistencia {
    /*
    * Detalles del problema:
    * Inscripción de alumnos a las materias de acuerdo al plan de estudios de la carrera - Solucionado Aquí
    * Inscribir un alumno en una materia si la puede cursar - Solucionado Aquí
    * */

    // IDENTIFICADOR
    private static Integer id = 1000;

    // ATRIBUTOS
    private Integer numero;
    private LocalDate fechaInicio, fechaFin;
    private int anio;

    // REFERENCIAS
    private Materia materia;
    private List<Registro> registros;

    // CONSTRUCTORES
    public Planilla(){}
    public Planilla(LocalDate fechaInicio, LocalDate fechaFin, int anio, Materia materia) {
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.anio = anio;
        this.materia = materia;
        registros = new ArrayList<>();
        numero = id;
    }

    // OPERACIONES
    public List<Registro> obtenerRegistros() {
        return registros;
    }
    public void inscribirAlumno(Alumno alumno) {
        Registro registro = new Registro(fechaInicio, fechaFin, materia, alumno);
        registros.add(registro);
    }

    // GETTERS Y SETTERS
    public void incID(){ id++; }
    public int getNumero(){ return numero; }
    public void setNumero(Integer numero){ this.numero = numero; }
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
    public int getAnio() {
        return anio;
    }
    public void setAnio(int anio) {
        this.anio = anio;
    }
    public Materia getMateria() {
        return materia;
    }
    public void setMateria(Materia materia) {
        this.materia = materia;
    }
    public List<Registro> getRegistros() {
        return registros;
    }
    public void setRegistros(List<Registro> registros) {
        this.registros = registros;
    }

    // Persistance
    @Override
    public String toString(){
        return numero + "?" +
                fechaInicio.toString() + "?" +
                fechaFin.toString() + "?" +
                anio;
    }

    @Override
    public void toObject(String object){
        StringTokenizer st = new StringTokenizer(object, "?");
        if (st.hasMoreTokens()){
            setNumero(Integer.parseInt(st.nextToken()));
            setFechaInicio(LocalDate.parse(st.nextToken()));
            setFechaFin(LocalDate.parse(st.nextToken()));
            setAnio(Integer.parseInt(st.nextToken()));
        }
    }
}
