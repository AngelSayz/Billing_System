package Persistencia;

import Logica.*;
import java.sql.*;
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
        Scanner sc = new Scanner(System.in);

        String nombreDePila = Valid.getValidString(sc, "Nombre del Alumno: ", 15);
        String primerApellido = Valid.getValidString(sc, "Apellido Paterno: ", 15);
        String segundoApellido = Valid.getValidOptionalString(sc, "Apellido Materno: ", 15);
        int edad = Valid.getValidInt(sc, "Edad del Alumno: ");
        String fechaNac = Valid.getValidDate(sc, "Fecha de nacimiento (YYYY-MM-DD): ");
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

        try (Connection conn= DatabaseConnection.getConnection()) {
            do {
                int randomInt = random.nextInt(1, 999999);
                matricula = String.format("%06d", randomInt); // Formatea el número a 6 digitos

                // Comprobacion en la DB de la matricula
                String query = "SELECT COUNT(*) FROM alumno WHERE matricula = ?";
                try (PreparedStatement statement = conn.prepareStatement(query)) {
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

    public static void eliminarAlumno() {
        Scanner sc = new Scanner(System.in);
        boolean cancElimnarAlumno = false;
        do {
            try (Connection conn = DatabaseConnection.getConnection()) {
                String checkCategoriaSql = "SELECT category FROM alumno WHERE matricula = ?";
                String matricula = Valid.getValidString(sc,
                        "Introduce la matrícula del alumno a eliminar (escriba 'CANCELAR' para cancelar el proceso): ",
                        10);
                if (matricula.equalsIgnoreCase("CANCELAR")) {
                    System.out.println("Cancelando proceso...");
                    cancElimnarAlumno = true;
                } else {
                    try (PreparedStatement checkStmt = conn.prepareStatement(checkCategoriaSql)) {
                        checkStmt.setString(1, matricula);
                        try (ResultSet rs = checkStmt.executeQuery()) {
                            if (rs.next()) {
                                String category = rs.getString("category");
                                if ("admin".equals(category)) {
                                    System.out.println("No se puede eliminar un usuario con la categoría 'admin'.");
                                } else {
                                    String deleteSql = "DELETE FROM alumno WHERE matricula = ?";
                                    try (PreparedStatement deleteStmt = conn.prepareStatement(deleteSql)) {
                                        deleteStmt.setString(1, matricula);
                                        int rowsAffected = deleteStmt.executeUpdate();
                                        if (rowsAffected > 0) {
                                            System.out.println("Registro eliminado exitosamente.");
                                        } else {
                                            System.out.println("No se encontró ningún registro con esa matrícula.");
                                        }
                                    }
                                }
                            } else {
                                System.out.println("No se encontró ningún registro con esa matrícula.");
                            }
                        }
                    }
                }
            } catch (SQLException e) {
                System.err.println("Error al eliminar el registro: " + e.getMessage());
            }
        } while (!cancElimnarAlumno);
    }
    public static void actualizarAlumno() throws SQLException {

    }
    public static void consultarAlumnos() throws SQLException {
        String sql = "SELECT matricula, CONCAT(primerApellido, ' ', segApellido, ' ', nombre_de_pila) AS nombreCompleto, " +
                     "edad, fechaNac " +
                     "FROM alumno " +
                     "WHERE category = 'user' ORDER BY primerApellido";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
    
            System.out.println("-----------------------------------------------------------------------------------------");
            System.out.printf("| %-10s | %-35s | %-4s | %-15s |\n",
                    "Matrícula", "Nombre completo", "Edad", "Fecha Nacimiento");
            System.out.println("-----------------------------------------------------------------------------------------");
    
            while (rs.next()) {
                String matricula = rs.getString("matricula");
                String nombreCompleto = rs.getString("nombreCompleto");
                int edad = rs.getInt("edad");
                Date fechaNac = rs.getDate("fechaNac");
    
                System.out.printf("| %-10s | %-35s | %-4d | %-15s |\n",
                        matricula, nombreCompleto, edad, fechaNac);
            }
    
            System.out.println("-----------------------------------------------------------------------------------------");
    
        } catch (SQLException e) {
            System.err.println("Error al consultar los alumnos: " + e.getMessage());
            throw e;
        }
    }
    public String obtenerNombrePorMatricula(String matricula) throws SQLException {
        String sql = "SELECT CONCAT(primerApellido, ' ', segApellido, ' ', nombre_de_pila) AS nombreCompleto FROM alumno WHERE matricula = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, matricula);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("nombreCompleto");
                } else {
                    return null; 
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener el nombre del alumno: " + e.getMessage());
            throw e;
        }
    }
    public static void consultarInfoAlumno(String matriculaInfo) throws SQLException {
        String sql = "SELECT matricula, CONCAT(primerApellido, ' ', segApellido, ' ', nombre_de_pila) AS nombreCompleto, " +
                     "edad, fechaNac " +
                     "FROM alumno " +
                     "WHERE matricula = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, matriculaInfo); // Set the value of the parameter
            try (ResultSet rs = stmt.executeQuery()) {
    
                System.out.println("-----------------------------------------------------------------------------------------");
                System.out.printf("| %-10s | %-35s | %-4s | %-15s |\n",
                        "Matrícula", "Nombre completo", "Edad", "Fecha Nacimiento");
                System.out.println("-----------------------------------------------------------------------------------------");
    
                while (rs.next()) {
                    String matricula = rs.getString("matricula");
                    String nombreCompleto = rs.getString("nombreCompleto");
                    int edad = rs.getInt("edad");
                    Date fechaNac = rs.getDate("fechaNac");
    
                    System.out.printf("| %-10s | %-35s | %-4d | %-15s |\n",
                            matricula, nombreCompleto, edad, fechaNac);
                }
    
                System.out.println("-----------------------------------------------------------------------------------------");
    
            }
        } catch (SQLException e) {
            System.err.println("Error al consultar la informacion: " + e.getMessage());
            throw e;
        }
    }
    
}
