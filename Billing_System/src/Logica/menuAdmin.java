package Logica;

import java.sql.*;
import java.util.Scanner;
import Persistencia.*;

public class menuAdmin {
    public static final String PURPLE = "\033[0;35m";
    public static void menuPrincipal() throws SQLException {
        Scanner sc = new Scanner(System.in);
        boolean menuAdmin = true;
        while (menuAdmin) {
            Valid.clear();
            System.out.println(PURPLE+"╔══════════════════════════════════════════════╗");
            System.out.println("║               MENU ADMINISTRADOR             ║");
            System.out.println("╠══════════════════════════════════════════════╣");
            System.out.println("║ [1]- Gestionar alumnos                       ║");
            System.out.println("║ [2]- Gestionar pagos                         ║");
            System.out.println("║ [3]- Revisar eventos                         ║");
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
                    revisarEventos(sc);
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

    private static void revisarEventos(Scanner sc) throws SQLException {
        boolean revisarEventos = true;
        while (revisarEventos) {
            Valid.clear();
            System.out.println("╔══════════════════════════════════════════════════╗");
            System.out.println("║                  LISTA DE EVENTOS                ║");
            System.out.println("╠══════════════════════════════════════════════════╣");
            System.out.println("║ [1]- Fiesta de Bienvenida 2021                   ║");
            System.out.println("║ [2]- Día de Juegos y Diversión 2021              ║");
            System.out.println("║ [3]- Festival de Otoño Infantil 2021             ║");
            System.out.println("║ [4]- Fiesta Navideña Infantil 2021               ║");
            System.out.println("║ [5]- Desfile de Primavera 2022                   ║");
            System.out.println("║ [6]- Ceremonía de Graduación 2022                ║");
            System.out.println("║ [7]- Campamento de Verano Escolar 2022           ║");
            System.out.println("║ [8]- Día de la Familia en la Escuela 2022        ║");
            System.out.println("║ [9]- Feria de Ciencias Primaria 2022             ║");
            System.out.println("║ [10]- Concurso de Lectura y Escritura 2023       ║");
            System.out.println("║ [11]- Festival de Navidad Escolar 2023           ║");
            System.out.println("║ [12]- Fiesta de Fin de Año Escolar 2023          ║");
            System.out.println("║ [13]- Taller de Orientación Vocacional 2023      ║");
            System.out.println("║ [14]- Concurso de Ciencia y Tecnología 2023      ║");
            System.out.println("║ [15]- Competencia Deportiva Interescolar 2024    ║");
            System.out.println("║ [16]- Semana Cultural y de Innovación 2024       ║");
            System.out.println("║ [17]- Festival de Música y Arte Juvenil 2024     ║");
            System.out.println("║ [18]- Ceremonia de Graduación de Secundaria 2024 ║");
            System.out.println("║ [19]- Kermes de regreso a clases 2024 (PROX)     ║");
            System.out.println("║ [20]- Fiesta independencia de Mexico 2024 (PROX) ║");
            System.out.println("║ [21]- Fiesta navidad 2024 (PROX)                 ║");
            System.out.println("║ [22]- Fiesta semana santa 2024 (PROX)            ║");
            System.out.println("║ [23]- Dia del Niño 2025 (PROX)                   ║");
            System.out.println("║ [0]- Salir                                       ║");
            System.out.println("╚══════════════════════════════════════════════════╝");
            int evento = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 23);
            if (evento == 0) {
                revisarEventos = false;
            } else {
                EventoDAO.consultarEvento(evento);
                System.out.println("╔═══════════════════════╗");
                System.out.println("║  [1]- Regresar        ║");
                System.out.println("║  [2]- Cerrar sesion   ║");
                System.out.println("╚═══════════════════════╝");
                int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 1, 2);
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
                    AlumnoDAO.matricularAlumno();
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
                    consultarAlumnos(sc);
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
                    System.out.println("╔═══════════════════════╗");
                    System.out.println("║  [1]- CICLO 21-22     ║");
                    System.out.println("║  [2]- CICLO 22-23     ║");
                    System.out.println("║  [3]- CICLO 23-24     ║");
                    System.out.println("╚═══════════════════════╝");
                    int periodo = Valid.getValidIntMenu(sc, "Ingrese el periodo a consultar ", 1, 3);
                    String matricula = Valid.getValidString(sc,
                            "Ingrese la matricula del alumno a consultar (escriba 'CANCELAR' para cancelar el proceso): ",
                            10);
                    if (matricula.equals("CANCELAR")) {
                        System.out.println("Cancelando proceso...");
                    } else {
                        AlumnoDAO.consultarInfoAlumno(matricula, periodo);
                    }
                    break;
                case 2:
                    AlumnoDAO.consultarTodosAlumnos();
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
            System.out.println("║ [1]- Ver y gestionar pagos pendientes        ║");
            System.out.println("║ [2]- Eliminar un pago                        ║");
            System.out.println("║ [3]- Consultar la informacion de un pago     ║");
            System.out.println("║ [4]- Ver historial de costos                 ║");
            System.out.println("║ [5]- Ver pagos realizados                    ║");
            System.out.println("║ [0]- Salir                                   ║");
            System.out.println("╚══════════════════════════════════════════════╝");

            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 5);

            switch (respuesta) {
                case 0:
                    gestionarPagos = false;
                    break;
                case 1:
                    PagoDAO.consultarPagosPendientes();
                    System.out.println("╔═════════════════════════════════╗");
                    System.out.println("║  [1]- Actualizar un pago        ║");
                    System.out.println("║  [0]- Volver                    ║");
                    System.out.println("╚═════════════════════════════════╝");
                    respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 1);
                    if (respuesta == 1) {
                        String referencia = Valid.getValidString(sc,
                                "Ingrese el numero de referencia del pago a actualizar (escriba 'CANCELAR' para cancelar el proceso): ",
                                10);
                        if (referencia.equals("CANCELAR")) {
                            System.out.println("Cancelando proceso...");
                        } else {
                            System.out.println("╔═════════════════════════════════╗");
                            System.out.println("║  [1]- Confirmar el pago         ║");
                            System.out.println("║  [2]- Cancelar el pago          ║");
                            System.out.println("║  [0]- Cancelar                  ║");
                            System.out.println("╚═════════════════════════════════╝");
                            respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 2);
                            switch (respuesta) {
                                case 1:
                                    String estado = "confirmado";
                                    PagoDAO.actualizarPago(referencia, estado);
                                    break;
                                case 2:
                                    estado = "cancelado";
                                    PagoDAO.actualizarPago(referencia, estado);
                                    break;
                                default:
                                    System.out.println("╔═════════════════════════════════════════════════════════╗");
                                    System.out.println("║ Entrada inválida. Por favor, ingrese una opcion valida. ║");
                                    System.out.println("╚═════════════════════════════════════════════════════════╝");
                                    break;
                            }
                        }
                    }
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
                    System.out.println("╔════════════════════════════════════╗");
                    System.out.println("║  [1]- Costos de mantenimiento      ║");
                    System.out.println("║  [2]- Costos de los utiles         ║");
                    System.out.println("║  [0]- Volver                       ║");
                    System.out.println("╚════════════════════════════════════╝");
                    respuesta = Valid.getValidIntMenu(sc, "Ingrese opcion: ", 0, 2);
                    switch (respuesta) {
                        case 1:
                            PagoDAO.consultarCostoMantenimiento();
                            break;
                        case 2:
                            System.out.println("╔═══════════════════════╗");
                            System.out.println("║  [1]- CICLO 21-22     ║");
                            System.out.println("║  [2]- CICLO 22-23     ║");
                            System.out.println("║  [3]- CICLO 23-24     ║");
                            System.out.println("╚═══════════════════════╝");
                            int periodo = Valid.getValidIntMenu(sc, "Ingrese el periodo a consultar ", 0, 3);
                            System.out.println("╔═══════════════════════╗");
                            System.out.println("║  [1]- KINDER          ║");
                            System.out.println("║  [2]- PRIMARIA        ║");
                            System.out.println("║  [3]- SECUNDARIA      ║");
                            System.out.println("╚═══════════════════════╝");
                            respuesta = Valid.getValidIntMenu(sc, "Ingrese el nivel a consultar ", 1, 3);
                            switch (respuesta) {
                                case 1:
                                    String nivel_educativo = "KIND";
                                    PagoDAO.precioUtiles(periodo, nivel_educativo);
                                    break;
                                case 2:
                                    nivel_educativo = "KIND";
                                    PagoDAO.precioUtiles(periodo, nivel_educativo);

                                    break;
                                case 3:
                                    nivel_educativo = "KIND";
                                    PagoDAO.precioUtiles(periodo, nivel_educativo);

                                default:
                                    break;
                            }
                            break;
                        default:

                    }

                    break;
                case 5:
                    String nivel_educativo;
                    System.out.println("╔═══════════════════════╗");
                    System.out.println("║  [1]- KINDER          ║");
                    System.out.println("║  [2]- PRIMARIA        ║");
                    System.out.println("║  [3]- SECUNDARIA      ║");
                    System.out.println("║  [0]- Volver          ║");
                    System.out.println("╚═══════════════════════╝");
                    respuesta = Valid.getValidIntMenu(sc, "Ingrese el periodo a consultar ", 0, 3);
                    if (respuesta == 0) {
                        System.out.println("Volviendo...");
                    } else {
                        switch (respuesta) {
                            case 1:
                                nivel_educativo = "KIND";
                                break;
                            case 2:
                                nivel_educativo = "PRIM";
                                break;
                            case 3:
                                nivel_educativo = "SECU";
                                break;
                            default:
                                nivel_educativo = "";
                                break;
                        }
                        if (!nivel_educativo.isEmpty()) {
                            System.out.println("╔═══════════════════════╗");
                            System.out.println("║  [1]- CICLO 21-22     ║");
                            System.out.println("║  [2]- CICLO 22-23     ║");
                            System.out.println("║  [3]- CICLO 23-24     ║");
                            System.out.println("╚═══════════════════════╝");
                            int periodo = Valid.getValidIntMenu(sc, "Ingrese el periodo a consultar ", 1, 3);
                            PagoDAO.consultarTotalPagos(periodo, nivel_educativo);
                        }
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
}
