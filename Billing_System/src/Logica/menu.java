package Logica;

import java.sql.SQLException;
import java.util.Scanner;

import Persistencia.AlumnoDAO;

public class menu {
public static void menuAdmin() throws SQLException{
    Scanner sc = new Scanner(System.in);
    boolean switchPrincipal = true;
    do {
        clear();
        System.out.println("----------------------------------------------");
        System.out.println("1. Gestionar alumnos "); 
        System.out.println("2. Gestionar conceptos de pago");
        System.out.println("3. Gestionar historial de pagos");  
        System.out.println("4. Cerrar sesion"); 
        System.out.print("Ingrese una opcion: ");
         int respuesta = sc.nextInt();
        switch (respuesta) {
            case 1:
            clear();
            System.out.println("----------------------------------------------");
            System.out.println("1. Matricular un nuevo alumno "); 
            System.out.println("2. Dar de baja un alumno");
            System.out.println("3. Consultar la informacion de un alumno");  
            System.out.println("4. Actualizar la informacion de un alumno"); 
            System.out.println("0. Salir"); 
            System.out.print("Ingrese una opcion: ");
            respuesta = sc.nextInt();
            switch (respuesta) {
                    case 1://Crear un nuevo alumno
                        AlumnoDAO.crearAlumno(); 
                    break;
                    case 2://Eliminar un alumno
                         AlumnoDAO.crearAlumno(); 
                        break;
                    case 3://Consultar informacion de un alumno
                        AlumnoDAO.crearAlumno(); 
                    break;
                    case 4://Updaate alumno
                        AlumnoDAO.crearAlumno(); 
                    break;
                default:
                    break;
            }
           
                break;
            case 2:
            //Placeholder payment CRUD
                break;
            case 3:
            //Placeholder
                break;
            default:
                break;
        }
        sc.close();
    } while(switchPrincipal);
}

public static void clear(){
    System.out.print("\033[H\033[2J");  
    System.out.flush(); 
}
}
