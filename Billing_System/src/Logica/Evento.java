package Logica;

public class Evento{
    private int codigo;
    private String nombre;
    private String fecha;

public Evento(int codigo, String nombre, String fecha){
    this.codigo=codigo;
    this.nombre=nombre;
    this.fecha=fecha;

}

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo=codigo;
    }


    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre=nombre;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
}