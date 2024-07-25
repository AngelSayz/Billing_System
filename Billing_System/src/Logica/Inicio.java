package Logica;

import java.sql.SQLException;
import java.util.Scanner;

import Persistencia.AlumnoDAO;

public class Inicio {
    public static void iniciarSesion() {
        Scanner sc = new Scanner(System.in);
        AlumnoDAO alumnoDAO = new AlumnoDAO();
        boolean loginExitoso;
        System.out.println("----------------------------------------------");
        System.out.println("                  BIENVENIDO");
        System.out.println("----------------------------------------------");
        do {
            loginExitoso = false;
            String matricula = Valid.getValidString(sc, "Ingrese su matrícula: ", 10);
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
                    System.out.println("Matrícula invalida. Por favor, inténtelo de nuevo.");
                }
            } catch (SQLException e) {
                System.err.println("Error al iniciar sesión: " + e.getMessage());
            }
        } while (!loginExitoso);
    }
}
