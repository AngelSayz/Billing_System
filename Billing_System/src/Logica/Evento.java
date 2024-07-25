package Logica;
//Gael DO NOT STEAL!!!!!
public class Evento{
    private int codigo;
    private String nombre;
    private String fecha;
    private String fecha_Registro;

public Evento(int codigo, String nombre, String fecha,String fecha_Registro){
    this.codigo=codigo;
    this.nombre=nombre;
    this.fecha=fecha;
    this.fecha_Registro=fecha_Registro;
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

    public String getFecha_Registro() {
        return fecha_Registro;
    }

    public void setFecha_Registro(String fecha_Registro) {
        this.fecha_Registro=fecha_Registro;
    }
}