package Logica;

import java.sql.SQLException;
import java.util.Scanner;

import Persistencia.AlumnoDAO;

public class Inicio {
    public static void iniciarSesion() {
        Scanner sc = new Scanner(System.in);
        AlumnoDAO alumnoDAO = new AlumnoDAO();
        boolean loginExitoso;
        System.out.println("\n\n");
        System.out.println("╔══════════════════════════════════════════════╗");
        System.out.println("║       BIENVENIDO AL SISTEMA DE PAGOS         ║");
        System.out.println("╚══════════════════════════════════════════════╝");

        do {
            loginExitoso = false;          
            String matricula = Valid.getValidString(sc, " Ingrese su matrícula: ", 6);

            try {
                String categoria = alumnoDAO.verificarMatricula(matricula);
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
                    System.out.println("║ Matrícula invalida. Por favor, inténtelo de nuevo. ║");
                    System.out.println("╚════════════════════════════════════════════════════╝");
                    
                }
            } catch (SQLException e) {
                System.err.println("Error al iniciar sesión: " + e.getMessage());
            }
        } while (!loginExitoso);
    }
}
