package model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public abstract class Estrategia {
    /*
    * Detalles del problema:
    * Para que un alumno pueda cursar una materia, se deberán cumplir ciertas condiciones,
    * que están establecidas según el Tipo del plan de estudios de cada carrera:
    * */
    
    // PATRON DE DISEÑO STRATEGY
    protected Carrera carrera;

    // CONSTRUCTOR
    public Estrategia(Carrera carrera) {
        this.carrera = carrera;
    }

    // OPERACIONES
    public boolean puedeCursar(Alumno alumno, Materia materia) {
        List<Materia> correlativas = ((MateriaConCorrelativas) materia).obtenerCorrelativas();
        Registro registro;
        // BUSCA LAS CORRELATIVAS EN LOS REGISTROS DEL ALUMNO
        for (Materia m: correlativas) {
            registro = null;
            for (Registro r: alumno.obtenerRegistros()) {
                if (r.getMateria()==m) {
                    registro = r;
                    break;
                }
            }
            // SI NO CURSO LA CORRELATIVA NO PUEDE CURSAR
            if (registro==null)
                return false;
            // SI LA CONDICION DE CURSADA (REGULAR O APROBADA) NO SE CUMPLE
            else if (!isCondicion(registro))
                return false;
        }
        // SI TODAS LAS CORRELATIVAS FUERON CURSADAS Y ESTAN EN CONDICION
        return true;
    }
    protected abstract boolean isCondicion(Registro registro);
}

class TipoA extends Estrategia {
    // Tipo A: aprobó las cursadas de las correlativas
    public TipoA(Carrera carrera) {
        super(carrera);
    }
    @Override
    protected boolean isCondicion(Registro registro){
        Estado estado = registro.getEstado();
        return (estado instanceof Regular) || (estado instanceof Aprobado);
    }
}

class TipoB extends Estrategia {
    // Tipo B: aprobó los finales de las correlativas
    public TipoB(Carrera carrera) {
        super(carrera);
    }
    @Override
    public boolean isCondicion(Registro registro){
        return (registro.getEstado() instanceof Aprobado);
    }
}

class TipoC extends Estrategia {
    /*
    * Tipo C: aprobó las cursadas de las correlativas y los finales de todas las materias de
    * 5 cuatrimestres previos al que se quiere anotar
    * */
    public TipoC(Carrera carrera) {
        super(carrera);
    }
    @Override
    public boolean puedeCursar(Alumno alumno, Materia materia){
        boolean aproboCorrelativas = super.puedeCursar(alumno, materia);
        // Si no aprobo las correlativas
        if (!aproboCorrelativas) {
            return false;
        }
        // Si aprobo las correlativas
        // Ver si aprobo las materias de la cursada de 5 cuatrimestres previos
        int cuatrimestre = materia.getCuatrimestre();
        List<Materia> materiasCarrera = carrera.obtenerMaterias(cuatrimestre-5, cuatrimestre-1);
        for (Materia mc: materiasCarrera) {
            Registro registro = alumno.obtenerRegistro(mc);
            if (registro==null) return false;
            Estado estadoMateria = registro.getEstado();
            if (!(estadoMateria instanceof Aprobado))
                return false;
        }
        return true;
    }
    @Override
    public boolean isCondicion(Registro registro){
        Estado estado = registro.getEstado();
        return (estado instanceof Regular) || (estado instanceof Aprobado);
    }
}

class TipoD extends Estrategia {
    /*
    * Tipo D: aprobó las cursadas de las correlativas y los finales de todas las materias de 3
    * cuatrimestres previos al que se quiere anotar
    * */
    public TipoD(Carrera carrera) {
        super(carrera);
    }
    @Override
    public boolean puedeCursar(Alumno alumno, Materia materia){
        boolean aproboCorrelativas = super.puedeCursar(alumno, materia);
        // Si no aprobo las correlativas
        if (!aproboCorrelativas) {
            return false;
        }
        // Si aprobo las correlativas
        // Ver si aprobo las materias de la cursada de 3 cuatrimestres previos
        int cuatrimestre = materia.getCuatrimestre();
        List<Materia> materiasCarrera = carrera.obtenerMaterias(cuatrimestre-3, cuatrimestre-1);
        for (Materia mc: materiasCarrera) {
            Registro registro = alumno.obtenerRegistro(mc);
            if (registro==null) return false;
            Estado estadoMateria = registro.getEstado();
            if (!(estadoMateria instanceof Aprobado))
                return false;
        }
        return true;
    }
    @Override
    public boolean isCondicion(Registro registro){
        Estado estado = registro.getEstado();
        return (estado instanceof Regular) || (estado instanceof Aprobado);
    }
}

class TipoE extends Estrategia {
    /*
    * Tipo E: aprobó los finales de las correlativas y los finales de todas las materias de 3
    * cuatrimestres previos
    * */
    public TipoE(Carrera carrera) {
        super(carrera);
    }
    @Override
    public boolean puedeCursar(Alumno alumno, Materia materia){
        boolean aproboCorrelativas = super.puedeCursar(alumno, materia);
        // Si no aprobo las correlativas
        if (!aproboCorrelativas) {
            return false;
        }
        // Si aprobo las correlativas
        // Ver si aprobo las materias de la cursada de 3 cuatrimestres previos
        int cuatrimestre = materia.getCuatrimestre();
        List<Materia> materiasCarrera = carrera.obtenerMaterias(cuatrimestre-3, cuatrimestre-1);
        for (Materia mc: materiasCarrera) {
            Registro registro = alumno.obtenerRegistro(mc);
            if (registro==null) return false;
            Estado estadoMateria = registro.getEstado();
            if (!(estadoMateria instanceof Aprobado))
                return false;
        }
        return true;
    }
    @Override
    public boolean isCondicion(Registro registro){
        Estado estado = registro.getEstado();
        return (estado instanceof Aprobado);
    }
}