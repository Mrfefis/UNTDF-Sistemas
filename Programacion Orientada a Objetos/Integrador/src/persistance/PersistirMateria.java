package persistance;

import model.Carrera;
import model.Materia;
import model.Planilla;
import model.Registro;

import java.io.*;

public class PersistirMateria {
    public final String path = "src//db//carrera", SEPARADOR = "SEPARADOR";

    public void guardar(Carrera carrera){
        File file = new File(path + carrera.getCodigo());
        if (file.exists())
            for (Materia materia: carrera.obtenerMaterias())
                guardarMateria(path + carrera.getCodigo() + "//materia", materia);
        else
            System.out.println("Datos de carrera no existen");
    }

    private void guardarMateria(String ruta, Materia materia) {
        String rutaMateria = ruta + materia.getCodigo();
        File file = new File(rutaMateria);
        if (!file.exists() && !file.mkdir()) {
            return;
        }
        rutaMateria += "//planilla";
        for (Planilla planilla: materia.getPlanillas()) {
            try (BufferedWriter bw = new BufferedWriter(new FileWriter(rutaMateria  + planilla.getNumero() + ".txt"))){
                guardarPlanilla(bw, planilla);
            } catch (IOException ignored) {}
        }
    }

    private void guardarPlanilla(BufferedWriter bw, Planilla planilla) throws IOException {
        bw.write(planilla.toString());
        bw.newLine();
        bw.write(SEPARADOR);
        bw.newLine();
        for (Registro registro: planilla.getRegistros()) {
            bw.write(registro.toString());
            bw.newLine();
        }
    }
}
