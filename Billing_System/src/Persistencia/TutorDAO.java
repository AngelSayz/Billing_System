package Persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
import Logica.Tutor;
import Logica.Valid;

public class TutorDAO {
    public int registrarTutor(Tutor tutor) throws SQLException {
        String sql = "INSERT INTO tutor (nombrePila, primerApellido, segApellido, numTel) " +
                     "VALUES (?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, tutor.getNombrePila());
            stmt.setString(2, tutor.getPrimerApellido());
            stmt.setString(3, tutor.getSegApellido());
            stmt.setString(4, tutor.getNumTel());

            stmt.executeUpdate();

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Error al obtener el ID del tutor.");
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al registrar el tutor: " + e.getMessage());
            throw e;
        }
    }


    public static void crearTutor(String matriculaAlumno) throws SQLException {
        TutorDAO tutorDAO = new TutorDAO();
        Scanner sc = new Scanner(System.in);

        System.out.println("╔══════════════════════════════════════════════════════════════╗");
        System.out.println("║                      DATOS DEL TUTOR                         ║");
        System.out.println("╚══════════════════════════════════════════════════════════════╝");

        String nombrePila = Valid.getValidString(sc, "Nombre del Tutor: ", 15);
        String primerApellido = Valid.getValidString(sc, "Apellido Paterno: ", 15);
        String segApellido = Valid.getValidOptionalString(sc, "Apellido Materno: ", 15);
        String numTel = Valid.getValidString(sc, "Ingrese el numero telefonico del tutor: ", 15);

        Tutor tutor = new Tutor(nombrePila, primerApellido, segApellido, numTel);

        try {
            int idTutor = tutorDAO.registrarTutor(tutor);
            tutorDAO.registrarTutorAlumno(matriculaAlumno, idTutor);
        } catch (SQLException e) {
            System.err.println("╔════════════════════════════════════════════════════════════════╗");
            System.err.println("║                    ERROR AL REGISTRAR EL ALUMNO                ║");
            System.err.println("╚════════════════════════════════════════════════════════════════╝");
        }
    }
    public void registrarTutorAlumno(String matriculaAlumno, int idTutor) throws SQLException {
        String sql = "INSERT INTO tutor_alumno (alumno, tutor) VALUES (?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, matriculaAlumno);
            stmt.setInt(2, idTutor);

            stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error al registrar la relación alumno-tutor: " + e.getMessage());
            throw e;
        }
    }
    public static void consultarTutores(String matricula) {
        String sql = "SELECT " +
            "CONCAT(t.primerApellido, ' ', t.segApellido, ' ', t.nombrePila) as Tutor, " +
            "CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) as Alumno, " +
            "t.numTel as Número_de_Teléfono " +
            "FROM tutor as t " +
            "INNER JOIN tutor_alumno as ta on t.numero = ta.tutor " +
            "INNER JOIN alumno as a on a.matricula = ta.alumno " +
            "WHERE a.matricula = ? " +
            "ORDER BY a.matricula";
    
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
    
            stmt.setString(1, matricula);
    
            try (ResultSet rs = stmt.executeQuery()) {
                boolean firstRow = true;
                while (rs.next()) {
                    if (firstRow) {
                        System.out.println("Alumno: " + rs.getString("Alumno"));
                        System.out.println("\nTutores:");
                        firstRow = false;
                    }
                    System.out.println("--------------------");
                    System.out.println(rs.getString("Tutor"));
                    System.out.println("Número de Teléfono: " + rs.getString("Número_de_Teléfono"));
                }
                
                if (firstRow) {
                    System.out.println("No se encontraron tutores para la matrícula: " + matricula);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al consultar tutores: " + e.getMessage());
            e.printStackTrace();
        }
    }
}

