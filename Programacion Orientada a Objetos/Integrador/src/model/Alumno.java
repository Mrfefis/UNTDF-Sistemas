package model;

import db.Persistencia;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class Alumno implements Persistencia {
    /*
    * Detalles del problema:
    * Inscripción de alumnos a las materias de acuerdo al plan de estudios de la carrera.
    * Inscribir un alumno en una materia si la puede cursar.
    * */
    // GENERADOR DE ID
    private static Integer id = 1000;
    // IDENTIFICADOR
    private Integer legajo;
    // ATRIBUTOS
    private String nombre;
    private int dni;
    private LocalDate fechaNacimiento;
    private boolean estaGraduado;
    // REFERENCIAS
    private List<Registro> detalles;

    // CONSTRUCTORES
    public Alumno(){}
    public Alumno(int dni, String nombre, LocalDate fechaNacimiento){
        this.dni = dni;
        this.nombre = nombre;
        this.fechaNacimiento = fechaNacimiento;
        legajo = id++;
        estaGraduado = false;
        detalles = new ArrayList<>();
    }

    // OPERACIONES
    public void agregarRegistro(Registro registro){
        detalles.add(registro);
    }
    public List<Registro> obtenerRegistros(){
        return detalles;
    }
    public Registro obtenerRegistro(Materia materia){
        for (Registro r: detalles) {
            if (r.getMateria()==materia)
                return r;
        }
        return null;
    }

    // GETTERS Y SETTERS
    public static void incID(){ id++; }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public int getDni() {
        return dni;
    }
    public void setDni(int dni) {
        this.dni = dni;
    }
    public LocalDate getFechaNacimiento() {
        return fechaNacimiento;
    }
    public void setFechaNacimiento(LocalDate fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }
    public Integer getLegajo(){
        return legajo;
    }
    public void setLegajo(Integer legajo) { this.legajo = legajo; }
    public boolean isGraduado() {
        return estaGraduado;
    }
    public void setEstaGraduado(boolean graduado){
        estaGraduado = graduado;
    }

    @Override
    public String toString(){
        return  legajo + "?" +
                nombre + "?" +
                dni + "?" +
                fechaNacimiento.toString() + "?" +
                estaGraduado;
    }

    @Override
    public void toObject(String object){
        StringTokenizer st = new StringTokenizer(object, "?");
        if (st.hasMoreTokens()){
            setLegajo(Integer.parseInt(st.nextToken()));
            setNombre(st.nextToken());
            setDni(Integer.parseInt(st.nextToken()));
            setFechaNacimiento(LocalDate.parse(st.nextToken()));
            setEstaGraduado(Boolean.parseBoolean(st.nextToken()));
            detalles = new ArrayList<>();
        }
    }
}
