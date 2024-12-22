package model;

import db.Persistencia;

import java.util.List;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class Facultad implements Persistencia {
    /*
    * Detalles del problema:
    * Una facultad requiere de un soporte informático para el manejo de los planes de estudio
    * y de los alumnos de sus carreras
    * El sistema debe proveer los siguientes servicios:
    * Agregar carreras - Solucionado Aquí
    * Definir el Plan de Estudios para cada carrera - Solucionado Aquí
    * Inscripción de alumnos a una carrera - Solucionado Afuera
    * */

    // PATRON DE DISEÑO SINGLETON
    private static Facultad instance;
    // ATRIBUTOS
    private String nombre, direccion;
    // REFERENCIAS
    private List<Carrera> carreras;
    // CONSTRUCTORES
    private Facultad(){}
    private Facultad(String nombre, String direccion){
        this.nombre = nombre;
        this.direccion = direccion;
        carreras = new ArrayList<>();
    }

    // OPERACIONES
    public void agregarCarrera(String nombre, String resolucion, int cuatrimestres, int optativas){
        Carrera carrera = new Carrera(nombre, resolucion, cuatrimestres, optativas);
        carreras.add(carrera);
    }
    public void definirPlan(Carrera carrera, int notaAprobar, int notaPromocion, Estrategia estrategia){
        carrera.setPlanEstudio(new PlanEstudio(notaAprobar, notaPromocion, carrera, estrategia));
    }
    public List<Carrera> listadoCarreras(){
        return carreras;
    }
    public Carrera buscarCarreraCodigo(Integer codigo){
        for (Carrera carrera: carreras) {
            if (carrera.getCodigo()==codigo)
                return carrera;
        }
        return null;
    }
    // PATRON DE DISEÑO SINGLETON
    public static Facultad getInstance(){
        if (instance==null)
            instance = new Facultad();
        return instance;
    }
    public static Facultad getInstance(String nombre, String direccion){
        if (instance==null)
            instance = new Facultad(nombre, direccion);
        return instance;
    }

    // GETTERS Y SETTERS
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getDireccion() {
        return direccion;
    }
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public void setCarreras(List<Carrera> carreras) {
        this.carreras = carreras;
    }
    public List<Carrera> getCarreras() {
        return carreras;
    }

    // TOSTRING
    @Override
    public String toString() {
        return getNombre() + "?" +
                getDireccion();
    }
    @Override
    public void toObject(String object) throws IllegalArgumentException {
        StringTokenizer st = new StringTokenizer(object, "?");
        if (st.hasMoreTokens()) {
            String nombre = st.nextToken();
            String direccion = st.nextToken();
            // Validación con expresión regular
            if (!nombre.matches("[A-Za-z ]+")) {
                throw new IllegalArgumentException("Nombre de la facultad no es válido.");
            }
            if (!direccion.matches("[A-Za-z0-9, ]+")) {
                throw new IllegalArgumentException("Dirección de la facultad no es válida.");
            }
            setNombre(nombre);
            setDireccion(direccion);
        }
    }
}
