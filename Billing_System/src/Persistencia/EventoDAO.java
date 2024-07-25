package Persistencia;
import Logica.*;
import java.sql.*;
import java.util.Scanner;

public class EventoDAO{

    public void registrarEvento(Evento evento) throws SQLException {
        String sql = "INSERT INTO evento (numero, nombre, fecha, fecha_registro) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, evento.getCodigo());
            stmt.setString(2, evento.getNombre());
            stmt.setDate(3, Date.valueOf(evento.getFecha()));
            stmt.setDate(4, Date.valueOf(evento.getFecha_Registro()));

            stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error al registrar el evento: " + e.getMessage());
            throw e;
        }

        
    }
}