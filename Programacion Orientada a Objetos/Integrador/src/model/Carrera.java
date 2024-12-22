package model;

import db.Persistencia;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class Carrera implements Persistencia {
    /*
     * Detalles del problema:
     * Inscripción de alumnos a una carrera:
     * Informar al alumno cuales son las materias que está en condiciones de cursar
     * Verificar si el alumno finalizo la carrera
     * Para graduarse un alumno debe aprobar todas las materias obligatorias de la carrera y
     * aprobar una cierta cantidad de materias optativas
     * La cantidad de materias optativas depende de la carrera
     * */

    // GENERADOR DE ID
    private static Integer id = 1000;
    // IDENTIFICADOR
    private Integer codigo;
    // ATRIBUTOS
    private String nombre, resolucion;
    private int totalCuatrimestres, optativasNecesarias;
    // REFERENCIAS
    private List<Alumno> alumnos;
    private List<Materia> materias;
    private PlanEstudio planEstudio;

    // CONSTRUCTORES
    public Carrera() {}
    public Carrera(String nombre, String resolucion, int totalCuatrimestres, int optativasNecesarias) {
        this.nombre = nombre;
        this.resolucion = resolucion;
        this.totalCuatrimestres = totalCuatrimestres;
        this.optativasNecesarias = optativasNecesarias;
        codigo = id++;
        alumnos = new ArrayList<>();
        materias = new ArrayList<>();
    }

    // OPERACIONES
    public void inscribirAlumno(String nombre, int dni, LocalDate fechaNacimiento){
        Alumno alumno = new Alumno(dni, nombre, fechaNacimiento);
        alumnos.add(alumno);
    }
    public List<Alumno> obtenerAlumnos(){
        return alumnos;
    }
    public void agregarMateria(String nombre, int totalCuatrimestres, boolean optativa){
        Materia materia = new Materia(nombre, totalCuatrimestres, optativa);
        materias.add(materia);
    }
    public List<Materia> obtenerMaterias() {
        return materias;
    }
    public List<Materia> obtenerMaterias(int cuatrimestreInicio, int cuatrimestreFin) {
        List<Materia> lista = new ArrayList<>();
        for (Materia materia: materias){
            if (materia.getCuatrimestre()>=cuatrimestreFin && materia.getCuatrimestre()<=cuatrimestreFin)
                lista.add(materia);
        }
        return lista;
    }
    public List<Materia> listadoMateriasCursar(Alumno alumno) {
        List<Materia> materiasPuedeCursar = new ArrayList<>();
        for (Materia materia: materias) {
            if (planEstudio.puedeCursar(alumno, materia)) {
                materiasPuedeCursar.add(materia);
            }
        }
        return materiasPuedeCursar;
    }
    public void finalizarCarrera(Alumno alumno){
        List<Registro> registros = alumno.obtenerRegistros();
        int optativasAprobadas = 0, cantidadObligatoriasAprobadas = 0;

        // Obtener las materias del alumnos y clasificarlas
        for (Registro registro: registros) {
            Materia materia = registro.getMateria();
            if (materia.isOptativa()) {
                if (registro.getEstado() instanceof Aprobado) {
                    optativasAprobadas++;
                }
            } else {
                if (registro.getEstado() instanceof Aprobado)
                    cantidadObligatoriasAprobadas++;
                else
                    return;
            }
        }

        if (optativasAprobadas<optativasNecesarias)
            return;

        int totalObligatorias = 0;
        for (Materia materia: materias) {
            if (!materia.isOptativa())
                totalObligatorias++;
        }
        if (cantidadObligatoriasAprobadas==totalObligatorias)
            alumno.setEstaGraduado(true);
    }

    // GETTERS Y SETTERS
    public static void incId() { id++; }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getResolucion() {
        return resolucion;
    }
    public void setResolucion(String resolucion) {
        this.resolucion = resolucion;
    }
    public int getTotalCuatrimestres() {
        return totalCuatrimestres;
    }
    public void setTotalCuatrimestres(int totalCuatrimestres) {
        this.totalCuatrimestres = totalCuatrimestres;
    }
    public int getOptativasNecesarias() {
        return optativasNecesarias;
    }
    public void setOptativasNecesarias(int optativasNecesarias) {
        this.optativasNecesarias = optativasNecesarias;
    }
    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }
    public int getCodigo() {
        return codigo;
    }
    public void setPlanEstudio(PlanEstudio plan) {
        planEstudio = plan;
    }
    public PlanEstudio getPlanEstudio(){
        return planEstudio;
    }
    public void setAlumnos(List<Alumno> alumnos) {
        this.alumnos = alumnos;
    }
    public void setMaterias(List<Materia> materias) {
        this.materias = materias;
    }

    @Override
    public String toString(){
        return getCodigo() + "?" +
                getNombre() + "?" +
                getTotalCuatrimestres() + "?" +
                getOptativasNecesarias() + "?" +
                getResolucion();
    }

    @Override
    public void toObject(String object) throws IllegalArgumentException {
        StringTokenizer st = new StringTokenizer(object, "?");
        if (st.hasMoreTokens()) {
            String codigoStr = st.nextToken();
            String nombre = st.nextToken();
            String cuatrimestresStr = st.nextToken();
            String optativasStr = st.nextToken();
            String resolucion = st.nextToken();
            // Validaciones con expresiones regulares
            if (!codigoStr.matches("\\d+")) {
                throw new IllegalArgumentException("El código debe ser un número.");
            }
            if (!nombre.matches("[A-Za-zÁáÉéÍíÓóÚúÑñ0-9 ]+")) {
                throw new IllegalArgumentException("El nombre de la carrera no es válido.");
            }
            if (!cuatrimestresStr.matches("\\d+")) {
                throw new IllegalArgumentException("El total de cuatrimestres debe ser un número.");
            }
            if (!optativasStr.matches("\\d+")) {
                throw new IllegalArgumentException("Las optativas necesarias deben ser un número.");
            }
            if (resolucion == null || resolucion.isEmpty()) {
                throw new IllegalArgumentException("La resolución no puede estar vacía.");
            }
            setCodigo(Integer.parseInt(codigoStr));
            setNombre(nombre);
            setTotalCuatrimestres(Integer.parseInt(cuatrimestresStr));
            setOptativasNecesarias(Integer.parseInt(optativasStr));
            setResolucion(resolucion);
            materias = new ArrayList<>();
            alumnos = new ArrayList<>();
        }
    }
}
