package Logica;
public class Examen{
    private String codigo;
    private float precio;
    private String tipo_examen;
    private String fecha_registro;

    public Examen(String codigo,float precio, String tipo_examen, String fecha_registro){
        this.codigo=codigo;
        this.precio=precio;
        this.tipo_examen=tipo_examen;
        this.fecha_registro=fecha_registro;
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
    public float getPrecio() {
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

    /**
     * @return String return the fecha_registro
     */
    public String getFecha_registro() {
        return fecha_registro;
    }

    /**
     * @param fecha_registro the fecha_registro to set
     */
    public void setFecha_registro(String fecha_registro) {
        this.fecha_registro = fecha_registro;
    }

}