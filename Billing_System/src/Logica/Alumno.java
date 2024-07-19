package Logica;


public class Alumno {
    private String matricula;
    private String nombreDePila;
    private String primerApellido;
    private String segApellido;
    private int edad;
    private String fechaNac;

    public Alumno(String matricula, String nombreDePila, String primerApellido, String segApellido, int edad,
            String fechaNac) {
        this.matricula = matricula;
        this.nombreDePila = nombreDePila;
        this.primerApellido = primerApellido;
        this.segApellido = segApellido;
        this.edad = edad;
        this.fechaNac = fechaNac;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getNombreDePila() {
        return nombreDePila;
    }

    public void setNombreDePila(String nombreDePila) {
        this.nombreDePila = nombreDePila;
    }

    public String getPrimerApellido() {
        return primerApellido;
    }

    public void setPrimerApellido(String primerApellido) {
        this.primerApellido = primerApellido;
    }

    public String getSegApellido() {
        return segApellido;
    }

    public void setSegApellido(String segApellido) {
        this.segApellido = segApellido;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(String fechaNac) {
        this.fechaNac = fechaNac;
    }
}