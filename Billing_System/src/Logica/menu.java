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
        boolean menuAlumno = true;
        while (menuAlumno) {
            Valid.clear();
            System.out.println("╔══════════════════════════════════════════════╗");
            System.out.println("║                  MENU ALUMNO                 ║");
            System.out.println("╚══════════════════════════════════════════════╝");
            System.out.println("┌──────────────────────────────────────────────┐");
            System.out.println("    BIENVENIDO, " + nombreAlumno.toUpperCase());
            System.out.println("└──────────────────────────────────────────────┘");
            System.out.println("╔══════════════════════════════════════════════╗");
            System.out.println("║  [1]- Consultar informacion personal         ║");
            System.out.println("║  [2]- Realizar un pago                       ║");
            System.out.println("║  [3]- Ver historial de pagos realizados      ║");
            System.out.println("║  [4]- Cerrar sesion                          ║");
            System.out.println("║  [0]- Cerrar programa                        ║");
            System.out.println("╚══════════════════════════════════════════════╝");
            int respuesta = Valid.getValidIntMenu(sc, " Ingrese una opcion: ", 0, 4);

            switch (respuesta) {
                case 0:
                    menuAlumno = false;
                    break;
                case 1:
                    AlumnoDAO.consultarInfoAlumno(matricula);
                    System.out.println("╔═══════════════════════╗");
                    System.out.println("║  [1]- Regresar        ║");
                    System.out.println("║  [2]- Cerrar sesion   ║");
                    System.out.println("╚═══════════════════════╝");
                    respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 1, 2);
                    switch (respuesta) {
                        case 1:
                            break;
                        case 2:
                            Valid.clear();
                            Inicio.iniciarSesion();
                            return;
                        default:
                            System.out.println("╔═════════════════════════════════════════════════════════╗");
                            System.out.println("║ Entrada inválida. Por favor, ingrese una opcion valida. ║");
                            System.out.println("╚═════════════════════════════════════════════════════════╝");
                            break;
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
                    System.out.println("╔═════════════════════════════════════════════════════════╗");
                    System.out.println("║ Entrada inválida. Por favor, ingrese una opcion valida. ║");
                    System.out.println("╚═════════════════════════════════════════════════════════╝");
                    break;
            }
        }
    }

    public static void menuAdmin() throws SQLException {
        Scanner sc = new Scanner(System.in);
        boolean menuAdmin = true;
        while (menuAdmin) {
            Valid.clear();
            System.out.println("╔══════════════════════════════════════════════╗");
            System.out.println("║               MENU ADMINISTRADOR             ║");
            System.out.println("╠══════════════════════════════════════════════╣");
            System.out.println("║ [1]- Gestionar alumnos                       ║");
            System.out.println("║ [2]- Gestionar pagos                         ║");
            System.out.println("║ [3]- Gestionar conceptos de pago             ║");
            System.out.println("║ [4]- Cerrar sesion                           ║");
            System.out.println("║ [0]- Cerrar programa                         ║");
            System.out.println("╚══════════════════════════════════════════════╝");
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 4);
            switch (respuesta) {
                case 0:
                    menuAdmin = false;
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
                    System.out.println("╔═════════════════════════════════════════════════════════╗");
                    System.out.println("║ Entrada inválida. Por favor, ingrese una opcion valida. ║");
                    System.out.println("╚═════════════════════════════════════════════════════════╝");
                    break;
            }
        }
    }

    public static void gestionarAlumnos(Scanner sc) throws SQLException {
        boolean gestionarAlumnos = true;
    
        while (gestionarAlumnos) {
            System.out.println("╔══════════════════════════════════════════════╗");
            System.out.println("║               GESTIONAR ALUMNOS              ║");
            System.out.println("╠══════════════════════════════════════════════╣");
            System.out.println("║ [1]- Matricular un nuevo alumno              ║");
            System.out.println("║ [2]- Dar de baja un alumno                   ║");
            System.out.println("║ [3]- Consultar la informacion de los alumnos ║");
            System.out.println("║ [4]- Modificar la informacion de un alumno   ║");
            System.out.println("║ [0]- Salir                                   ║");
            System.out.println("╚══════════════════════════════════════════════╝");
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 4);
    
            switch (respuesta) {
                case 0:
                    gestionarAlumnos = false;
                    break;
                case 1:
                    AlumnoDAO.crearAlumno();
                    break;
                case 2:
                    System.out.println("╔══════════════════════════════════════════════╗");
                    System.out.println("║             DAR DE BAJA UN ALUMNO            ║");
                    System.out.println("╚══════════════════════════════════════════════╝");
                    String matriculaEliminar = Valid.getValidString(sc,
                            "Introduce la matrícula del alumno a eliminar (escriba 'CANCELAR' para cancelar el proceso): ",
                            10);
                    if (matriculaEliminar.equalsIgnoreCase("CANCELAR")) {
                        System.out.println("Cancelando proceso...");
                    } else {
                        AlumnoDAO.eliminarAlumno(matriculaEliminar);
                    }
                    break;
                case 3:
                    consultarAlumnos(sc); // IN PROCESSS
                    break;
                case 4:
                    System.out.println("╔══════════════════════════════════════════════╗");
                    System.out.println("║             MODIFICAR UN ALUMNO              ║");
                    System.out.println("╚══════════════════════════════════════════════╝");
                    String matriculaModificar = Valid.getValidString(sc,
                            "Ingrese la matricula del alumno a modificar (escriba 'CANCELAR' para cancelar el proceso): ",
                            10);
                    if (matriculaModificar.equalsIgnoreCase("CANCELAR")) {
                        System.out.println("Cancelando proceso...");
                    } else {
                        AlumnoDAO.actualizarAlumno(sc, matriculaModificar);
                    }
                    break;
                default:
                    System.out.println("╔═════════════════════════════════════════════════════════╗");
                    System.out.println("║ Entrada inválida. Por favor, ingrese una opcion valida. ║");
                    System.out.println("╚═════════════════════════════════════════════════════════╝");
                    break;
            }
        }
    }
    

    private static void consultarAlumnos(Scanner sc) throws SQLException {
        boolean consultarAlumnos = true;

        while (consultarAlumnos) {
            System.out.println("╔══════════════════════════════════════════════╗");
            System.out.println("║               CONSULTAR ALUMNOS              ║");
            System.out.println("╠══════════════════════════════════════════════╣");
            System.out.println("║ [1]- Consultar un alumno especifico          ║");
            System.out.println("║ [2]- Consultar todos los alumnos             ║");
            System.out.println("║ [3]- Consultas especificas                   ║");
            System.out.println("║ [0]- Salir                                   ║");
            System.out.println("╚══════════════════════════════════════════════╝");
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 3);

            switch (respuesta) {
                case 0:
                    consultarAlumnos = false;
                    break;
                case 1:
                    System.out.println("╔══════════════════════════════════════════════╗");
                    System.out.println("║             CONSULTAR UN ALUMNO              ║");
                    System.out.println("╚══════════════════════════════════════════════╝");
                    String matricula = Valid.getValidString(sc,
                            "Ingrese la matricula del alumno a consultar (escriba 'CANCELAR' para cancelar el proceso): ",
                            10);
                    if (matricula.equals("CANCELAR")) {
                        System.out.println("Cancelando proceso...");
                    } else {
                        AlumnoDAO.consultarInfoAlumno(matricula);
                    }
                    break;
                case 2:
                    AlumnoDAO.consultarTodosAlumnos();
                    break;
                case 3:
                    // IN PROCESSS
                    break;
                default:
                    System.out.println("╔═════════════════════════════════════════════════════════╗");
                    System.out.println("║ Entrada inválida. Por favor, ingrese una opcion valida. ║");
                    System.out.println("╚═════════════════════════════════════════════════════════╝");
                    break;
            }
        }
    }

    public static void gestionarPagos(Scanner sc) throws SQLException {
        boolean gestionarPagos = true;

        while (gestionarPagos) {
            System.out.println("╔══════════════════════════════════════════════╗");
            System.out.println("║               GESTIONAR PAGOS                ║");
            System.out.println("╠══════════════════════════════════════════════╣");
            System.out.println("║ [1]- Insertar manualmente un pago            ║");
            System.out.println("║ [2]- Eliminar un pago                        ║");
            System.out.println("║ [3]- Consultar la informacion de un pago     ║");
            System.out.println("║ [4]- Modificar la informacion de un pago     ║");
            System.out.println("║ [0]- Salir                                   ║");
            System.out.println("╚══════════════════════════════════════════════╝");

            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 4);

            switch (respuesta) {
                case 0:
                    gestionarPagos = false;
                    break;
                case 1:
                    System.out.println("╔══════════════════════════════════════════════╗");
                    System.out.println("║        INSERTAR MANUALMENTE UN PAGO          ║");
                    System.out.println("╚══════════════════════════════════════════════╝");
                    PagoDAO.inputPago();
                    break;
                case 2:
                    System.out.println("╔══════════════════════════════════════════════╗");
                    System.out.println("║               ELIMINAR UN PAGO               ║");
                    System.out.println("╚══════════════════════════════════════════════╝");
                    String refEliminar = Valid.getValidString(sc,
                            "Ingrese la referencia del pago a eliminar (escriba 'CANCELAR' para cancelar el proceso): ",
                            10);
                    if (refEliminar.equals("CANCELAR")) {
                        System.out.println("Cancelando proceso...");
                    } else {
                        PagoDAO.eliminarPago(refEliminar);
                    }
                    break;
                case 3:
                    System.out.println("╔══════════════════════════════════════════════╗");
                    System.out.println("║               CONSULTAR UN PAGO              ║");
                    System.out.println("╚══════════════════════════════════════════════╝");
                    String refConsultar = Valid.getValidString(sc,
                            "Ingrese la referencia del pago a consultar (escriba 'CANCELAR' para cancelar el proceso): ",
                            10);
                    if (refConsultar.equals("CANCELAR")) {
                        System.out.println("Cancelando proceso...");
                    } else {
                        PagoDAO.ConsultarPago(refConsultar);
                    }
                    break;
                case 4:
                System.out.println("╔══════════════════════════════════════════════╗");
                System.out.println("║     MODIFICAR LA INFORMACION DE UN PAGO      ║");
                System.out.println("╚══════════════════════════════════════════════╝");
                    break;
                default:
                    System.out.println("╔═════════════════════════════════════════════════════════╗");
                    System.out.println("║ Entrada inválida. Por favor, ingrese una opcion valida. ║");
                    System.out.println("╚═════════════════════════════════════════════════════════╝");
                    break;
            }
        }
    }
}
