package Logica;


public class Alumno {
    private String matricula;
    private String nombrePila;
    private String primerApellido;
    private String segApellido;
    private int edad;
    private String fechaNac;
    private String nombreTutor;
    private String primerApellTutor;
    private String segApellTutor;
    private String numTel;
    private String dirCalle;
    private String dirNumero;
    private String dirColonia;
    private String category;

    public Alumno(String matricula, String nombrePila, String primerApellido, String segApellido, int edad,
                  String fechaNac, String nombreTutor, String primerApellTutor, String segApellTutor,
                  String dirCalle, String dirNumero, String dirColonia, String numTel, String category) {
        this.matricula = matricula;
        this.nombrePila = nombrePila;
        this.primerApellido = primerApellido;
        this.segApellido = segApellido;
        this.edad = edad;
        this.fechaNac = fechaNac;
        this.nombreTutor = nombreTutor;
        this.primerApellTutor = primerApellTutor;
        this.segApellTutor = segApellTutor;
        this.dirCalle = dirCalle;
        this.dirNumero = dirNumero;
        this.dirColonia = dirColonia;
        this.numTel = numTel;
        this.category = category;
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

    public String getNombreTutor() {
        return nombreTutor;
    }

    public void setNombreTutor(String nombreTutor) {
        this.nombreTutor = nombreTutor;
    }

    public String getPrimerApellTutor() {
        return primerApellTutor;
    }

    public void setPrimerApellTutor(String primerApellTutor) {
        this.primerApellTutor = primerApellTutor;
    }

    public String getSegApellTutor() {
        return segApellTutor;
    }

    public void setSegApellTutor(String segApellTutor) {
        this.segApellTutor = segApellTutor;
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

    public String getNumTel() {
        return numTel;
    }

    public void setNumTel(String numTel) {
        this.numTel = numTel;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getPassword() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getPassword'");
    }
}