import java.util.concurrent.Semaphore;

class AccesoVentanillas implements Runnable{

    private final Semaphore semaforo;
    private final int id;

    public AccesoVentanillas(Semaphore semaforo, int id){
        this.semaforo = semaforo;
        this.id=id;
    }

    @Override 
    public void run(){
        try{
            System.out.println("hilo " + id + " esta esperando en la fila");
            semaforo.acquire();
            System.out.println("hilo " + id + " esta en la Ventanilla");
            Thread.sleep(2000);
            System.out.println("hilo " + id + " esta saliendo de la Ventanilla");
            semaforo.release();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

    }
}

public class Semaforos{
    public static void main(String[] args){
        Semaphore semaforo = new Semaphore(2);

        for (int i = 1; i <= 5; i++){
            Thread t = new Thread( new AccesoVentanillas(semaforo, i));
            t.start();
        }

    }
}