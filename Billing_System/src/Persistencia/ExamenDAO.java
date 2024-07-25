package Persistencia;
import Logica.*;
import java.sql.*;
import java.util.Scanner;

public class ExamenDAO{

    public void registrarEvento(Examen examen) throws SQLException {
        String sql = "INSERT INTO examen (codigo, precio, tipo_de_examen, fecha_registro) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, examen.getCodigo());
            stmt.setFloat(2, examen.getPrecio());
            stmt.setString(3, examen.getTipo_examen());
            stmt.setDate(4, Date.valueOf(examen.getFecha_registro()));

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
        float precio = Valid.getValidfloat(scanner, "Precio del examen: ");
        String tipo_examen = Valid.getValidString(scanner, "Tipo de examen: ", 10);
        String fecha_registro = Valid.getValidDate(scanner, "Fecha de Pago (YYYY-MM-DD): ");
        
        Examen examen = new Examen(codigo,precio,tipo_examen,fecha_registro);

        try {
            ExamenDAO.registrar(examen);
            System.out.println("Pago registrado exitosamente, su referencia es: " + referencia);
        } catch (SQLException e) {
            System.err.println("Error al registrar el pago: " + e.getMessage());
        }
    }
        
    }
}