package model;

public abstract class Estado {
    // PATRON DE DISEÑO STATE
    protected Registro registro;

    public Estado(Registro registro){
        this.registro = registro;
    }

    public abstract void inscribir();
    public abstract void evaluar(PlanEstudio plan);
}

class Libre extends Estado {

    public Libre(Registro registro) {
        super(registro);
    }

    public void inscribir(){
        registro.setEstado(new EnCurso(registro));
    }
    public void evaluar(PlanEstudio plan){}
    @Override
    public String toString(){
        return "Libre";
    }
}

class Aprobado extends Estado {

    public Aprobado(Registro registro) {
        super(registro);
    }

    public void inscribir(){}
    public void evaluar(PlanEstudio plan){}
    @Override
    public String toString(){
        return "Aprobado";
    }
}

class EnCurso extends Estado {

    public EnCurso(Registro registro) {
        super(registro);
    }

    public void inscribir(){}
    public void evaluar(PlanEstudio plan){
        int notaFinal = registro.getNotaFinal();
        int notaParcial = registro.getNotaParcial();
        if (notaFinal >= plan.getNotaPromocion()) {
            registro.setEstado(new Aprobado(registro));
        } else if (notaParcial >= plan.getNotaAprobar()) {
            registro.setEstado(new Regular(registro));
        } else {
            registro.setEstado(new Libre(registro));
        }
    }
    @Override
    public String toString(){
        return "EnCurso";
    }
}

class Regular extends Estado {
    private int ultimaNota, intentos;

    public Regular(Registro registro) {
        super(registro);
        ultimaNota = 0;
        intentos = 1;
    }

    public void inscribir(){}
    public void evaluar(PlanEstudio plan){
        int nota = registro.getNotaFinal();
        if (nota >= plan.getNotaAprobar()) {
            registro.setEstado(new Aprobado(registro));
            registro.setNotaFinal((ultimaNota+nota) / intentos);
        } else {
            ultimaNota+=nota;
            intentos++;
        }
    }
    @Override
    public String toString(){
        return "Regular";
    }
}