package Persistencia;

import Logica.*;
import java.sql.*;
import java.time.*;
import java.time.format.DateTimeParseException;
import java.util.Scanner;
import java.util.Random;

public class AlumnoDAO {

    public void registrarAlumno(Alumno alumno) throws SQLException {
        String sql = "INSERT INTO alumno (matricula, nombre_de_pila, primerApellido, segApellido, edad, fechaNac, category) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, alumno.getMatricula());
            stmt.setString(2, alumno.getNombreDePila());
            stmt.setString(3, alumno.getPrimerApellido());
            stmt.setString(4, alumno.getSegApellido());
            stmt.setInt(5, alumno.getEdad());
            stmt.setDate(6, Date.valueOf(alumno.getFechaNac()));
            stmt.setString(7, "user");
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error al registrar el alumno: " + e.getMessage());
            throw e;
        }
    }
    public static void crearAlumno() throws SQLException {
        AlumnoDAO alumnoDAO = new AlumnoDAO();
        Scanner scanner = new Scanner(System.in);

        String nombreDePila = getValidString(scanner, "Nombre del Alumno: ", 15); 
        String primerApellido = getValidString(scanner, "Apellido Paterno: ", 15); 
        String segundoApellido = getValidOptionalString(scanner, "Apellido Materno: ", 15);                                                                                  
        int edad = getValidInt(scanner, "Edad del Alumno: "); 
        String fechaNac = getValidDate(scanner, "Fecha de nacimiento (YYYY-MM-DD): "); 
        String matricula = generarMatricula(); 
        Alumno alumno = new Alumno(matricula, nombreDePila, primerApellido, segundoApellido, edad, fechaNac);

        try {
            alumnoDAO.registrarAlumno(alumno);
            System.out.println("Alumno registrado exitosamente, su matrícula es: " + matricula);
        } catch (SQLException e) {
            System.err.println("Error al registrar el alumno: " + e.getMessage());
        }
    }

    public static String generarMatricula() throws SQLException {
        Random random = new Random();
        String matricula;
        boolean isUnique;

        try (Connection connection = DatabaseConnection.getConnection()) {
            do {
                int randomInt = random.nextInt(1, 999999999);
                matricula = String.format("%010d", randomInt); // Formatea el número a 4 dígitos

                // Comprobacion en la DB de la matricula
                String query = "SELECT COUNT(*) FROM alumno WHERE matricula = ?";
                try (PreparedStatement statement = connection.prepareStatement(query)) {
                    statement.setString(1, matricula);
                    try (ResultSet resultSet = statement.executeQuery()) {
                        resultSet.next();
                        isUnique = resultSet.getInt(1) == 0;
                    }
                }
            } while (!isUnique);
        }

        return matricula;
    }

    private static String getValidString(Scanner scanner, String prompt, int maxLength) {
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

    private static String getValidOptionalString(Scanner scanner, String prompt, int maxLength) {
        String input;
        while (true) {
            System.out.print(prompt);
            input = scanner.nextLine().trim();
            if (input.length() > maxLength) {
                System.out.println("Entrada inválida. El valor no debe exceder " + maxLength + " caracteres.");
            } else {
                break;
            }
        }
        return input;
    }
    private static int getValidInt(Scanner scanner, String prompt) {
        Integer input = null;
        while (input == null) {
            System.out.print(prompt);
            String userInput = scanner.nextLine().trim();
            if (userInput.isEmpty()) {
                System.out.println("Entrada inválida. Por favor, ingrese un valor no vacío.");
            } else {
                try {
                    input = Integer.parseInt(userInput);
                    if (input <= 0) {
                        System.out.println("Entrada inválida. Por favor, ingrese un número mayor a 0.");
                        input = null;
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Entrada inválida. Por favor, ingrese un número entero.");
                }
            }
        }
        return input;
    }
    private static String getValidDate(Scanner scanner, String prompt) {
        String input;
        while (true) {
            System.out.print(prompt);
            input = scanner.nextLine().trim();
            if (input.matches("\\d{4}-\\d{2}-\\d{2}") && isValidDate(input)) {
                break;
            } else {
                System.out.println("Entrada inválida. Por favor, ingrese una fecha válida en el formato YYYY-MM-DD.");
            }
        }
        return input;
    }
    private static boolean isValidDate(String date) {
        try {
            LocalDate.parse(date);
            return true;
        } catch (DateTimeParseException e) {
            return false;
        }
    }
    public String verificarMatricula(String matricula) throws SQLException {
        String sql = "SELECT category FROM alumno WHERE matricula = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, matricula);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("category");
                } else {
                    return null;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al verificar la matrícula: " + e.getMessage());
            throw e;
        }
    }
    public static void eliminarAlumno() throws SQLException {

    }
    public static void actualizarAlumno() throws SQLException {
        
    }
    public static void consultarAlumno() throws SQLException {
        
    }
}