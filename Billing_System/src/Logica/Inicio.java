package Logica;

import java.sql.SQLException;
import java.util.Scanner;

import Persistencia.AlumnoDAO;

public class Inicio {
    public static void iniciarSesion() {
        Scanner sc = new Scanner(System.in);
        AlumnoDAO alumnoDAO = new AlumnoDAO();

        System.out.println("╔══════════════════════════════════════════════╗");
        System.out.println("║       BIENVENIDO AL SISTEMA DE PAGOS         ║");
        System.out.println("╚══════════════════════════════════════════════╝");
        boolean loginExitoso = false;
    String matricula = null;

    // Verificación de matrícula
    do {

        matricula = Valid.getValidString(sc, " Ingrese su matrícula: ", 6);

        try {
            if (alumnoDAO.existeMatricula(matricula)) {
                loginExitoso = true;
            } else {
                System.out.println("╔════════════════════════════════════════════════════╗");
                System.out.println("║ Matrícula inválida. Por favor, inténtelo de nuevo. ║");
                System.out.println("╚════════════════════════════════════════════════════╝");
            }
        } catch (SQLException e) {
            System.err.println("Error al verificar la matrícula: " + e.getMessage());
        }
    } while (!loginExitoso);

    loginExitoso = false; // Reset para la verificación de la contraseña

    // Verificación de contraseña
    do {
        String password = Valid.getValidString(sc, " Ingrese su contraseña: ", 15);

        try {
            String categoria = alumnoDAO.verificarPass(matricula, password);
            if (categoria != null) {
                if (categoria.equals("admin")) {
                    loginExitoso = true;
                    menu.menuAdmin();
                } else {
                    loginExitoso = true;
                    menu.menuAlumno(matricula);
                }
            } else {
                System.out.println("╔════════════════════════════════════════════════════╗");
                System.out.println("║ Contraseña inválida. Por favor, inténtelo de nuevo. ║");
                System.out.println("╚════════════════════════════════════════════════════╝");
            }
        } catch (SQLException e) {
            System.err.println("Error al verificar la contraseña: " + e.getMessage());
        }
    } while (!loginExitoso);
}
}
