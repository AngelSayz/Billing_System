package Logica;

public class Evento{
    private int codigo;
    private String nombre;
    private String fecha;
    private double costo;

public Evento(int codigo, String nombre, String fecha, double costo){
    this.codigo=codigo;
    this.nombre=nombre;
    this.fecha=fecha;
    this.costo=costo;
}
public Evento(String nombre, String fecha, double costo){
    this.nombre=nombre;
    this.fecha=fecha;
    this.costo=costo;
}

public int getCodigo() {
    return codigo;
}

public void setCodigo(int codigo) {
    this.codigo = codigo;
}

public String getNombre() {
    return nombre;
}

public void setNombre(String nombre) {
    this.nombre = nombre;
}

public String getFecha() {
    return fecha;
}

public void setFecha(String fecha) {
    this.fecha = fecha;
}

public double getCosto() {
    return costo;
}

public void setCosto(double costo) {
    this.costo = costo;
}

}