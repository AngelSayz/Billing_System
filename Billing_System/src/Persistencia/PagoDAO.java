package Persistencia;

import Logica.*;
import java.sql.*;
import java.util.Scanner;
import java.util.Random;

public class PagoDAO{

    public void registrarPago(Pago pago) throws SQLException {
        String sql = "INSERT INTO pago (referencia, fechaPago, monto, nivel_educativo, periodo, alumno) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, pago.getReferencia());
            stmt.setDate(2, Date.valueOf(pago.getFecha()));
            stmt.setDouble(3, pago.getMonto());
            stmt.setString(4, pago.getNivel_educativo()); //Duda
            stmt.setString(5, pago.getPeriodo()); //Duda
            stmt.setString(6, pago.getAlumno()); //Duda

            stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error al registrar el pago: " + e.getMessage());
            throw e;
        }
    }

    public static String inputPago() throws SQLException {
        PagoDAO pagoDAO = new PagoDAO();
        Scanner scanner = new Scanner(System.in);

        String fechaPago = Valid.getValidDate(scanner, "Fecha de Pago (YYYY-MM-DD): ");
        double monto = Valid.getValidDouble(scanner, "Monto a Pagar: ");
        String nivelEducativo = Valid.getValidString(scanner, "Nivel Educativo: ", 10);
        String periodo = Valid.getValidString(scanner, "Periodo: ", 10);
        String alumno = Valid.getValidString(scanner, "Matrícula del Alumno: ", 10);

        String referencia = generarReferencia(); // Llamada sin parámetros

        Pago pago = new Pago(referencia,fechaPago,periodo,nivelEducativo,alumno,monto);

        try {
            pagoDAO.registrarPago(pago);
            System.out.println("Pago registrado exitosamente, su referencia es: " + referencia);
        } catch (SQLException e) {
            System.err.println("Error al registrar el pago: " + e.getMessage());
        }
        return referencia;
    }

    public static String generarReferencia() throws SQLException {
        Random random = new Random();
        String referencia;
        boolean isUnique;
        try (Connection connection = DatabaseConnection.getConnection()) {
            do {
                int randomInt = random.nextInt(1, 999999999); // Genera un número aleatorio entre 0 y 999999999
                referencia = String.format("%010d", randomInt); // Formatea el número a 10 dígitos

                // Comprueba si la referencia ya existe en la base de datos
                String query = "SELECT COUNT(*) FROM pago WHERE referencia = ?";
                try (PreparedStatement statement = connection.prepareStatement(query)) {
                    statement.setString(1, referencia);
                    try (ResultSet resultSet = statement.executeQuery()) {
                        resultSet.next();
                        isUnique = resultSet.getInt(1) == 0;
                    }
                }
            } while (!isUnique);
        }
        return referencia;
    }


//Actualizacion de datos
    public void actualizarPago(Pago pago) throws SQLException {
    String sql = "UPDATE pago SET fechaPago = ?, monto = ?, nivel_educativo = ?, periodo = ?, alumno = ? WHERE referencia = ?";
    try (Connection conn = DatabaseConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, pago.getReferencia());
            stmt.setDate(2, Date.valueOf(pago.getFecha()));
            stmt.setDouble(3, pago.getMonto());
            stmt.setString(4, pago.getNivel_educativo());
            stmt.setString(5, pago.getPeriodo());
            stmt.setString(6, pago.getAlumno());
        stmt.executeUpdate();
    }
}

//Eliminar datos
public static void eliminarPago(String referencia) throws SQLException {
    String sql = "DELETE FROM pago WHERE referencia = ?";
    try (Connection conn = DatabaseConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, referencia);
        int rowsAffected = stmt.executeUpdate();
        if (rowsAffected > 0) {
            System.out.println("Pago eliminado exitosamente.");
        } else {
            System.out.println("No se encontró ningún pago con esa referencia.");
        }
    } catch (SQLException e) {
        System.err.println("Error al eliminar el pago: " + e.getMessage());
    }
}

//Leer los datos
public static Pago ConsultarPago(String referencia) throws SQLException {
    String sql = "SELECT * FROM pago WHERE referencia = ?";
    try (Connection conn = DatabaseConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, referencia);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                Pago pago = new Pago(
                    rs.getString("referencia"),
                    rs.getString("fechaPago"),
                    rs.getString("nivel_educativo"),
                    rs.getString("periodo"),
                    rs.getString("alumno"),
                    rs.getDouble("monto")
                );

                // Imprimir información del pago en formato de tabla
                System.out.println("-----------------------------------------------------------------------------------------");
                System.out.printf("| %-15s | %-10s | %-15s | %-10s | %-10s | %-10s |\n",
                        "Referencia", "Fecha Pago", "Nivel Educativo", "Periodo", "Alumno", "Monto");
                System.out.println("-----------------------------------------------------------------------------------------");

                System.out.printf("| %-15s | %-10s | %-15s | %-10s | %-10s | %-10.2f |\n",
                        pago.getReferencia(), pago.getFecha(), pago.getNivel_educativo(), 
                        pago.getPeriodo(), pago.getAlumno(), pago.getMonto());

                System.out.println("-----------------------------------------------------------------------------------------");

                return pago;
            }
        }
    } catch (SQLException e) {
        System.err.println("Error al consultar el pago: " + e.getMessage());
        throw e;
    }
    return null; // No se encontró el pago
}
public static Pago ConsultarPagoAlumno(String matricula) throws SQLException {
    String sql = "SELECT * FROM pago WHERE alumno = ?";
    try (Connection conn = DatabaseConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, matricula);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                Pago pago = new Pago(
                    rs.getString("referencia"),
                    rs.getString("fechaPago"),
                    rs.getString("nivel_educativo"),
                    rs.getString("periodo"),
                    rs.getString("alumno"),
                    rs.getDouble("monto")
                );
                System.out.println("-----------------------------------------------------------------------------------------");
                System.out.printf("| %-15s | %-10s | %-15s | %-10s | %-10s | %-10s |\n",
                        "Referencia", "Fecha Pago", "Nivel Educativo", "Periodo", "Alumno", "Monto");
                System.out.println("-----------------------------------------------------------------------------------------");

                System.out.printf("| %-15s | %-10s | %-15s | %-10s | %-10s | %-10.2f |\n",
                        pago.getReferencia(), pago.getFecha(), pago.getNivel_educativo(), 
                        pago.getPeriodo(), pago.getAlumno(), pago.getMonto());

                System.out.println("-----------------------------------------------------------------------------------------");

                return pago;
            }
        }
    } catch (SQLException e) {
        System.err.println("Error al consultar el pago: " + e.getMessage());
        throw e;
    }
    return null; 
}


}