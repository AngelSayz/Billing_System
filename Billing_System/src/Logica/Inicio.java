package Logica;

import java.sql.SQLException;
import java.util.Scanner;

import Persistencia.AlumnoDAO;

public class Inicio {
 public static void iniciarSesion() {
        boolean loginExitoso = true;
        @SuppressWarnings("resource")
        Scanner sc= new Scanner(System.in);
        AlumnoDAO alumnoDAO = new AlumnoDAO();

    do {  
        System.out.println("BIENVENIDO");
        System.out.print("Ingrese su matrícula: ");
        String matricula = sc.nextLine().trim();
        try {
            String categoria = alumnoDAO.verificarMatricula(matricula);
            if (categoria != null) {
                if (categoria.equals("admin")) {
                    menu.menuAdmin();
                } else {
                    menu.menuAlumno();
                }
            } else {
                System.out.println("Matrícula invalida. Por favor, inténtelo de nuevo.");
            }
        } catch (SQLException e) {
            System.err.println("Error al iniciar sesión: " + e.getMessage());
        }
    } while (loginExitoso);
    }
}
