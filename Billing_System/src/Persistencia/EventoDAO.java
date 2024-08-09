package Persistencia;

import java.sql.*;
import java.time.LocalDate;

import Logica.Pago;


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
public static String pagarEvento(String matricula, int numEvento, String nivelE) throws SQLException {
        PagoDAO pagoDAO = new PagoDAO();
        // ----------------------------
        String tpInscripcion = null;
        int tpPaqueteDeUniforme = 0;
        String tpExamen = null;
        String tpMensualidad = null;
        int tpEvento = 0;
        String tpPaqueteDeMaterial = null;
        // ----------------------------
        LocalDate fechaActual = LocalDate.now();
        String fechaPago = fechaActual.toString();
        double monto;
        String nivel_educativo = nivelE;
        int periodo = 4;
        String alumno = matricula;
        String tpDescripcion;
        String referencia = PagoDAO.generarReferencia();

        // Asignar valores según el tipo de pago seleccionado
        switch (numEvento) {
            case 1:
                monto = 200;
                tpDescripcion = "Kermes de regreso a clases";
                tpEvento = 19;
                break;
            case 2:
                monto = 75;
                tpDescripcion = "Fiesta independencia de Mexico";
                tpEvento = 20;
                break;
            case 3:
                monto = 100;
                tpDescripcion = "Fiesta navidad";
                tpEvento = 21;
                break;
            case 4:
                monto = 65;
                tpDescripcion = "Fiesta semana santa";
                tpEvento = 22;
                break;
            case 5:
                monto = 70;
                tpDescripcion = "Dia del Niño";
                tpEvento = 23;
                break;

            default:
                System.out.println("Error en el proceso");
                return null;
        }

        Pago pago = new Pago(referencia, fechaPago, nivel_educativo, periodo, alumno, monto, tpPaqueteDeMaterial,
                tpEvento, tpPaqueteDeMaterial, tpPaqueteDeMaterial, tpEvento, tpPaqueteDeMaterial,
                tpPaqueteDeMaterial, tpEvento, tpPaqueteDeMaterial);
        pago.setTPdescripcion(tpDescripcion);
        pago.setTPinscripcion(tpInscripcion);
        pago.setTPpaquete_de_uniforme(tpPaqueteDeUniforme);
        pago.setTPexamen(tpExamen);
        pago.setTPmensualidad(tpMensualidad);
        pago.setTPevento(tpEvento);
        pago.setTPpaquete_de_material(tpPaqueteDeMaterial);
        pago.setEstado("pendiente");

        try {
            pagoDAO.registrarPago(pago);
            System.out.println("Referencia generada exitosamente, gracias por usar PayTECH!");

        } catch (SQLException e) {
            System.err.println("Error al registrar el pago: " + e.getMessage());
        }
        return referencia;
    }
}