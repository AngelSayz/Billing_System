package Persistencia;
import Logica.*;
import java.sql.*;
import java.util.Scanner;

public class ExamenDAO{

    public void registrarExamen(Examen examen) throws SQLException {
        String sql = "INSERT INTO examen (codigo, precio, tipo_de_examen) VALUES (?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, examen.getCodigo());
            stmt.setDouble(2, examen.getPrecio());
            stmt.setString(3, examen.getTipo_examen());

            stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error al registrar el examen: " + e.getMessage());
            throw e;
        }

    }
    public static void crearExamen() throws SQLException {
        ExamenDAO examenDAO = new ExamenDAO();
        Scanner scanner = new Scanner(System.in);

        String codigo = Valid.getValidString(scanner, "Codigo del examen: ", 10);
        double  precio = Valid.getValidDouble(scanner, "Precio del examen: ");
        String tipo_examen = Valid.getValidString(scanner, "Tipo de examen: ", 10);

        
        Examen examen = new Examen(codigo,precio,tipo_examen);

        try {
            examenDAO.registrarExamen(examen);
            System.out.println("Examen registrado exitosamente");
        } catch (SQLException e) {
            System.err.println("Error al registrar el examen: " + e.getMessage());
        }
    }
        
}