package Logica;


public class Alumno {
    private String matricula;
    private String nombrePila;
    private String primerApellido;
    private String segApellido;
    private int edad;
    private String fechaNac;
    private String dirCalle;
    private String dirNumero;
    private String dirColonia;
    private String category;
    private String password;

    public Alumno(String matricula, String nombrePila, String primerApellido, String segApellido, int edad,
                  String fechaNac, String dirCalle, String dirNumero, String dirColonia, String category, String password) {
        this.matricula = matricula;
        this.nombrePila = nombrePila;
        this.primerApellido = primerApellido;
        this.segApellido = segApellido;
        this.edad = edad;
        this.fechaNac = fechaNac;
        this.dirCalle = dirCalle;
        this.dirNumero = dirNumero;
        this.dirColonia = dirColonia;
        this.category = category;
        this.password = password;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getNombrePila() {
        return nombrePila;
    }

    public void setNombrePila(String nombrePila) {
        this.nombrePila = nombrePila;
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

    public String getDirCalle() {
        return dirCalle;
    }

    public void setDirCalle(String dirCalle) {
        this.dirCalle = dirCalle;
    }

    public String getDirNumero() {
        return dirNumero;
    }

    public void setDirNumero(String dirNumero) {
        this.dirNumero = dirNumero;
    }

    public String getDirColonia() {
        return dirColonia;
    }

    public void setDirColonia(String dirColonia) {
        this.dirColonia = dirColonia;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}