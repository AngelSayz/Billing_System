package Persistencia;
import Logica.*;
import java.sql.*;
import java.util.Scanner;

import Interfaz.DateDisplay;

public class EventoDAO{

    public void registrarEvento(Evento evento) throws SQLException {
        String sql = "INSERT INTO evento (numero, nombre, fecha, fecha_registro) VALUES (?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, evento.getCodigo());
            stmt.setString(2, evento.getNombre());
            stmt.setDate(3, Date.valueOf(evento.getFecha()));
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error al registrar el evento: " + e.getMessage());
            throw e;
        }
    }

    public static void crearEvento() throws SQLException {
        EventoDAO eventoDAO = new EventoDAO();
        Scanner scanner = new Scanner(System.in);

        int codigo = Valid.getValidInt(scanner, "Codigo del evento: ");
        String nombre = Valid.getValidString(scanner, "Nombre del evento: ",15);
        String fecha = DateDisplay.getValidDate("Fecha del evento (YYYY-MM-DD): ");

        
        Evento evento = new Evento(codigo,nombre,fecha);

        try {
            eventoDAO.registrarEvento(evento);
            System.out.println("Evento registrado exitosamente");
        } catch (SQLException e) {
            System.err.println("Error al registrar el evento: " + e.getMessage());
        }
    }
//Leer los datos
    public Evento leerEvento(int codigo) throws SQLException {
        String sql = "SELECT * FROM evento WHERE numero = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, codigo);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Evento(
                        rs.getInt("numero"),
                        rs.getString("nombre"),
                        rs.getString("fecha")
                    );
                }
            }
        }
        return null; // Evento no encontrado
    }
//Actualizar los datos
    public void actualizarEvento(Evento evento) throws SQLException {
        String sql = "UPDATE evento SET nombre = ?, fecha = ?, fecha_registro = ? WHERE numero = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, evento.getNombre());
            stmt.setDate(2, Date.valueOf(evento.getFecha()));
            stmt.setInt(4, evento.getCodigo());
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error al actualizar el evento: " + e.getMessage());
            throw e;
        }
    }
//Eliminar los datos
    public void eliminarEvento(int codigo) throws SQLException {
        String sql = "DELETE FROM evento WHERE numero = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, codigo);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error al eliminar el evento: " + e.getMessage());
            throw e;
        }
    }

}