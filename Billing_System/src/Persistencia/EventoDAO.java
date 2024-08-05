package Persistencia;

import java.sql.*;


public class EventoDAO{

    public static void consultarEvento(int evento) throws SQLException {
        String sql = "SELECT DISTINCT " +
            "ev.nombre AS Evento, " +
            "ev.fecha AS Fecha, " +
            "ev.costo AS Costo, " +
            "a.matricula AS Matricula, " +
            "CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) AS Alumno, " +
            "g.nombre AS Grupo, " +
            "g.nivel_educativo AS Nivel_Educativo, " +
            "gr.nombre AS Grado, " +
            "p.fechaPago AS Fecha_del_Pago " +
        "FROM " +
            "alumno AS a " +
        "INNER JOIN " +
            "grupo_alumno AS ga ON ga.alumno = a.matricula " +
        "INNER JOIN " +
            "grupo AS g ON g.numero = ga.grupo " +
        "INNER JOIN " +
            "periodo AS pe ON pe.numero = g.periodo " +
        "INNER JOIN " +
            "grado AS gr ON g.grado = gr.numero " +
        "INNER JOIN " +
            "pago AS p ON p.periodo = pe.numero " +
        "INNER JOIN " +
            "tipo_de_pago AS tp ON tp.pago = p.numero " +
        "INNER JOIN " +
            "evento AS ev ON ev.numero = tp.evento " +
        "WHERE " +
            "tp.evento IS NOT NULL " +
            "AND p.estado = 'confirmado' " +
            "AND ev.numero = ? "+
            "LIMIT 100000";
    
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
        
            try {
                conn = DatabaseConnection.getConnection();
                stmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                stmt.setInt(1, evento);
                rs = stmt.executeQuery();
        
                boolean hasResults = false;
                boolean eventInfoPrinted = false;
        
                while (rs.next()) {
                    hasResults = true;
        
                    if (!eventInfoPrinted) {
                        // Print event information only once
                        String nombreEvento = rs.getString("Evento");
                        String fechaEvento = rs.getString("Fecha");
                        Double costo = rs.getDouble("Costo");
        
                        System.out.println("Información del Evento:");
                        System.out.println("Nombre: " + nombreEvento);
                        System.out.println("Fecha: " + fechaEvento);
                        System.out.println("Costo: $" + String.format("%.2f", costo));
                        System.out.println("\nEstudiantes que pagaron:");
                        System.out.println("-----------------------------");
        
                        eventInfoPrinted = true;
                    }
        
                    String matricula = rs.getString("Matricula");
                    String alumno = rs.getString("Alumno");
                    String grupo = rs.getString("Grupo");
                    String nivelE = rs.getString("Nivel_Educativo");
                    String grado = rs.getString("Grado");
                    String fechapago = rs.getString("Fecha_del_Pago");
        
                    System.out.println("Matrícula: " + matricula);
                    System.out.println("Nombre: " + alumno);
                    System.out.println("Grupo: " + grupo);
                    System.out.println("Nivel Educativo: " + nivelE);
                    System.out.println("Grado: " + grado);
                    System.out.println("Fecha de pago: " + fechapago);
                    System.out.println("-----------------------------");
                }
                
                if (!hasResults) {
                    System.out.println("No se encontraron resultados para el evento con número: " + evento);
                }
            } finally {
                // Close resources in reverse order
                if (rs != null) try { rs.close(); } catch (SQLException e) { /* ignored */ }
                if (stmt != null) try { stmt.close(); } catch (SQLException e) { /* ignored */ }
                if (conn != null) try { conn.close(); } catch (SQLException e) { /* ignored */ }
            }
        }
}