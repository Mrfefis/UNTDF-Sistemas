package persistance;

import model.Carrera;
import model.Facultad;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class PersistirFacultad {
    private final String path = "src//db//facultad.txt";

    public void guardar(Facultad facultad){
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(path))){
            bw.write(facultad.toString());
            bw.newLine();
            for (Carrera carrera: facultad.getCarreras()) {
                bw.write(carrera.toString());
                bw.newLine();
            }
        } catch (FileNotFoundException e) {
            System.out.println("No se encontro el archivo");
        } catch (IOException e) {
            System.out.println("Error de I/O");
        }
    }

    public Facultad recuperar() {
        Facultad facultad = Facultad.getInstance();
        List<Carrera> carreras = new ArrayList<>();
        facultad.setCarreras(carreras);
        try (BufferedReader br = new BufferedReader(new FileReader(path))){
            String datosFacultad = br.readLine();
            if (datosFacultad!=null)
                facultad.toObject(datosFacultad);

            String datosCarrera;
            while ((datosCarrera = br.readLine()) != null) {
                Carrera c = new Carrera();
                c.toObject(datosCarrera);
                carreras.add(c);
                Carrera.incId();
            }
        } catch (FileNotFoundException e) {
            System.out.println("No se encontro el archivo");
        } catch (IOException e) {
            System.out.println("Error de I/0");
        } catch (IllegalArgumentException e) {
            System.out.println("Error en el formato de los datos de la facultad: " + e.getMessage());
        }
        return facultad;
    }
}
