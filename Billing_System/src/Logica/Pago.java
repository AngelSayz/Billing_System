package Logica;

public class Pago {
    private String referencia;
    private String fecha;
    private String nivel_educativo;
    private String periodo;
    private String alumno;
    private double monto;
    private String estado;
    private int TPnumero;
    private String TPdescripcion;
    // private String TPpago; (pago en tipo de pago es 'referencia', se obtiene del getReferencia())
    private String TPinscripcion;
    private String TPpaquete_de_libros;
    private int TPpaquete_de_uniforme;
    private String TPexamen;
    private String TPmensualidad;
    private int TPevento;
    private String TPpaquete_de_material;
    


    public Pago(String referencia, String fecha, String nivel_educativo, String periodo, String alumno, double monto,
            String estado, int tPnumero, String tPdescripcion, String tPinscripcion, String tPpaquete_de_libros,
            int tPpaquete_de_uniforme, String tPexamen, String tPmensualidad, int tPevento,
            String tPpaquete_de_material) {
        this.referencia = referencia;
        this.fecha = fecha;
        this.nivel_educativo = nivel_educativo;
        this.periodo = periodo;
        this.alumno = alumno;
        this.monto = monto;
        this.estado = estado;
        TPnumero = tPnumero;
        TPdescripcion = tPdescripcion;
        TPinscripcion = tPinscripcion;
        TPpaquete_de_libros = tPpaquete_de_libros;
        TPpaquete_de_uniforme = tPpaquete_de_uniforme;
        TPexamen = tPexamen;
        TPmensualidad = tPmensualidad;
        TPevento = tPevento;
        TPpaquete_de_material = tPpaquete_de_material;
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



    public String getNivel_educativo() {
        return nivel_educativo;
    }



    public void setNivel_educativo(String nivel_educativo) {
        this.nivel_educativo = nivel_educativo;
    }



    public String getPeriodo() {
        return periodo;
    }



    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }



    public String getAlumno() {
        return alumno;
    }



    public void setAlumno(String alumno) {
        this.alumno = alumno;
    }



    public double getMonto() {
        return monto;
    }



    public void setMonto(double monto) {
        this.monto = monto;
    }



    public String getEstado() {
        return estado;
    }



    public void setEstado(String estado) {
        this.estado = estado;
    }



    public int getTPnumero() {
        return TPnumero;
    }



    public void setTPnumero(int tPnumero) {
        TPnumero = tPnumero;
    }



    public String getTPdescripcion() {
        return TPdescripcion;
    }



    public void setTPdescripcion(String tPdescripcion) {
        TPdescripcion = tPdescripcion;
    }



    public String getTPinscripcion() {
        return TPinscripcion;
    }



    public void setTPinscripcion(String tPinscripcion) {
        TPinscripcion = tPinscripcion;
    }



    public String getTPpaquete_de_libros() {
        return TPpaquete_de_libros;
    }



    public void setTPpaquete_de_libros(String tPpaquete_de_libros) {
        TPpaquete_de_libros = tPpaquete_de_libros;
    }



    public int getTPpaquete_de_uniforme() {
        return TPpaquete_de_uniforme;
    }



    public void setTPpaquete_de_uniforme(int tPpaquete_de_uniforme) {
        TPpaquete_de_uniforme = tPpaquete_de_uniforme;
    }



    public String getTPexamen() {
        return TPexamen;
    }



    public void setTPexamen(String tPexamen) {
        TPexamen = tPexamen;
    }



    public String getTPmensualidad() {
        return TPmensualidad;
    }



    public void setTPmensualidad(String tPmensualidad) {
        TPmensualidad = tPmensualidad;
    }



    public int getTPevento() {
        return TPevento;
    }



    public void setTPevento(int tPevento) {
        TPevento = tPevento;
    }



    public String getTPpaquete_de_material() {
        return TPpaquete_de_material;
    }



    public void setTPpaquete_de_material(String tPpaquete_de_material) {
        TPpaquete_de_material = tPpaquete_de_material;
    }
}