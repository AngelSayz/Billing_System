package Persistencia;

import Logica.*;
import java.sql.*;
import java.util.Scanner;

import Interfaz.DateDisplay;

import java.util.Random;

public class PagoDAO{

    public void registrarPago(Pago pago) throws SQLException {
        String sqlP = "INSERT INTO pago (referencia, fechaPago, monto, nivel_educativo, periodo, alumno) VALUES (?, ?, ?, ?, ?, ?)";
        String sqlTP = "INSERT INTO tipo_de_pago (numero, descripcion, pago, inscripcion, paquete_de_libros, paquete_de_uniforme, examen, mensualidad, evento, paquete_de_material) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
        try (Connection conn = DatabaseConnection.getConnection()) {
            conn.setAutoCommit(false); // Iniciar transacción
    
            try (PreparedStatement stmtP = conn.prepareStatement(sqlP);
                 PreparedStatement stmtTP = conn.prepareStatement(sqlTP)) {
                
                // Insert d la tabla pago
                stmtP.setString(1, pago.getReferencia());
                stmtP.setDate(2, Date.valueOf(pago.getFecha()));
                stmtP.setDouble(3, pago.getMonto());
                stmtP.setString(4, pago.getNivel_educativo());
                stmtP.setString(5, pago.getPeriodo());
                stmtP.setString(6, pago.getAlumno());
                stmtP.executeUpdate();
    
                // Insert de la tabla tipod e pago
                 stmtTP.setInt(1, pago.getTPnumero());
                stmtTP.setString(2, pago.getTPdescripcion());
                stmtTP.setString(3, pago.getReferencia());
                stmtTP.setString(4, pago.getTPinscripcion());
                stmtTP.setString(5, pago.getTPpaquete_de_libros());
                stmtTP.setInt(6, pago.getTPpaquete_de_uniforme());
                stmtTP.setString(7, pago.getTPexamen());
                stmtTP.setString(8, pago.getTPmensualidad());
                stmtTP.setInt(9, pago.getTPevento());
                stmtTP.setString(10, pago.getTPpaquete_de_material());
                stmtTP.executeUpdate();
    
                conn.commit(); // se confirma la transacción
    
            } catch (SQLException e) {
                conn.rollback(); // se cancela la transaccion 
                System.err.println("Error al registrar el pago: " + e.getMessage());
                throw e;
            }
        }
    }

    public static void inputPago() throws SQLException {
        PagoDAO pagoDAO = new PagoDAO();
        System.err.println("╔══════════════════════════════════════════════════════════════════╗");
        System.err.println("║ Por favor, seleccione la fecha del pago en la ventana emergente. ║");
        System.err.println("╚══════════════════════════════════════════════════════════════════╝");
        String fechaPago = DateDisplay.getValidDate("Seleccione la fecha del pago");
        if (fechaPago == null) {
            System.out.println("╔════════════════════════════════════════════════════════╗");
            System.out.println("║ Operación cancelada. No se ha ingresado ninguna fecha. ║");
            System.out.println("╚════════════════════════════════════════════════════════╝");
            return;
        }    
        Scanner scanner = new Scanner(System.in);
        double monto = Valid.getValidDouble(scanner, "Monto a Pagar: ");
        String nivelEducativo = Valid.getValidString(scanner, "Nivel Educativo: ", 10);
        String periodo = Valid.getValidString(scanner, "Periodo: ", 10);
        String alumno = Valid.getValidString(scanner, "Matrícula del Alumno: ", 10);
    
        String referencia = generarReferencia(); 
    
        Pago pago = new Pago(referencia, fechaPago, nivelEducativo, periodo, alumno, monto);
    
        try {
            pagoDAO.registrarPago(pago);
            System.out.println("Pago registrado exitosamente, su referencia es: " + referencia);
        } catch (SQLException e) {
            System.err.println("Error al registrar el pago: " + e.getMessage());
        }
        return;
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