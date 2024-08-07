package Logica;

import java.sql.SQLException;
import java.util.Scanner;
import Persistencia.*;

public class menuAlumno {
    public static void menuPrincipal(String matricula) throws SQLException {
        Scanner sc = new Scanner(System.in);
        String nombreAlumno = AlumnoDAO.obtenerNombrePorMatricula(matricula);
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
            System.out.println("║  [3]- Consultar pagos realizados             ║");
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
                    System.out.println("╔═══════════════════════╗");
                    System.out.println("║  [1]- Regresar        ║");
                    System.out.println("║  [2]- Cerrar sesion   ║");
                    System.out.println("╚═══════════════════════╝");
                    respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 1, 2);
                    switch (respuesta) {
                        case 1:
                            menuPrincipal(matricula);
                            return;
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
            System.out.println("║  [6]- Cambiar contraseña                     ║");
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
                            consultarInfoPersonal(sc, matricula);
                            return;
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
                    System.out.println("╔═══════════════════════╗");
                    System.out.println("║  [1]- Regresar        ║");
                    System.out.println("║  [2]- Cerrar sesion   ║");
                    System.out.println("╚═══════════════════════╝");
                    respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 1, 2);
                    break;
                case 5:
                    System.out.println("╔═══════════════════════╗");
                    System.out.println("║  [1]- CICLO 21-22     ║");
                    System.out.println("║  [2]- CICLO 22-23     ║");
                    System.out.println("║  [3]- CICLO 23-24     ║");
                    System.out.println("╚═══════════════════════╝");
                    periodo = Valid.getValidIntMenu(sc, "Ingrese el periodo a consultar ", 1, 3);
                    PagoDAO.consultarMensualidadesPagadas(matricula, periodo);

                    break;
                case 6:
                    AlumnoDAO.cambiarPassword(sc, matricula);
                    break;
            }
        }
    }

    public static void realizarPago(String matricula) throws SQLException {
        Scanner sc = new Scanner(System.in);
        boolean realizarPago = true;
        String nivel_educativo;
        while (realizarPago) {
            System.out.println("╔═══════════════════════════════════════════╗");
            System.out.println("║              LISTA DE PAGOS               ║");
            System.out.println("╠═══════════════════════════════════════════╣");
            System.out.println("║ [1]- Inscripcion                          ║");
            System.out.println("║ [2]- Eventos                              ║");
            System.out.println("║ [3]- Uniforme                             ║");
            System.out.println("║ [4]- Examen                               ║");
            System.out.println("║ [5]- Material                             ║");
            System.out.println("║ [6]- Mensualidad                          ║");
            System.out.println("║ [7]- Informacion sobre los pagos          ║");
            System.out.println("║ [0]- Salir                                ║");
            System.out.println("╚═══════════════════════════════════════════╝");
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 7);

            switch (respuesta) {
                case 0:
                    realizarPago = false;
                    break;
                case 1:
                    menuInscripcion(matricula);
                    break;
                case 2:

                    System.out.println("╔═══════════════════════╗");
                    System.out.println("║  [1]- KINDER          ║");
                    System.out.println("║  [2]- PRIMARIA        ║");
                    System.out.println("║  [3]- SECUNDARIA      ║");
                    System.out.println("║  [0]- Salir           ║");
                    System.out.println("╚═══════════════════════╝");
                    respuesta = Valid.getValidIntMenu(sc, "Ingrese el nivel educativo ", 1, 3);
                    switch (respuesta) {
                        case 0:
                            break;
                        case 1:
                            nivel_educativo = "KIND";
                            menuEvento(matricula, nivel_educativo);
                            break;
                        case 2:
                            nivel_educativo = "PRIM";
                            menuEvento(matricula, nivel_educativo);
                            break;
                        case 3:
                            nivel_educativo = "SECU";
                            menuEvento(matricula, nivel_educativo);
                            break;
                    }
                    break;
                case 3:
                    System.out.println("╔═══════════════════════╗");
                    System.out.println("║  [1]- KINDER          ║");
                    System.out.println("║  [2]- PRIMARIA        ║");
                    System.out.println("║  [3]- SECUNDARIA      ║");
                    System.out.println("║  [0]- Salir           ║");
                    System.out.println("╚═══════════════════════╝");
                    respuesta = Valid.getValidIntMenu(sc, "Ingrese el nivel educativo ", 1, 3);
                    switch (respuesta) {
                        case 0:
                            break;
                        case 1:
                            nivel_educativo = "KIND";
                            int periodo = 4;
                            PagoDAO.precioUniformes(periodo, nivel_educativo);
                            menuUniforme(matricula, nivel_educativo);
                            break;
                        case 2:
                            nivel_educativo = "PRIM";
                            periodo = 4;
                            PagoDAO.precioUniformes(periodo, nivel_educativo);
                            menuUniforme(matricula, nivel_educativo);
                            break;
                        case 3:
                            nivel_educativo = "SECU";
                            periodo = 4;
                            PagoDAO.precioUniformes(periodo, nivel_educativo);
                            menuUniforme(matricula, nivel_educativo);
                            break;
                    }
                    break;
                case 4:
                    menuExamen(matricula);
                    break;
                case 5:
                    System.out.println("╔═══════════════════════╗");
                    System.out.println("║  [1]- KINDER          ║");
                    System.out.println("║  [2]- PRIMARIA        ║");
                    System.out.println("║  [3]- SECUNDARIA      ║");
                    System.out.println("╚═══════════════════════╝");
                    respuesta = Valid.getValidIntMenu(sc, "Ingrese el nivel educativo ", 1, 3);
                    switch (respuesta) {
                        case 1:
                            nivel_educativo = "KIND";
                            int periodo = 4;
                            PagoDAO.precioUtiles(periodo, nivel_educativo);
                            break;
                        case 2:
                            nivel_educativo = "PRIM";
                            periodo = 4;
                            PagoDAO.precioUtiles(periodo, nivel_educativo);
                            break;
                        case 3:
                            nivel_educativo = "SECU";
                            periodo = 4;
                            PagoDAO.precioUtiles(periodo, nivel_educativo);
                            break;
                    }
                case 6:
                    System.out.println("╔═══════════════════════╗");
                    System.out.println("║  [1]- KINDER          ║");
                    System.out.println("║  [2]- PRIMARIA        ║");
                    System.out.println("║  [3]- SECUNDARIA      ║");
                    System.out.println("╚═══════════════════════╝");
                    respuesta = Valid.getValidIntMenu(sc, "Ingrese el nivel educativo ", 1, 3);
                    switch (respuesta) {
                        case 1:
                            nivel_educativo = "KIND";

                            menuMensualidad(matricula, nivel_educativo);
                            break;
                        case 2:
                            nivel_educativo = "PRIM";

                            menuMensualidad(matricula, nivel_educativo);
                            break;
                        case 3:
                            nivel_educativo = "SECU";

                            menuMensualidad(matricula, nivel_educativo);
                            break;
                        default:
                            System.out.println("╔═════════════════════════════════════════════════════════╗");
                            System.out.println("║ Entrada inválida. Por favor, ingrese una opcion valida. ║");
                            System.out.println("╚═════════════════════════════════════════════════════════╝");
                            break;
                    }
                case 7:
                    System.out.println("--------Como realizar un pago--------");
                    System.out.println();
                    System.out.println("**Generar referencia:**");
                    System.out.println("    1. Ingresa al portal de pagos de la plataforma.");
                    System.out.println("    2. Selecciona el tipo de pago a realizar.");
                    System.out.println("    3. Confirma tu informacion");
                    System.out.println("    4. Genera la referencia");
                    System.out.println("**Proceso de pago:**");
                    System.out.println("  En línea:");
                    System.out.println("    1. Ingresa al portal de tu banco en línea.");
                    System.out.println("    2. Selecciona la opción para realizar pagos.");
                    System.out.println("    3. Introduce la cuenta CLABE proporcionada y el convenio.");
                    System.out.println("    4. Ingresa el monto exacto a pagar.");
                    System.out.println("    5. Introduce el número de referencia en el campo correspondiente.");
                    System.out.println("    6. Confirma la transacción.");
                    System.out.println("  En sucursal bancaria:");
                    System.out.println("    1. Visita una sucursal de Bancomer.");
                    System.out.println("    2. Completa una ficha de depósito con los datos bancarios proporcionados.");
                    System.out.println("    3. Entrega la ficha y el monto a pagar al cajero.");
                    System.out.println("    4. Guarda el comprobante de pago.");
                    System.out.println();
                    System.out.println("**Tiempo de reflejo:**");
                    System.out.println(
                            "  - Los pagos realizados en línea se reflejan generalmente en un plazo de 24 a 48 horas.");
                    System.out.println(
                            "  - Los pagos realizados en sucursal bancaria pueden tardar hasta 72 horas en reflejarse.");
                    System.out.println();
                    System.out.println("**Confirmación del pago:**");
                    System.out.println(
                            "  - Recibirás un correo electrónico de confirmación una vez que el pago se haya registrado correctamente.");
                    System.out.println(
                            "  - Puedes verificar el estado de tu pago accediendo a tu cuenta en el sistema de pagos de la escuela.");
                    System.out.println();
                    System.out.println("**Asistencia y problemas:**");
                    System.out.println(
                            "  - Personal de la escuela: Si tienes algún problema o duda respecto al pago, puedes contactar al personal de administración de la escuela.");
                    System.out.println(
                            "  - Banco: Para problemas relacionados con la transferencia bancaria, puedes acudir a tu sucursal de Bancomer más cercana o llamar a su servicio de atención al cliente.");
                    System.out.println(
                            "  - Equipo de desarrollo: Para problemas relacionados al funcionamiento del software, favor de comunicarse al equipo");
                    System.out.println("    - Correo electrónico: paytech@cafcats.com");
                    System.out.println("    - Teléfono: (664) 123-9212");
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

    public static void InscripcionesSecundaria(String matricula) throws SQLException {
        Scanner sc = new Scanner(System.in);
        boolean inscripcionesSecundaria = true;

        while (inscripcionesSecundaria) {
            System.out.println("╔══════════════════════════════════════════════╗");
            System.out.println("║          INSCRIPCIONES SECUNDARIA            ║");
            System.out.println("╠══════════════════════════════════════════════╣");
            System.out.println("║ [1] - Generar referencia primero secundaria  ║");
            System.out.println("║ [2] - Generar referencia segundo secundaria  ║");
            System.out.println("║ [3] - Generar referencia tercero secundaria  ║");
            System.out.println("║ [0] - Salir                                  ║");
            System.out.println("╚══════════════════════════════════════════════╝");

            int grado;
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese la inscripcion a pagar: ", 0, 3);

            switch (respuesta) {
                case 0:
                    inscripcionesSecundaria = false;
                    break;
                case 1:
                    grado = 10;
                    PagoDAO.pagarInscripcion(matricula, grado);
                    break;
                case 2:
                    grado = 11;
                    PagoDAO.pagarInscripcion(matricula, grado);
                    break;
                case 3:
                    grado = 12;
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
        boolean inscripcionesSecudaria = true;

        while (inscripcionesSecudaria) {
            System.out.println("╔═════════════════════════════════════════════╗");
            System.out.println("║            INSCRIPCIONES PRIMARIA           ║");
            System.out.println("╠═════════════════════════════════════════════╣");
            System.out.println("║ [1] - Generar referencia primero primaria   ║");
            System.out.println("║ [2] - Generar referencia segundo primaria   ║");
            System.out.println("║ [3] - Generar referencia tercero primaria   ║");
            System.out.println("║ [4] - Generar referencia cuarto primaria    ║");
            System.out.println("║ [5] - Generar referencia quinto primaria    ║");
            System.out.println("║ [6] - Generar referencia sexto primaria     ║");
            System.out.println("║ [0] - Salir                                 ║");
            System.out.println("╚═════════════════════════════════════════════╝");

            int grado;
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese la inscripcion a pagar: ", 0, 6);

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

    public static void menuEvento(String matricula, String nivelE) throws SQLException {
        Scanner sc = new Scanner(System.in);
        boolean realizarPago = true;
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
                    evento = 1;
                    EventoDAO.pagarEvento(matricula, evento, nivelE);
                    ;
                    break;
                case 2:
                    evento = 2;
                    EventoDAO.pagarEvento(matricula, evento, nivelE);
                    break;
                case 3:
                    evento = 3;
                    EventoDAO.pagarEvento(matricula, evento, nivelE);
                    break;
                case 4:
                    evento = 4;
                    EventoDAO.pagarEvento(matricula, evento, nivelE);
                    break;
                case 5:
                    evento = 5;
                    EventoDAO.pagarEvento(matricula, evento, nivelE);
                    break;
                default:
                    System.out.println("╔═════════════════════════════════════════════════════════╗");
                    System.out.println("║ Entrada inválida. Por favor, ingrese una opcion valida. ║");
                    System.out.println("╚═════════════════════════════════════════════════════════╝");
                    break;
            }
        }
    }

    public static void menuUniforme(String matricula, String nivelE) throws SQLException {
        Scanner sc = new Scanner(System.in);
        boolean realizarPago = true;

        while (realizarPago) {
            System.out.println("╔══════════════════════════════════════════════════════╗");
            System.out.println("║             LISTA DE PAQUETES DE UNIFORME            ║");
            System.out.println("╠══════════════════════════════════════════════════════╣");
            System.out.println("║   Nota: Cada paquete de uniforme incluye un set      ║");
            System.out.println("║   deportivo, uno de invierno y uno regular de        ║");
            System.out.println("║   la talla y genero a eleccion                       ║");
            System.out.println("╠══════════════════════════════════════════════════════╣");
            System.out.println("║ [1]- Paquete de uniforme masculino (Talla S) $475.75 ║");
            System.out.println("║ [2]- Paquete de uniforme masculino (Talla M) $475.75 ║");
            System.out.println("║ [3]- Paquete de uniforme masculino (Talla L) $475.75 ║");
            System.out.println("║ [4]- Paquete de uniforme femenino (Talla S) $475.75  ║");
            System.out.println("║ [5]- Paquete de uniforme femenino (Talla M) $475.75  ║");
            System.out.println("║ [6]- Paquete de uniforme femenino (Talla L) $475.75  ║");
            System.out.println("║ [0]- Salir                                           ║");
            System.out.println("╚══════════════════════════════════════════════════════╝");
            int numero;
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 6);

            switch (respuesta) {
                case 0:
                    realizarPago = false;
                    break;
                case 1:
                    numero = 1;
                    PagoDAO.pagarUniforme(matricula, numero, nivelE);
                    break;
                case 2:
                    numero = 2;
                    PagoDAO.pagarUniforme(matricula, numero, nivelE);
                    break;
                case 3:
                    numero = 3;
                    PagoDAO.pagarUniforme(matricula, numero, nivelE);
                    break;
                case 4:
                    numero = 4;
                    PagoDAO.pagarUniforme(matricula, numero, nivelE);
                    break;
                case 5:
                    numero = 5;
                    PagoDAO.pagarUniforme(matricula, numero, nivelE);
                    break;
                case 6:
                    numero = 6;
                    PagoDAO.pagarUniforme(matricula, numero, nivelE);

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
            System.out.println("╔═══════════════════════════════╗");
            System.out.println("║        LISTA DE EXÁMENES      ║");
            System.out.println("╠═══════════════════════════════╣");
            System.out.println("║ [1]- PARCIAL                  ║");
            System.out.println("║ [2]- REMEDIAL                 ║");
            System.out.println("║ [3]- EXTRAORDINARIO           ║");
            System.out.println("║ [4]- DIAGNOSTICO              ║");
            System.out.println("║ [5]- EXAMEN INGLES            ║");
            System.out.println("║ [0]- SALIR                    ║");
            System.out.println("╚═══════════════════════════════╝");
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 5);

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
                    // menuMensualidad(matricula);

                default:
                    System.out.println("╔═════════════════════════════════════════════════════════╗");
                    System.out.println("║ Entrada inválida. Por favor, ingrese una opcion valida. ║");
                    System.out.println("╚═════════════════════════════════════════════════════════╝");
                    break;
            }
        }
    }

    public static void menuMaterial(String matricula) throws SQLException {
        Scanner sc = new Scanner(System.in);
        boolean realizarPago = true;

        while (realizarPago) {
            System.out.println("╔═══════════════════════════════════════════╗");
            System.out.println("║             LISTA DE MATERIAL             ║");
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
                    // menuMensualidad(matricula);
                    ;
                default:
                    System.out.println("╔═════════════════════════════════════════════════════════╗");
                    System.out.println("║ Entrada inválida. Por favor, ingrese una opcion valida. ║");
                    System.out.println("╚═════════════════════════════════════════════════════════╝");
                    break;
            }
        }
    }

    public static void menuMensualidad(String matricula, String nivel_educativo) throws SQLException {
        Scanner sc = new Scanner(System.in);
        boolean menuMensualidad = true;

        while (menuMensualidad) {
            System.out.println("╔═════════════════════════╗");
            System.out.println("║   PAGAR MENSUALIDADES   ║");
            System.out.println("╠═════════════════════════╣");
            System.out.println("║ [1]- Enero              ║");
            System.out.println("║ [2]- Febrero            ║");
            System.out.println("║ [3]- Marzo              ║");
            System.out.println("║ [4]- Abril              ║");
            System.out.println("║ [5]- Mayo               ║");
            System.out.println("║ [6]- Junio              ║");
            System.out.println("║ [7]- Julio              ║");
            System.out.println("║ [8]- Agosto             ║");
            System.out.println("║ [9]- Septiembre         ║");
            System.out.println("║ [10]- Octubre           ║");
            System.out.println("║ [11]- Noviembre         ║");
            System.out.println("║ [12]- Diciembre         ║");
            System.out.println("║ [0]- Salir              ║");
            System.out.println("╚═════════════════════════╝");
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 12);

            switch (respuesta) {
                case 0:
                    menuMensualidad = false;
                    break;
                case 1:
                    String mes = "ENE";
                    PagoDAO.pagarMensualidad(matricula, mes, nivel_educativo);
                    break;
                case 2:
                    mes = "FEB";
                    PagoDAO.pagarMensualidad(matricula, mes, nivel_educativo);
                    break;
                case 3:
                    mes = "MAR";
                    PagoDAO.pagarMensualidad(matricula, mes, nivel_educativo);
                    break;
                case 4:
                    mes = "ABR";
                    PagoDAO.pagarMensualidad(matricula, mes, nivel_educativo);
                    break;
                case 5:
                    mes = "MAY";
                    PagoDAO.pagarMensualidad(matricula, mes, nivel_educativo);
                    break;
                case 6:
                    mes = "JUN";
                    PagoDAO.pagarMensualidad(matricula, mes, nivel_educativo);
                    break;
                case 7:
                    mes = "JUL";
                    PagoDAO.pagarMensualidad(matricula, mes, nivel_educativo);
                    break;
                case 8:
                    mes = "AGO";
                    PagoDAO.pagarMensualidad(matricula, mes, nivel_educativo);
                    break;
                case 9:
                    mes = "SEP";
                    PagoDAO.pagarMensualidad(matricula, mes, nivel_educativo);
                    break;
                case 10:
                    mes = "OCT";
                    PagoDAO.pagarMensualidad(matricula, mes, nivel_educativo);
                    break;
                case 11:
                    mes = "NOV";
                    PagoDAO.pagarMensualidad(matricula, mes, nivel_educativo);
                    break;
                case 12:
                    mes = "DIC";
                    PagoDAO.pagarMensualidad(matricula, mes, nivel_educativo);
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
