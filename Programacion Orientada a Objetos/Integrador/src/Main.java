import model.Carrera;
import model.Facultad;
import model.Materia;
import persistance.PersistirCarrera;
import persistance.PersistirFacultad;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        Facultad facultad = Facultad.getInstance();
        var archivo = new PersistirFacultad();
        var archivo2 = new PersistirCarrera();
        archivo.recuperar();
        System.out.println(facultad);
        for (var c: facultad.getCarreras()) {
            System.out.println(c);
            archivo2.recuperar(c);
            c.obtenerMaterias().forEach(System.out::println);
            System.out.println("SEPARADOR");
            c.obtenerAlumnos().forEach(System.out::println);
        }
    }
}