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
            System.out.println("║  [3]- Consultar historial de pagos           ║");
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

    public static void realizarPago(String matricula) throws SQLException {
        Scanner sc = new Scanner(System.in);
        boolean realizarPago = true;

        while (realizarPago) {
            System.out.println("╔═══════════════════════════════════════════╗");
            System.out.println("║              LISTA DE PAGOS               ║");
            System.out.println("╠═══════════════════════════════════════════╣");
            System.out.println("║ [1]- Inscripcion                          ║");
            System.out.println("║ [2]- Eventos                              ║");
            System.out.println("║ [3]- Uniforme                             ║");
            System.out.println("║ [4]- Examen                               ║");
            System.out.println("║ [5]- Libros                               ║");
            System.out.println("║ [6]- Mensualidad                          ║");
            System.out.println("║ [0]- Salir                                ║");
            System.out.println("╚═══════════════════════════════════════════╝");
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 4);

            switch (respuesta) {
                case 0:
                    realizarPago = false;
                    break;
                case 1:
                    menuInscripcion(matricula);
                    break;
                case 2:
                    menuEvento(matricula);
                    break;
                case 3:
                    menuUniforme(matricula);
                    break;
                case 4:
                    menuExamen(matricula);
                    break;
                case 5:
                    menuLibros(matricula);
                    break;
                case 6:
                    pagarMensualidad(matricula);
                    ;
                default:
                    System.out.println("╔═════════════════════════════════════════════════════════╗");
                    System.out.println("║ Entrada inválida. Por favor, ingrese una opcion valida. ║");
                    System.out.println("╚═════════════════════════════════════════════════════════╝");
                    break;
            }
        }
    }

    public static void menuInscripcion(String matricula) throws SQLException {
        Scanner sc = new Scanner(System.in);
        boolean realizarPago = true;

        while (realizarPago) {
            System.out.println("╔═══════════════════════════════════════════╗");
            System.out.println("║                INSCRIPCIONES              ║");
            System.out.println("╠═══════════════════════════════════════════╣");
            System.out.println("║ [1] - Kinder                              ║");
            System.out.println("║ [2] - Primaria                            ║");
            System.out.println("║ [3] - Secundaria                          ║");
            System.out.println("║ [0] - Salir                               ║");
            System.out.println("╚═══════════════════════════════════════════╝");

            int respuesta = Valid.getValidIntMenu(sc, "Ingrese el nivel educativo del que pagara la inscripcion: ", 0, 3);

            switch (respuesta) {
                case 0:
                    realizarPago = false;
                    break;
                case 1:
                    InscripcionesKinder(matricula);
                    break;
                case 2:
                    InscripcionesPrimaria(matricula);
                    break;
                case 3:
                    InscripcionesSecundaria(matricula);
                    break;

                default:
                    System.out.println("╔═════════════════════════════════════════════════════════╗");
                    System.out.println("║ Entrada inválida. Por favor, ingrese una opción válida. ║");
                    System.out.println("╚═════════════════════════════════════════════════════════╝");
                    break;
            }

        }
    }

    public static void InscripcionesKinder(String matricula) throws SQLException {
        Scanner sc = new Scanner(System.in);
        boolean realizarPago = true;

        while (realizarPago) {
            System.out.println("╔═══════════════════════════════════════════╗");
            System.out.println("║            INSCRIPCIONES KINDER           ║");
            System.out.println("╠═══════════════════════════════════════════╣");
            System.out.println("║ [1] - Generar referencia primero Kinder   ║");
            System.out.println("║ [2] - Generar referencia segundo Kinder   ║");
            System.out.println("║ [3] - Generar referencia tercero Kinder   ║");
            System.out.println("║ [0] - Salir                               ║");
            System.out.println("╚═══════════════════════════════════════════╝");
            int grado;
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese la inscripcion a pagar: ", 0, 3);

            switch (respuesta) {
                case 0:
                    realizarPago = false;
                    break;
                case 1:
                    grado = 1;
                    PagoDAO.pagarInscripcion(matricula, grado);
                    break;
                case 2:
                    grado = 2;
                    PagoDAO.pagarInscripcion(matricula, grado);
                    break;
                case 3:
                    grado = 3;
                    PagoDAO.pagarInscripcion(matricula, grado);
                    break;

                default:
                    System.out.println("╔═════════════════════════════════════════════════════════╗");
                    System.out.println("║ Entrada inválida. Por favor, ingrese una opción válida. ║");
                    System.out.println("╚═════════════════════════════════════════════════════════╝");
                    break;
            }

        }
    }

    public static void InscripcionesPrimaria(String matricula) throws SQLException {
        Scanner sc = new Scanner(System.in);
        boolean inscripcionesPrimaria = true;

        while (inscripcionesPrimaria) {
            System.out.println("╔═══════════════════════════════════════════╗");
            System.out.println("║          INSCRIPCIONES PRIMARIA           ║");
            System.out.println("╠═══════════════════════════════════════════╣");
            System.out.println("║ [1] - Generar referencia primero Primaria ║");
            System.out.println("║ [2] - Generar referencia segundo Primaria ║");
            System.out.println("║ [3] - Generar referencia tercero Primaria ║");
            System.out.println("║ [4] - Generar referencia cuarto Primaria  ║");
            System.out.println("║ [5] - Generar referencia quinto Primaria  ║");
            System.out.println("║ [6] - Generar referencia sexto Primaria   ║");
            System.out.println("║ [0] - Salir                               ║");
            System.out.println("╚═══════════════════════════════════════════╝");

            int grado;
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese la inscripcion a pagar: ", 0, 6);

            switch (respuesta) {
                case 0:
                    inscripcionesPrimaria = false;
                    break;
                case 1:
                    grado = 4;
                    PagoDAO.pagarInscripcion(matricula, grado);
                    break;
                case 2:
                    grado = 5;
                    PagoDAO.pagarInscripcion(matricula, grado);
                    break;
                case 3:
                    grado = 6;
                    PagoDAO.pagarInscripcion(matricula, grado);
                    break;

                default:
                    System.out.println("╔═════════════════════════════════════════════════════════╗");
                    System.out.println("║ Entrada inválida. Por favor, ingrese una opción válida. ║");
                    System.out.println("╚═════════════════════════════════════════════════════════╝");
                    break;
            }

        }
    }

    public static void InscripcionesSecundaria(String matricula) throws SQLException {
        Scanner sc = new Scanner(System.in);
        boolean inscripcionesPrimaria = true;

        while (inscripcionesPrimaria) {
            System.out.println("╔═════════════════════════════════════════════╗");
            System.out.println("║            INSCRIPCIONES PRIMARIA           ║");
            System.out.println("╠═════════════════════════════════════════════╣");
            System.out.println("║ [1] - Generar referencia primero secundaria ║");
            System.out.println("║ [2] - Generar referencia segundo secundaria ║");
            System.out.println("║ [3] - Generar referencia tercero secundaria ║");
            System.out.println("║ [0] - Salir                                 ║");
            System.out.println("╚═════════════════════════════════════════════╝");

            int grado;
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese la inscripcion a pagar: ", 0, 3);

            switch (respuesta) {
                case 0:
                    inscripcionesPrimaria = false;
                    break;
                case 1:
                    grado = 4;
                    PagoDAO.pagarInscripcion(matricula, grado);
                    break;
                case 2:
                    grado = 5;
                    PagoDAO.pagarInscripcion(matricula, grado);
                    break;
                case 3:
                    grado = 6;
                    PagoDAO.pagarInscripcion(matricula, grado);
                    break;
                case 4:
                    grado = 7;
                    PagoDAO.pagarInscripcion(matricula, grado);
                    break;
                case 5:
                    grado = 8;
                    PagoDAO.pagarInscripcion(matricula, grado);
                    break;
                case 6:
                    grado = 9;
                    PagoDAO.pagarInscripcion(matricula, grado);
                    break;

                default:
                    System.out.println("╔═════════════════════════════════════════════════════════╗");
                    System.out.println("║ Entrada inválida. Por favor, ingrese una opción válida. ║");
                    System.out.println("╚═════════════════════════════════════════════════════════╝");
                    break;
            }

        }
    }

    public static boolean confirmarPago(Scanner sc, String nivel) {
        System.out.println("╔═════════════════════════════════════════════════════════╗");
        System.out.println("║ Al continuar se generará una referencia para pagar la    ║");
        System.out.println("║ inscripción de " + nivel + ". ¿Desea continuar?          ║");
        System.out.println("║ [1] - Continuar                                          ║");
        System.out.println("║ [2] - Cancelar                                           ║");
        System.out.println("╚═════════════════════════════════════════════════════════╝");
        int opcion = Valid.getValidIntMenu(sc, "Ingrese su opción: ", 1, 2);
        return opcion == 1;
    }

    public static void menuEvento(String matricula) throws SQLException {
        Scanner sc = new Scanner(System.in);
        boolean realizarPago = true;

        while (realizarPago) {
            System.out.println("╔═══════════════════════════════════════════╗");
            System.out.println("║              LISTA DE EVENTOS             ║");
            System.out.println("╠═══════════════════════════════════════════╣");
            System.out.println("║ [1]- Inscripcion                          ║");
            System.out.println("║ [2]- Eventos                              ║");
            System.out.println("║ [3]- Uniforme                             ║");
            System.out.println("║ [4]- Examen                               ║");
            System.out.println("║ [5]- Libros                               ║");
            System.out.println("║ [6]- Mensualidad                          ║");
            System.out.println("║ [0]- Salir                                ║");
            System.out.println("╚═══════════════════════════════════════════╝");
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 6);

            switch (respuesta) {
                case 0:
                    realizarPago = false;
                    break;
                case 1:
                    //pagarInscripcion(matricula);
                    break;
                case 2:
                    //pagarEvento(matricula);
                    break;
                case 3:
                    //pagarUniforme(matricula);
                    break;
                case 4:
                    //pagarExamen(matricula);
                    break;
                case 5:
                   // pagarLibros(matricula);
                    break;
                case 6:
                    pagarMensualidad(matricula);
                    ;
                default:
                    System.out.println("╔═════════════════════════════════════════════════════════╗");
                    System.out.println("║ Entrada inválida. Por favor, ingrese una opcion valida. ║");
                    System.out.println("╚═════════════════════════════════════════════════════════╝");
                    break;
            }
        }
    }

    public static void menuUniforme(String matricula) throws SQLException {
        Scanner sc = new Scanner(System.in);
        boolean realizarPago = true;
        /*
         * Paquete de uniforme escolar hombre S', 2130, 'M', 'S'),
         * (null, 'Paquete de uniforme escolar hombre M', 2130, 'M', 'M'),
         * (null, 'Paquete de uniforme escolar hombre L', 2130, 'M', 'L'),
         * (null, 'Paquete de uniforme escolar mujer S', 2090, 'F', 'S'),
         * (null, 'Paquete de uniforme escolar mujer M', 2090, 'F', 'M'),
         * (null, 'Paquete de uniforme escolar mujer L
         */
        while (realizarPago) {
            System.out.println("╔══════════════════════════════════════════════╗");
            System.out.println("║       LISTA DE PAQUETES DE UNIFORME          ║");
            System.out.println("╠══════════════════════════════════════════════╣");
            System.out.println("║ [1]- Paquete de uniforme masculino (Talla S) ║");
            System.out.println("║ [2]- Paquete de uniforme masculino (Talla M) ║");
            System.out.println("║ [3]- Paquete de uniforme masculino (Talla L) ║");
            System.out.println("║ [4]- Paquete de uniforme femenino (Talla S)  ║");
            System.out.println("║ [5]- Paquete de uniforme femenino (Talla M)  ║");
            System.out.println("║ [6]- Paquete de uniforme femenino (Talla L)  ║");
            System.out.println("║ [0]- Salir                                   ║");
            System.out.println("╚══════════════════════════════════════════════╝");
            int numero;
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 4);

            switch (respuesta) {
                case 0:
                    realizarPago = false;
                    break;
                case 1:
                    numero = 1;
                    PagoDAO.pagarUniforme(matricula, numero);
                    break;
                case 2:
                    numero = 2;
                    PagoDAO.pagarUniforme(matricula, numero);
                    break;
                case 3:
                    numero = 3;
                    PagoDAO.pagarUniforme(matricula, numero);
                    break;
                case 4:
                    numero = 4;
                    PagoDAO.pagarUniforme(matricula, numero);
                    break;
                case 5:
                    numero = 5;
                    PagoDAO.pagarUniforme(matricula, numero);
                    break;
                case 6:
                    numero = 6;
                    PagoDAO.pagarUniforme(matricula, numero);

                default:
                    System.out.println("╔═════════════════════════════════════════════════════════╗");
                    System.out.println("║ Entrada inválida. Por favor, ingrese una opcion valida. ║");
                    System.out.println("╚═════════════════════════════════════════════════════════╝");
                    break;
            }
        }
    }

    public static void menuExamen(String matricula) throws SQLException {
        Scanner sc = new Scanner(System.in);
        boolean realizarPago = true;

        while (realizarPago) {
            System.out.println("╔═══════════════════════════════════════════╗");
            System.out.println("║              LISTA DE PAGOS               ║");
            System.out.println("╠═══════════════════════════════════════════╣");
            System.out.println("║ [1]- Inscripcion                          ║");
            System.out.println("║ [2]- Eventos                              ║");
            System.out.println("║ [3]- Uniforme                             ║");
            System.out.println("║ [4]- Examen                               ║");
            System.out.println("║ [5]- Libros                               ║");
            System.out.println("║ [6]- Mensualidad                          ║");
            System.out.println("║ [0]- Salir                                ║");
            System.out.println("╚═══════════════════════════════════════════╝");
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 4);

            switch (respuesta) {
                case 0:
                    realizarPago = false;
                    break;
                case 1:
                   // pagarInscripcion(matricula);
                    break;
                case 2:
                  //  pagarEvento(matricula);
                    break;
                case 3:
                    //pagarUniforme(matricula);
                    break;
                case 4:
                   // pagarExamen(matricula);
                    break;
                case 5:
                   // pagarLibros(matricula);
                    break;
                case 6:
                    pagarMensualidad(matricula);
                    ;
                default:
                    System.out.println("╔═════════════════════════════════════════════════════════╗");
                    System.out.println("║ Entrada inválida. Por favor, ingrese una opcion valida. ║");
                    System.out.println("╚═════════════════════════════════════════════════════════╝");
                    break;
            }
        }
    }

    public static void menuLibros(String matricula) throws SQLException {
        Scanner sc = new Scanner(System.in);
        boolean realizarPago = true;

        while (realizarPago) {
            System.out.println("╔═══════════════════════════════════════════╗");
            System.out.println("║              LISTA DE PAGOS               ║");
            System.out.println("╠═══════════════════════════════════════════╣");
            System.out.println("║ [1]- Inscripcion                          ║");
            System.out.println("║ [2]- Eventos                              ║");
            System.out.println("║ [3]- Uniforme                             ║");
            System.out.println("║ [4]- Examen                               ║");
            System.out.println("║ [5]- Libros                               ║");
            System.out.println("║ [6]- Mensualidad                          ║");
            System.out.println("║ [0]- Salir                                ║");
            System.out.println("╚═══════════════════════════════════════════╝");
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 4);

            switch (respuesta) {
                case 0:
                    realizarPago = false;
                    break;
                case 1:
                    //pagarInscripcion(matricula);
                    break;
                case 2:
                    //pagarEvento(matricula);
                    break;
                case 3:
                    //pagarUniforme(matricula);
                    break;
                case 4:
                   // pagarExamen(matricula);
                    break;
                case 5:
                   // pagarLibros(matricula);
                    break;
                case 6:
                    pagarMensualidad(matricula);
                    ;
                default:
                    System.out.println("╔═════════════════════════════════════════════════════════╗");
                    System.out.println("║ Entrada inválida. Por favor, ingrese una opcion valida. ║");
                    System.out.println("╚═════════════════════════════════════════════════════════╝");
                    break;
            }
        }
    }

    public static void pagarMensualidad(String matricula) throws SQLException {
        Scanner sc = new Scanner(System.in);
        boolean realizarPago = true;

        while (realizarPago) {
            System.out.println("╔═══════════════════════════════════════════╗");
            System.out.println("║              LISTA DE PAGOS               ║");
            System.out.println("╠═══════════════════════════════════════════╣");
            System.out.println("║ [1]- Inscripcion                          ║");
            System.out.println("║ [2]- Eventos                              ║");
            System.out.println("║ [3]- Uniforme                             ║");
            System.out.println("║ [4]- Examen                               ║");
            System.out.println("║ [5]- Libros                               ║");
            System.out.println("║ [6]- Mensualidad                          ║");
            System.out.println("║ [0]- Salir                                ║");
            System.out.println("╚═══════════════════════════════════════════╝");
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 4);

            switch (respuesta) {
                case 0:
                    realizarPago = false;
                    break;
                case 1:
                    //pagarInscripcion(matricula);
                    break;
                case 2:
                    //pagarEvento(matricula);
                    break;
                case 3:
                   // pagarUniforme(matricula);
                    break;
                case 4:
                   // pagarExamen(matricula);
                    break;
                case 5:
                    //pagarLibros(matricula);
                    break;
                case 6:
                    pagarMensualidad(matricula);
                    ;
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
            System.out.println("║ [3]- Gestionar eventos                       ║");
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
                    consultarAlumnos(sc); // FALTAN CONSULTAS ESPECIFICAS
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
