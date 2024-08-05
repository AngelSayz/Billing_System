package Logica;

import java.sql.SQLException;
import java.util.Scanner;
import Persistencia.*;

public class menuAlumno {
    public static void menuPrincipal(String matricula) throws SQLException {
        Scanner sc = new Scanner(System.in);
        AlumnoDAO alumnoDAO = new AlumnoDAO();
        String nombreAlumno = alumnoDAO.obtenerNombrePorMatricula(matricula);
        boolean menuAlumno = true;

        while (menuAlumno) {
            Valid.clear();
            System.out.println("┌──────────────────────────────────────────────┐");
            System.out.println("       Bienvenido, " + nombreAlumno + "!");
            System.out.println("└──────────────────────────────────────────────┘");
            System.out.println("╔══════════════════════════════════════════════╗");
            System.out.println("║                  MENU ALUMNO                 ║");
            System.out.println("╠══════════════════════════════════════════════╣");
            System.out.println("║  [1]- Consultar informacion personal         ║");
            System.out.println("║  [2]- Realizar un pago                       ║");
            System.out.println("║  [3]- Consultar pagos realizado              ║");
            System.out.println("║  [4]- Cerrar sesion                          ║");
            System.out.println("║  [0]- Cerrar programa                        ║");
            System.out.println("╚══════════════════════════════════════════════╝");
            int respuesta = Valid.getValidIntMenu(sc, " Ingrese una opcion: ", 0, 4);

            switch (respuesta) {
                case 0:
                    menuAlumno = false;
                    break;
                case 1:
                    consultarInfoPersonal(sc, matricula);
                    break;
                case 2:
                    realizarPago(matricula);
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

    public static void consultarInfoPersonal(Scanner sc, String matricula) throws SQLException {
        boolean consultarInfoPersonal = true;
        while (consultarInfoPersonal) {
            System.out.println("╔══════════════════════════════════════════════╗");
            System.out.println("║             INFORMACION PERSONAL             ║");
            System.out.println("╠══════════════════════════════════════════════╣");
            System.out.println("║  [1]- Ver informacion personal               ║");
            System.out.println("║  [2]- Ver historial de grupos                ║");
            System.out.println("║  [3]- Ver tutores registrados                ║");
            System.out.println("║  [4]- Ver inscripciones pagadas              ║");
            System.out.println("║  [5]- Ver mensualidades pagadas              ║");
            System.out.println("║  [6]- Ver inscripciones pagadas              ║");
            System.out.println("║  [0]- Salir                                  ║");
            System.out.println("╚══════════════════════════════════════════════╝");
            int respuesta = Valid.getValidIntMenu(sc, " Ingrese una opcion: ", 0, 6);

            switch (respuesta) {
                case 0:
                    consultarInfoPersonal = false;
                    break;
                case 1:
                    System.out.println("╔═══════════════════════╗");
                    System.out.println("║  [1]- CICLO 21-22     ║");
                    System.out.println("║  [2]- CICLO 22-23     ║");
                    System.out.println("║  [3]- CICLO 23-24     ║");
                    System.out.println("╚═══════════════════════╝");
                    int periodo = Valid.getValidIntMenu(sc, "Ingrese el periodo a consultar ", 1, 3);
                    AlumnoDAO.consultarInfoAlumno(matricula, periodo);
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
                    AlumnoDAO.consultarGrupoAlumno(matricula);
                    break;
                case 3:
                    TutorDAO.consultarTutores(matricula);
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
                case 4:
                    PagoDAO.consultarInscripcionesPagadas(matricula);
    
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
        boolean menuInscripcion = true;

        while (menuInscripcion) {
            System.out.println("╔═══════════════════════════════════════════╗");
            System.out.println("║                INSCRIPCIONES              ║");
            System.out.println("╠═══════════════════════════════════════════╣");
            System.out.println("║ [1] - Kinder                              ║");
            System.out.println("║ [2] - Primaria                            ║");
            System.out.println("║ [3] - Secundaria                          ║");
            System.out.println("║ [0] - Salir                               ║");
            System.out.println("╚═══════════════════════════════════════════╝");

            int respuesta = Valid.getValidIntMenu(sc, "Ingrese el nivel educativo del que pagara la inscripcion: ", 0,
                    3);

            switch (respuesta) {
                case 0:
                    menuInscripcion = false;
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
        boolean InscripcionesKinder = true;

        while (InscripcionesKinder) {
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
                    InscripcionesKinder = false;
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
        boolean inscripcionesSecudaria = true;

        while (inscripcionesSecudaria) {
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
                    inscripcionesSecudaria = false;
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
        /*
         * 19 (null, 'Kermes de regreso a clases', '2024-7-02', 200.00),
         * 20 (null, 'Fiesta independencia de Mexico', '2024-09-16', 75.00),
         * 21 (null, 'Fiesta navidad', '2024-12-17', 100.00),
         * 22 (null, 'Fiesta semana santa' '2024-04-13', 65.00),
         * 23 (null, 'Dia del Niño', '2025-06-30', 70.00);
         */
        while (realizarPago) {
            System.out.println("╔═══════════════════════════════════════════╗");
            System.out.println("║         LISTA DE EVENTOS PROXIMOS         ║");
            System.out.println("╠═══════════════════════════════════════════╣");
            System.out.println("║ [1]- Kermes de regreso a clases           ║");
            System.out.println("║ [2]- Fiesta independencia de Mexico       ║");
            System.out.println("║ [3]- Fiesta navidad                       ║");
            System.out.println("║ [4]- Fiesta semana santa                  ║");
            System.out.println("║ [5]- Dia del Niño                         ║");
            System.out.println("║ [0]- Salir                                ║");
            System.out.println("╚═══════════════════════════════════════════╝");
            int evento;
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion para revisar su informacion: ", 0, 5);

            switch (respuesta) {
                case 0:
                    realizarPago = false;
                    break;
                case 1:
                    evento = 19;
                    // EventoDAO.revisarEvento(evento);
                    break;
                case 2:
                    evento = 20;
                    // EventoDAO.revisarEvento(evento);
                    break;
                case 3:
                    evento = 21;
                    // EventoDAO.revisarEvento(evento);
                    break;
                case 4:
                    evento = 22;
                    // EventoDAO.revisarEvento(evento);
                    break;
                case 5:
                    evento = 23;
                    // EventoDAO.revisarEvento(evento);
                    break;
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

    /*
     * INSERT INTO tipo_de_examen (codigo, nombre) VALUES
     * ('PAR', 'Parcial'),
     * ('REM', 'Remedial'),
     * ('EXT', 'Extraordinario'),
     * ('DIAG', 'Diagnostico'),
     * ('ING', 'Ingles');
     * INSERT INTO examen (codigo, precio, tipo_de_examen) VALUES
     * ('EX_PAR', 50.00, 'PAR'),
     * ('EX_REM', 60.00, 'REM'),
     * ('EX_EXT', 70.00, 'EXT'),
     * ('EX_DIAG', 80.00, 'DIAG'),
     * ('EX_ING', 90.00, 'ING');
     */
    public static void menuExamen(String matricula) throws SQLException {
        Scanner sc = new Scanner(System.in);
        boolean realizarPago = true;

        while (realizarPago) {
            System.out.println("╔═══════════════════════════════════════════╗");
            System.out.println("║              LISTA DE EXÁMENES            ║");
            System.out.println("╠═══════════════════════════════════════════╣");
            System.out.println("║ [1]- PARCIAL                              ║");
            System.out.println("║ [2]- REMEDIAL                             ║");
            System.out.println("║ [3]- EXTRAORDINARIO                       ║");
            System.out.println("║ [4]- DIAGNOSTICO                          ║");
            System.out.println("║ [5]- EXAMEN INGLES                        ║");
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
                    // pagarEvento(matricula);
                    break;
                case 3:
                    // pagarUniforme(matricula);
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
                    // pagarInscripcion(matricula);
                    break;
                case 2:
                    // pagarEvento(matricula);
                    break;
                case 3:
                    // pagarUniforme(matricula);
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
                    // pagarInscripcion(matricula);
                    break;
                case 2:
                    // pagarEvento(matricula);
                    break;
                case 3:
                    // pagarUniforme(matricula);
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
}
