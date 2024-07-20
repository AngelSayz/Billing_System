package Logica;
import java.sql.SQLException;
import java.util.Scanner;
import Persistencia.AlumnoDAO;

public class menu{
    public static void menuAlumno() throws SQLException {}
    public static void menuAdmin() throws SQLException {
        Scanner sc = new Scanner(System.in);
        boolean switchPrincipal = true;
        clear();
        do {
            
            System.out.println("----------------------------------------------");
            System.out.println("1. Gestionar alumnos"); 
            System.out.println("2. Gestionar conceptos de pago");
            System.out.println("3. Gestionar historial de pagos");  
            System.out.println("4. Cerrar sesion"); 
            int respuesta = getValidInt(sc, "Ingrese una opcion: ");
            switch (respuesta) {
                case 1:
                    clear();
                    boolean gestionarAlumnos = true;
                    do {
                        System.out.println("----------------------------------------------");
                        System.out.println("1. Matricular un nuevo alumno "); 
                        System.out.println("2. Dar de baja un alumno");
                        System.out.println("3. Consultar la informacion de un alumno");  
                        System.out.println("4. Actualizar la informacion de un alumno"); 
                        System.out.println("0. Salir"); 
                        respuesta = getValidInt(sc, "Ingrese una opcion: ");
                        switch (respuesta) {
                            case 0:
                                gestionarAlumnos = false;
                                break;
                            case 1:
                                AlumnoDAO.crearAlumno(); 
                                break;
                            case 2:
                                AlumnoDAO.eliminarAlumno(); //tbr
                                break;
                            case 3:
                                AlumnoDAO.consultarAlumno(); //tbr
                                break;
                            case 4:
                                AlumnoDAO.actualizarAlumno(); //tbr
                                break;
                            default:
                                System.out.println("Entrada inválida. Por favor, ingrese una opción válida.");
                                break;
                        }
                    } while (gestionarAlumnos);
                    break;
                case 2:
                    // Placeholder 
                    break;
                case 3:
                    // Placeholder
                    break;
                case 4:
                    clear();
                    Inicio.iniciarSesion();
                    break;
                default:
                    System.out.println("Entrada inválida. Por favor, ingrese una opción válida.");
                    break;
            }
        } while (switchPrincipal);
    }


public static void clear(){
    System.out.print("\033[H\033[2J");  
    System.out.flush(); 
}

public static String getValidString(Scanner scanner, String prompt, int maxLength) {
    String input;
    while (true) {
        System.out.print(prompt);
        input = scanner.nextLine().trim();
        if (input.isEmpty()) {
            System.out.println("Entrada inválida. Por favor, ingrese un valor no vacío.");
        } else if (input.length() > maxLength) {
            System.out.println("Entrada inválida. El valor no debe exceder " + maxLength + " caracteres.");
        } else {
            break;
        }
    }
    return input;
}    
public static int getValidInt(Scanner scanner, String prompt) {
    Integer input = null;
    while (input == null) {
        System.out.print(prompt);
        String userInput = scanner.nextLine().trim();
        if (userInput.isEmpty()) {
            System.out.println("Entrada inválida. Por favor, ingrese un valor no vacío.");
        } else {
            try {
                input = Integer.parseInt(userInput);
            } catch (NumberFormatException e) {
                System.out.println("Entrada inválida. Por favor, ingrese un número entero.");
            }
        }
    }
    return input;
}



}
