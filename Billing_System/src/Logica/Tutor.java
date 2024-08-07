package Logica;
import java.util.Scanner;

public class Tutor {
    private String nombrePila;
    private String primerApellido;
    private String segApellido;
    private String numTel;
    public Tutor(String nombrePila, String primerApellido, String segApellido, String numTel) {
        this.nombrePila = nombrePila;
        this.primerApellido = primerApellido;
        this.segApellido = segApellido;
        this.numTel = numTel;
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
    public String getNumTel() {
        return numTel;
    }
    public void setNumTel(String numTel) {
        this.numTel = numTel;
    }
    public void registrarTutor(Scanner sc, Tutor tutor) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'registrarTutor'");
    }
}
