package Logica;

public class Pago{
    private String referencia;
    private String fecha;
    private String periodo;
    private String nivel_educativo;
    private String alumno;
    private double monto;

    public Pago(String referencia, String fecha,String periodo, String nivel_educativo, String alumno, double monto){
        this.referencia=referencia;
        this.fecha=fecha;
        this.periodo=periodo;
        this.nivel_educativo=nivel_educativo;
        this.alumno=alumno;
        this.monto=monto;
    }

    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

    public String getNivel_educativo() {
        return nivel_educativo;
    }

    public void setNivel_educativo(String nivel_educativo) {
        this.nivel_educativo = nivel_educativo;
    }

    public String getAlumno(){
        return alumno;
    }

    public void setAlumno(String alumno){
        this.alumno=alumno;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(int monto) {
        this.monto = monto;
    }

}