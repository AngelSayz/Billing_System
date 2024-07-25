package Logica;

import java.sql.SQLException;
import java.util.Scanner;
import Persistencia.AlumnoDAO;
import Persistencia.PagoDAO;

public class menu {
    public static void menuAlumno(String matricula) throws SQLException {
        Scanner sc = new Scanner(System.in);
        AlumnoDAO alumnoDAO = new AlumnoDAO();
        String nombreAlumno = alumnoDAO.obtenerNombrePorMatricula(matricula);
        boolean switchPrincipal = true;
        while (switchPrincipal) {
            Valid.clear();
            System.out.println("----------------------------------------------");
            System.out.println("    BIENVENIDO, " + nombreAlumno.toUpperCase());
            System.out.println("----------------------------------------------");
            System.out.println("1. Consultar informacion personal");
            System.out.println("2. Realizar un pago");
            System.out.println("3. Ver historial de pagos realizados");
            System.out.println("4. Cerrar sesion");
            System.out.println("0. Cerrar programa");
    
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 4);
            switch (respuesta) {
                case 0:
                    switchPrincipal = false;
                    break;
                case 1:
                    AlumnoDAO.consultarInfoAlumno(matricula);
                    System.out.println("1. Regresar");
                    System.out.println("2. Cerrar sesion");
                    respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 1, 2);
                    switch (respuesta){
                        case 1: 
                        break;
                        case 2:
                        Valid.clear();
                        Inicio.iniciarSesion();
                        return;
                    }    
                    break;
                case 2:
                    // Placeholder
                    break;
                case 3:
                    PagoDAO.ConsultarPagoAlumno(matricula);
                    break;
                case 4:
                    Valid.clear();
                    Inicio.iniciarSesion();
                    return;
                default:
                    System.out.println("Entrada inválida. Por favor, ingrese una opción válida.");
                    break;
            }
        }
    }
    

    public static void menuAdmin() throws SQLException {
        Scanner sc = new Scanner(System.in);
        boolean switchPrincipal = true;

        while (switchPrincipal) {
            Valid.clear();
            System.out.println("----------------------------------------------");
            System.out.println("                  ADMIN MENU");
            System.out.println("----------------------------------------------");
            System.out.println("1. Gestionar alumnos");
            System.out.println("2. Gestionar pagos");
            System.out.println("3. Gestionar conceptos de pago");
            System.out.println("4. Cerrar sesion");
            System.out.println("0. Cerrar programa");
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 4);
            switch (respuesta) {
                case 0:
                    switchPrincipal = false;
                    break;
                case 1:
                    gestionarAlumnos(sc);
                    break;
                case 2:
                    gestionarPagos(sc);
                    break;
                case 3:
                    // Placeholder
                    break;
                case 4:
                    Valid.clear();
                    Inicio.iniciarSesion();
                    return;
                default:
                    System.out.println("Entrada inválida. Por favor, ingrese una opción válida.");
                    break;
            }
        }
    }

    public static void gestionarAlumnos(Scanner sc) throws SQLException {
        boolean gestionarAlumnos = true;

        while (gestionarAlumnos) {
            System.out.println("----------------------------------------------");
            System.out.println("               GESTION ALUMNOS");
            System.out.println("----------------------------------------------");
            System.out.println("1. Matricular un nuevo alumno ");
            System.out.println("2. Dar de baja un alumno");
            System.out.println("3. Consultar la informacion de un alumno");
            System.out.println("4. Actualizar la informacion de un alumno");
            System.out.println("0. Salir");
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 4);

            switch (respuesta) {
                case 0:
                    gestionarAlumnos = false;
                    break;
                case 1:
                    AlumnoDAO.crearAlumno();
                    break;
                case 2:
                    AlumnoDAO.eliminarAlumno();
                    break;
                case 3:
                    AlumnoDAO.consultarAlumnos(); // tbr
                    break;
                case 4:
                    AlumnoDAO.actualizarAlumno(); // tbr
                    break;
                default:
                    System.out.println("Entrada inválida. Por favor, ingrese una opción válida.");
                    break;
            }
        }
    }
    public static void gestionarPagos(Scanner sc) throws SQLException {
        boolean gestionarPagos = true;

        while (gestionarPagos) {
            System.out.println("----------------------------------------------");
            System.out.println("               GESTION PAGOS");
            System.out.println("----------------------------------------------");
            System.out.println("1. Insertar manualmente un pago");
            System.out.println("2. Eliminar un pago");
            System.out.println("3. Consultar la informacion de un pago");
            System.out.println("4. Actualizar la informacion de un pago");
            System.out.println("0. Salir");
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 4);

            switch (respuesta) {
                case 0:
                    gestionarPagos = false;
                    break;
                case 1:
                    PagoDAO.inputPago();
                    break;
                case 2:
                    String refEliminar = Valid.getValidString(sc, "Ingrese la referencia del pago a eliminar (escriba 'CANCELAR' para cancelar el proceso): ", 10);
                    if (refEliminar.equals("CANCELAR")){
                        System.out.println("Cancelando proceso...");
                    } else {
                        PagoDAO.eliminarPago(refEliminar);
                    }
                    break;
                case 3:
                    String refConsultar = Valid.getValidString(sc, "Ingrese la referencia del pago a consultar (escriba 'CANCELAR' para cancelar el proceso): ", 10);
                    if (refConsultar.equals("CANCELAR")){
                        System.out.println("Cancelando proceso...");
                    } else {
                        PagoDAO.ConsultarPago(refConsultar);
                    }
                    break;
                case 4:
                    //placeholder
                    break;
                default:
                    System.out.println("Entrada inválida. Por favor, ingrese una opción válida.");
                    break;
            }
        }
    }
}
