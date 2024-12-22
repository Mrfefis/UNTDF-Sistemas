package persistance;

import model.Alumno;
import model.Carrera;
import model.Facultad;
import model.Materia;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class PersistirCarrera {
    private final String path = "src//db//carrera";
    private final String SEPARADOR = "SEPARADOR";

    public void guardar(Carrera carrera){
        File lugar = new File(path + carrera.getCodigo());
        if (!lugar.exists() && !lugar.mkdir())
            return;
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(path + carrera.getCodigo() + "//carrera.txt"))){
            for (Materia materia: carrera.obtenerMaterias()) {
                bw.write(materia.toString());
                bw.newLine();
            }
            bw.write(SEPARADOR);
            bw.newLine();
            for (Alumno alumno: carrera.obtenerAlumnos()) {
                bw.write(alumno.toString());
                bw.newLine();
            }
        } catch (FileNotFoundException ignored) {
        } catch (IOException e) {
            System.out.println("Error de I/O");
        }
    }

    public void recuperar(Carrera carrera){
        File lugar = new File(path + carrera.getCodigo());
        if (!lugar.exists())
            return;
        try (BufferedReader br = new BufferedReader(new FileReader(path + carrera.getCodigo() + "//carrera.txt"))){
            List<Materia> materiaList = new ArrayList<>();
            List<Alumno> alumnoList = new ArrayList<>();
            String lectura;
            Materia materia;
            while ((lectura = br.readLine())!=null && !lectura.equals(SEPARADOR)) {
                materia = new Materia();
                materia.toObject(lectura);
                materiaList.add(materia);
                Materia.incID();
            }
            Alumno alumno;
            while ((lectura = br.readLine())!=null) {
                alumno = new Alumno();
                alumno.toObject(lectura);
                alumnoList.add(alumno);
                Alumno.incID();
            }
            carrera.setAlumnos(alumnoList);
            carrera.setMaterias(materiaList);
        } catch (IOException ignored) {}
    }
}
