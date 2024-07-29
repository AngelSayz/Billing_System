package Logica;
public class Examen{
    private String codigo;
    private double precio;
    private String tipo_examen;

    public Examen(String codigo,double precio, String tipo_examen){
        this.codigo=codigo;
        this.precio=precio;
        this.tipo_examen=tipo_examen;

    }

    /**
     * @return String return the codigo
     */
    public String getCodigo() {
        return codigo;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    /**
     * @return float return the precio
     */
    public double getPrecio() {
        return precio;
    }

    /**
     * @param precio the precio to set
     */
    public void setPrecio(float precio) {
        this.precio = precio;
    }

    /**
     * @return String return the tipo_examen
     */
    public String getTipo_examen() {
        return tipo_examen;
    }

    /**
     * @param tipo_examen the tipo_examen to set
     */
    public void setTipo_examen(String tipo_examen) {
        this.tipo_examen = tipo_examen;
    }
}