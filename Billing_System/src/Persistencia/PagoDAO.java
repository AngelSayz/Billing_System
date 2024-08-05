package Persistencia;

import Logica.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.time.LocalDate;

public class PagoDAO {

    public void registrarPago(Pago pago) throws SQLException {
        String sqlP = "INSERT INTO pago (referencia, fechaPago, monto, nivel_educativo, periodo, alumno, estado) VALUES (?, ?, ?, ?, ?, ?,?)";
        String sqlTP = "INSERT INTO tipo_de_pago (descripcion, pago, inscripcion, paquete_de_libros, paquete_de_uniforme, examen, mensualidad, evento, paquete_de_material) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection()) {
            conn.setAutoCommit(false); // Iniciar transacción

            try (PreparedStatement stmtP = conn.prepareStatement(sqlP, Statement.RETURN_GENERATED_KEYS);
                    PreparedStatement stmtTP = conn.prepareStatement(sqlTP)) {

                // Insert en la tabla pago
                stmtP.setString(1, pago.getReferencia());
                stmtP.setDate(2, Date.valueOf(pago.getFecha()));
                stmtP.setDouble(3, pago.getMonto());
                stmtP.setString(4, pago.getNivel_educativo());
                stmtP.setInt(5, pago.getPeriodo());
                stmtP.setString(6, pago.getAlumno());
                stmtP.setString(7, pago.getEstado());
                stmtP.executeUpdate();

                // Get the generated primary key value
                ResultSet generatedKeys = stmtP.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int pagoId = generatedKeys.getInt(1);

                    // Insert en la tabla tipo_de_pago
                    stmtTP.setString(1, pago.getTPdescripcion());
                    stmtTP.setInt(2, pagoId); // Set the generated primary key value as FK

                    // Establecer valores, permitiendo valores nulos
                    setNullableString(stmtTP, 3, pago.getTPinscripcion());
                    setNullableString(stmtTP, 4, pago.getTPpaquete_de_libros());
                    setNullableInt(stmtTP, 5, pago.getTPpaquete_de_uniforme());
                    setNullableString(stmtTP, 6, pago.getTPexamen());
                    setNullableString(stmtTP, 7, pago.getTPmensualidad());
                    setNullableInt(stmtTP, 8, pago.getTPevento());
                    setNullableString(stmtTP, 9, pago.getTPpaquete_de_material());

                    stmtTP.executeUpdate();
                } else {
                    throw new SQLException("No se pudo obtener el ID generado para el pago");
                }

                conn.commit(); // Confirmar la transacción

            } catch (SQLException e) {
                conn.rollback(); // Cancelar la transacción
                System.err.println("Error al registrar el pago: " + e.getMessage());
                throw e;
            }
        }
    }

    private void setNullableString(PreparedStatement stmt, int index, String value) throws SQLException {
        if (value != null) {
            stmt.setString(index, value);
        } else {
            stmt.setNull(index, Types.VARCHAR);
        }
    }

    private void setNullableInt(PreparedStatement stmt, int index, int value) throws SQLException {
        if (value != 0) {
            stmt.setInt(index, value);
        } else {
            stmt.setNull(index, Types.INTEGER);
        }
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

    // Actualizacion de datos
    public void actualizarPago(Pago pago) throws SQLException {
        String sql = "UPDATE pago SET fechaPago = ?, monto = ?, nivel_educativo = ?, periodo = ?, alumno = ? WHERE referencia = ?";
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, pago.getReferencia());
            stmt.setDate(2, Date.valueOf(pago.getFecha()));
            stmt.setDouble(3, pago.getMonto());
            stmt.setString(4, pago.getNivel_educativo());
            stmt.setInt(5, pago.getPeriodo());
            stmt.setString(6, pago.getAlumno());
            stmt.executeUpdate();
        }
    }

    // Eliminar datos
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

    // Leer los datos
    public static Pago ConsultarPago(String referencia) throws SQLException {
        String sql = "SELECT " +
                "    CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) as Alumno," +
                "    a.matricula as Matricula," +
                "    DATE_FORMAT(p.fechaPago, '%d-%m-%y') as Fecha_de_Pago," +
                "    ROUND(p.monto, 2) as Monto," +
                "    p.referencia as Referencia," +
                "    CASE " +
                "        WHEN tp.inscripcion IS NOT NULL THEN 'Inscripcion'" +
                "        WHEN tp.paquete_de_libros IS NOT NULL THEN 'Paquete de Libros'" +
                "        WHEN tp.paquete_de_uniforme IS NOT NULL THEN 'Paquete de Uniforme'" +
                "        WHEN tp.examen IS NOT NULL THEN 'Examen'" +
                "        WHEN tp.mensualidad IS NOT NULL THEN 'Mensualidad'" +
                "        WHEN tp.evento IS NOT NULL THEN 'Evento'" +
                "        WHEN tp.paquete_de_material IS NOT NULL THEN 'Paquete de Material'" +
                "        WHEN tp.mantenimiento IS NOT NULL THEN 'Mantenimiento'" +
                "        ELSE 'Desconocido'" +
                "    END as Tipo_de_Pago," +
                "    tp.descripcion as Descripcion," +
                "    p.estado as Estado " +
                "FROM pago as p " +
                "INNER JOIN tipo_de_pago as tp ON tp.pago = p.referencia " +
                "INNER JOIN alumno as a on p.alumno = a.matricula " +
                "WHERE p.referencia = ? " +
                "  AND (" +
                "        tp.inscripcion IS NOT NULL OR " +
                "        tp.paquete_de_libros IS NOT NULL OR " +
                "        tp.paquete_de_uniforme IS NOT NULL OR " +
                "        tp.examen IS NOT NULL OR " +
                "        tp.mensualidad IS NOT NULL OR " +
                "        tp.evento IS NOT NULL OR " +
                "        tp.paquete_de_material IS NOT NULL OR " +
                "        tp.mantenimiento IS NOT NULL" +
                "  ) ORDER BY fechaPago;";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, referencia);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Pago pago = new Pago(
                            // constructor
                            rs.getString("Referencia"),
                            rs.getString("Fecha_de_Pago"),
                            rs.getString("Matricula"),
                            rs.getDouble("Monto"),
                            rs.getString("Tipo_de_Pago"),
                            rs.getString("Descripcion"),
                            rs.getString("Estado"));

                    System.out.println("╔═══════════════════════════════════════════════════════════════╗");
                    System.out.println("║                         INFORMACION PAGO                      ║");
                    System.out.println("╚═══════════════════════════════════════════════════════════════╝");
                    System.out.println("┌───────────────────────────────────────────────────────────────┐");
                    System.out.printf("│ %-18s: %-41s │\n", "Referencia de pago", rs.getString("Referencia"));
                    System.out.printf("│ %-18s: %-41s │\n", "Fecha de Pago", rs.getString("Fecha_de_Pago"));
                    System.out.printf("│ %-18s: %-41s │\n", "Alumno", rs.getString("Alumno"));
                    System.out.printf("│ %-18s: %-41s │\n", "Matrícula", rs.getString("Matricula"));
                    System.out.printf("│ %-18s: %-41s │\n", "Monto", rs.getDouble("Monto"));
                    System.out.printf("│ %-18s: %-41s │\n", "Tipo de Pago", rs.getString("Tipo_de_Pago"));
                    System.out.printf("│ %-18s: %-41s │\n", "Descripción", rs.getString("Descripcion"));
                    System.out.printf("│ %-18s: %-41s │\n", "Estado", rs.getString("Estado"));
                    System.out.println("└───────────────────────────────────────────────────────────────┘");

                    return pago;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al consultar el pago: " + e.getMessage());
            throw e;
        }
        return null; // No se encontró el pago
    }

    public static void ConsultarPagoAlumno(String matricula) throws SQLException {
        String sql = "SELECT " +
                "    CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) as Alumno, " +
                "    a.matricula as Matricula, " +
                "    DATE_FORMAT(p.fechaPago, '%d-%m-%y') as Fecha_de_Pago, " +
                "    ROUND(p.monto, 2) as Monto, " +
                "    p.referencia as Referencia, " +
                "    CASE " +
                "        WHEN tp.inscripcion IS NOT NULL THEN 'Inscripcion' " +
                "        WHEN tp.paquete_de_libros IS NOT NULL THEN 'Paquete de Libros' " +
                "        WHEN tp.paquete_de_uniforme IS NOT NULL THEN 'Paquete de Uniforme' " +
                "        WHEN tp.examen IS NOT NULL THEN 'Examen' " +
                "        WHEN tp.mensualidad IS NOT NULL THEN 'Mensualidad' " +
                "        WHEN tp.evento IS NOT NULL THEN 'Evento' " +
                "        WHEN tp.paquete_de_material IS NOT NULL THEN 'Paquete de Material' " +
                "        WHEN tp.mantenimiento IS NOT NULL THEN 'Mantenimiento' " +
                "        ELSE 'Desconocido' " +
                "    END as Tipo_de_Pago, " +
                "    tp.descripcion as Descripcion, " +
                "    p.estado as Estado " +
                "FROM pago as p " +
                "INNER JOIN tipo_de_pago as tp ON tp.pago = p.numero " +
                "INNER JOIN alumno as a on p.alumno = a.matricula " +
                "WHERE a.matricula = ? " +
                "  AND (" +
                "        tp.inscripcion IS NOT NULL OR " +
                "        tp.paquete_de_libros IS NOT NULL OR " +
                "        tp.paquete_de_uniforme IS NOT NULL OR " +
                "        tp.examen IS NOT NULL OR " +
                "        tp.mensualidad IS NOT NULL OR " +
                "        tp.evento IS NOT NULL OR " +
                "        tp.paquete_de_material IS NOT NULL OR " +
                "        tp.mantenimiento IS NOT NULL" +
                "  ) ORDER BY p.fechaPago";
        List<Pago> pagos = new ArrayList<>();

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, matricula);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Pago pago = new Pago(
                            rs.getString("Referencia"),
                            rs.getString("Fecha_de_Pago"),
                            rs.getString("Matricula"),
                            rs.getDouble("Monto"),
                            rs.getString("Tipo_de_Pago"),
                            rs.getString("Descripcion"),
                            rs.getString("Estado"));

                    pagos.add(pago);

                    System.out.println("╔═══════════════════════════════════════════════════════════════╗");
                    System.out.println("║                       INFORMACION PAGO                        ║");
                    System.out.println("╚═══════════════════════════════════════════════════════════════╝");
                    System.out.println("┌───────────────────────────────────────────────────────────────┐");
                    System.out.printf("│ %-18s: %-41s │\n", "Referencia de pago", rs.getString("Referencia"));
                    System.out.printf("│ %-18s: %-41s │\n", "Fecha de Pago", rs.getString("Fecha_de_Pago"));
                    System.out.printf("│ %-18s: %-41s │\n", "Alumno", rs.getString("Alumno"));
                    System.out.printf("│ %-18s: %-41s │\n", "Matrícula", rs.getString("Matricula"));
                    System.out.printf("│ %-18s: %-41s │\n", "Monto", rs.getDouble("Monto"));
                    System.out.printf("│ %-18s: %-41s │\n", "Tipo de Pago", rs.getString("Tipo_de_Pago"));
                    System.out.printf("│ %-18s: %-41s │\n", "Descripción", rs.getString("Descripcion"));
                    System.out.printf("│ %-18s: %-41s │\n", "Estado", rs.getString("Estado"));
                    System.out.println("└───────────────────────────────────────────────────────────────┘");
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al consultar el pago: " + e.getMessage());
            throw e;
        }
    }
    public static void consultarPagosPendientes() throws SQLException {
        String sql = "SELECT " +
                "    CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) as Alumno, " +
                "    a.matricula as Matricula, " +
                "    DATE_FORMAT(p.fechaPago, '%d-%m-%y') as Fecha_de_Pago, " +
                "    ROUND(p.monto, 2) as Monto, " +
                "    p.referencia as Referencia, " +
                "    CASE " +
                "        WHEN tp.inscripcion IS NOT NULL THEN 'Inscripcion' " +
                "        WHEN tp.paquete_de_libros IS NOT NULL THEN 'Paquete de Libros' " +
                "        WHEN tp.paquete_de_uniforme IS NOT NULL THEN 'Paquete de Uniforme' " +
                "        WHEN tp.examen IS NOT NULL THEN 'Examen' " +
                "        WHEN tp.mensualidad IS NOT NULL THEN 'Mensualidad' " +
                "        WHEN tp.evento IS NOT NULL THEN 'Evento' " +
                "        WHEN tp.paquete_de_material IS NOT NULL THEN 'Paquete de Material' " +
                "        WHEN tp.mantenimiento IS NOT NULL THEN 'Mantenimiento' " +
                "        ELSE 'Desconocido' " +
                "    END as Tipo_de_Pago, " +
                "    tp.descripcion as Descripcion, " +
                "    p.estado as Estado " +
                "FROM pago as p " +
                "INNER JOIN tipo_de_pago as tp ON tp.pago = p.numero " +
                "INNER JOIN alumno as a on p.alumno = a.matricula " +
                "WHERE p.estado = 'pendiente' " +
                "  AND (" +
                "        tp.inscripcion IS NOT NULL OR " +
                "        tp.paquete_de_libros IS NOT NULL OR " +
                "        tp.paquete_de_uniforme IS NOT NULL OR " +
                "        tp.examen IS NOT NULL OR " +
                "        tp.mensualidad IS NOT NULL OR " +
                "        tp.evento IS NOT NULL OR " +
                "        tp.paquete_de_material IS NOT NULL OR " +
                "        tp.mantenimiento IS NOT NULL" +
                "  ) ORDER BY p.fechaPago";
        
        List<Pago> pagos = new ArrayList<>();
        int contadorPagosPendientes = 0;
    
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
    
            while (rs.next()) {
                Pago pago = new Pago(
                        rs.getString("Referencia"),
                        rs.getString("Fecha_de_Pago"),
                        rs.getString("Matricula"),
                        rs.getDouble("Monto"),
                        rs.getString("Tipo_de_Pago"),
                        rs.getString("Descripcion"),
                        rs.getString("Estado"));
    
                pagos.add(pago);
                contadorPagosPendientes++;
    
                System.out.println("╔═══════════════════════════════════════════════════════════════╗");
                System.out.println("║                       INFORMACION PAGO                        ║");
                System.out.println("╚═══════════════════════════════════════════════════════════════╝");
                System.out.println("┌───────────────────────────────────────────────────────────────┐");
                System.out.printf("│ %-18s: %-41s │\n", "Referencia de pago", rs.getString("Referencia"));
                System.out.printf("│ %-18s: %-41s │\n", "Fecha de Pago", rs.getString("Fecha_de_Pago"));
                System.out.printf("│ %-18s: %-41s │\n", "Alumno", rs.getString("Alumno"));
                System.out.printf("│ %-18s: %-41s │\n", "Matrícula", rs.getString("Matricula"));
                System.out.printf("│ %-18s: %-41s │\n", "Monto", rs.getDouble("Monto"));
                System.out.printf("│ %-18s: %-41s │\n", "Tipo de Pago", rs.getString("Tipo_de_Pago"));
                System.out.printf("│ %-18s: %-41s │\n", "Descripción", rs.getString("Descripcion"));
                System.out.printf("│ %-18s: %-41s │\n", "Estado", rs.getString("Estado"));
                System.out.println("└───────────────────────────────────────────────────────────────┘");
            }
    
            if (contadorPagosPendientes == 0) {
                System.out.println("No hay pagos pendientes.");
            } else {
                System.out.println("───────────────────────────────────────────────────────────────");
                System.out.printf("Total de pagos pendientes: %d\n", contadorPagosPendientes);
            }
            
        } catch (SQLException e) {
            System.err.println("Error al consultar los pagos: " + e.getMessage());
            throw e;
        }
    }

    public static String pagarInscripcion(String matricula, int grado) throws SQLException {
        PagoDAO pagoDAO = new PagoDAO();
        // ----------------------------
        String tpInscripcion = null;
        String tpPaqueteDeLibros = null;
        int tpPaqueteDeUniforme = 0;
        String tpExamen = null;
        String tpMensualidad = null;
        int tpEvento = 0;
        String tpPaqueteDeMaterial = null;
        // ----------------------------
        LocalDate fechaActual = LocalDate.now();
        String fechaPago = fechaActual.toString();
        double monto;
        String nivel_educativo;
        int periodo = 4;
        String alumno = matricula;
        String tpDescripcion;
        String referencia = generarReferencia();

        // Asignar valores según el tipo de pago seleccionado
        switch (grado) {
            case 1:
                monto = 500;
                nivel_educativo = "KIND";
                tpDescripcion = "Pago de Inscripción 1ro de Kinder";
                tpInscripcion = "INS_KIND1_24-25";
                break;
            case 2:
                monto = 550;
                nivel_educativo = "KIND";
                tpDescripcion = "Pago de Inscripción 2do de Kinder";
                tpInscripcion = "INS_KIND2_24-25";
                break;
            case 3:
                monto = 600;
                nivel_educativo = "KIND";
                tpDescripcion = "Pago de Inscripción 3ro de Kinder";
                tpInscripcion = "INS_KIND3_24-25";
                break;
            case 4:
                monto = 650;
                nivel_educativo = "PRIM";
                tpDescripcion = "Pago de Inscripción 1ro de Primaria";
                tpInscripcion = "INS_PRIM1_24-25";
                break;
            case 5:
                monto = 700;
                nivel_educativo = "PRIM";
                tpDescripcion = "Pago de Inscripción 2do de Primaria";
                tpInscripcion = "INS_PRIM2_24-25";
                break;
            case 6:
                monto = 750;
                nivel_educativo = "PRIM";
                tpDescripcion = "Pago de Inscripción 3ro de Primaria";
                tpInscripcion = "INS_PRIM3_24-25";
                break;
            case 7:
                monto = 650;
                nivel_educativo = "PRIM";
                tpDescripcion = "Pago de Inscripción 4to de Primaria";
                tpInscripcion = "INS_PRIM4_24-25";
                break;
            case 8:
                monto = 700;
                nivel_educativo = "PRIM";
                tpDescripcion = "Pago de Inscripción 5to de Primaria";
                tpInscripcion = "INS_PRIM5_24-25";
                break;
            case 9:
                monto = 750;
                nivel_educativo = "PRIM";
                tpDescripcion = "Pago de Inscripción 6to de Primaria";
                tpInscripcion = "INS_PRIM6_24-25";
                break;
            case 10:
                monto = 650;
                nivel_educativo = "SECU";
                tpDescripcion = "Pago de Inscripción 1ro de Secundaria";
                tpInscripcion = "INS_SECU1_24-25";
                break;
            case 11:
                monto = 700;
                nivel_educativo = "SECU";
                tpDescripcion = "Pago de Inscripción 2do de Secundaria";
                tpInscripcion = "INS_SECU2_24-25";
                break;
            case 12:
                monto = 750;
                nivel_educativo = "SECU";
                tpDescripcion = "Pago de Inscripción 3ro de Secundaria";
                tpInscripcion = "INS_SECU3_24-25";
                break;
            default:
                System.out.println("Error en el proceso");
                return null;
        }

        Pago pago = new Pago(referencia, fechaPago, nivel_educativo, periodo, alumno, monto, tpPaqueteDeMaterial,
                tpEvento, tpPaqueteDeMaterial, tpPaqueteDeMaterial, tpPaqueteDeMaterial, tpEvento, tpPaqueteDeMaterial,
                tpPaqueteDeMaterial, tpEvento, tpPaqueteDeMaterial);
        pago.setTPdescripcion(tpDescripcion);
        pago.setTPinscripcion(tpInscripcion);
        pago.setTPpaquete_de_libros(tpPaqueteDeLibros);
        pago.setTPpaquete_de_uniforme(tpPaqueteDeUniforme);
        pago.setTPexamen(tpExamen);
        pago.setTPmensualidad(tpMensualidad);
        pago.setTPevento(tpEvento);
        pago.setTPpaquete_de_material(tpPaqueteDeMaterial);
        pago.setEstado("pendiente");

        try {
            pagoDAO.registrarPago(pago);
            System.out.println("Pago registrado exitosamente, su referencia es: " + referencia);

        } catch (SQLException e) {
            System.err.println("Error al registrar el pago: " + e.getMessage());
        }
        return referencia;
    }

    

    public static String pagarUniforme(String matricula, int paqUniforme, String nivelE) throws SQLException {
        PagoDAO pagoDAO = new PagoDAO();
        // ----------------------------
        String tpInscripcion = null;
        String tpPaqueteDeLibros = null;
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
        String referencia = generarReferencia();
    
        // Asignar valores según el tipo de pago seleccionado
        switch (paqUniforme) {
            case 1:
                monto = 475.75;
                tpDescripcion = "Paquete de uniforme M S";
                tpPaqueteDeUniforme = paqUniforme;
                break;
            case 2:
                monto = 475.75;
                tpDescripcion = "Paquete de uniforme M M";
                tpPaqueteDeUniforme = paqUniforme;
                break;
            case 3:
                monto = 475.75;
                tpDescripcion = "Paquete de uniforme M L";
                tpPaqueteDeUniforme = paqUniforme;
                break;
            case 4:
                monto = 475.75;
                tpDescripcion = "Paquete de uniforme F S";
                tpPaqueteDeUniforme = paqUniforme;
                break;
            case 5:
                monto = 475.75;
                tpDescripcion = "Paquete de uniforme F M";
                tpPaqueteDeUniforme = paqUniforme;
                break;
            case 6:
                monto = 475.75;
                tpDescripcion = "Paquete de uniforme F L";
                tpPaqueteDeUniforme = paqUniforme;
                break;
            default:
                System.out.println("Error en el proceso");
                return null;
        }
    
        // Crear el objeto Pago
        Pago pago = new Pago(referencia, fechaPago, nivel_educativo, periodo, alumno, monto, tpPaqueteDeMaterial,
                tpEvento, tpPaqueteDeMaterial, tpPaqueteDeMaterial, tpPaqueteDeMaterial, tpEvento, tpPaqueteDeMaterial,
                tpPaqueteDeMaterial, tpEvento, tpPaqueteDeMaterial);
    
        // Asignar detalles del pago
        pago.setTPdescripcion(tpDescripcion);
        pago.setTPinscripcion(tpInscripcion);
        pago.setTPpaquete_de_libros(tpPaqueteDeLibros);
        pago.setTPpaquete_de_uniforme(tpPaqueteDeUniforme);
        pago.setTPexamen(tpExamen);
        pago.setTPmensualidad(tpMensualidad);
        pago.setTPevento(tpEvento);
        pago.setTPpaquete_de_material(tpPaqueteDeMaterial);
        pago.setEstado("pendiente");
    
        // Registrar el pago
        try {
            pagoDAO.registrarPago(pago);
            System.out.println("Pago registrado exitosamente, su referencia es: " + referencia);
        } catch (SQLException e) {
            System.err.println("Error al registrar el pago: " + e.getMessage());
        }
        return referencia;
    }

    public static void consultarInscripcionesPagadas(String matricula) throws SQLException {
        // Consulta 4
        String sql = "SELECT a.matricula as Matricula, " +
                "CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) as Alumno, " +
                "DATE_FORMAT(pe.añoInicio, '%d-%m-%y' ) as Inicio_del_Periodo_Escolar, " +
                "DATE_FORMAT(pe.añoFin, '%d-%m-%y' ) as Final_del_Periodo_Escolar, " +
                "pe.nombre as Periodo, " +
                "g.nombre as Grupo, " +
                "g.nivel_educativo as Nivel_Educativo, " +
                "gr.nombre as Grado, " +
                "p.fechaPago as Fecha_del_Pago, " +
                "tp.descripcion as Pago " +
                "FROM alumno as a " +
                "INNER JOIN grupo_alumno as ga on ga.alumno = a.matricula " +
                "INNER JOIN grupo as g on g.numero = ga.grupo " +
                "INNER JOIN periodo as pe on pe.numero = g.periodo " +
                "inner join grado as gr on g.grado = gr.numero " +
                "inner join pago as p on p.periodo = pe.numero " +
                "inner join tipo_de_pago as tp on tp.pago = p.numero " +
                "where a.matricula = ? and tp.inscripcion is not null and p.alumno = ? " +
                "ORDER BY pe.numero;";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, matricula);
            stmt.setString(2, matricula);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    System.out.println("┌───────────────────────────────────────────────────────────────┐");
                    System.out.println("    Matricula: " + rs.getString("Matricula"));
                    System.out.println("    Alumno: " + rs.getString("Alumno"));
                    System.out.println("└───────────────────────────────────────────────────────────────┘");
                    System.out.println("┌───────────────────────────────────────────────────────────────┐");
                    System.out.println("                      INSCRIPCIONES PAGADAS ");
                    System.out.println("└───────────────────────────────────────────────────────────────┘");

                    do {
                        System.out.println("┌───────────────────────────────────────────────────────────────┐");
                        System.out.println("  PERIODO ESCOLAR: " + rs.getString("Periodo"));
                        System.out.println("  Inicio: " + rs.getString("Inicio_del_Periodo_Escolar"));
                        System.out.println("  Final: " + rs.getString("Final_del_Periodo_Escolar"));
                        System.out.println("─────────────────────────────────────────────────────────────────");
                        System.out.println("  INFORMACION ACADEMICA:");
                        System.out.println("  Grupo: " + rs.getString("Grupo"));
                        System.out.println("  Nivel Educativo: " + rs.getString("Nivel_Educativo"));
                        System.out.println("  Grado: " + rs.getString("Grado"));
                        System.out.println("─────────────────────────────────────────────────────────────────");

                        System.out.println("  INFORMACION DEL PAGO:");
                        System.out.println("  Fecha: " + rs.getString("Fecha_del_Pago"));
                        System.out.println("  Descripción: " + rs.getString("Pago"));
                        System.out.println("└───────────────────────────────────────────────────────────────┘");
                        System.out.println();
                    } while (rs.next());
                } else {
                    System.out.println("No se encontraron registros.");
                }
            }
        }
    }

    public static void consultarMensualidadesPagadas(String matricula, int periodo) throws SQLException {
        // Consulta 5
        String sql = "SELECT a.matricula as Matricula," +
                "CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) as Alumno, " +
                "DATE_FORMAT(pe.añoInicio, '%d-%m-%y' ) as Inicio_del_Periodo_Escolar, " +
                "DATE_FORMAT(pe.añoFin, '%d-%m-%y' ) as Final_del_Periodo_Escolar, " +
                "pe.nombre as Periodo, " +
                "g.nombre as Grupo, " +
                "g.nivel_educativo as Nivel_Educativo, " +
                "gr.nombre as Grado," +
                "DATE_FORMAT(p.fechaPago, '%d/%m/%Y') AS Fecha_del_Pago, " +
                "tp.descripcion as Pago " +
                "FROM alumno as a " +
                "INNER JOIN grupo_alumno as ga on ga.alumno = a.matricula " +
                "INNER JOIN grupo as g on g.numero = ga.grupo " +
                "INNER JOIN periodo as pe on pe.numero = g.periodo " +
                "inner join grado as gr on g.grado = gr.numero " +
                "inner join pago as p on p.periodo = pe.numero " +
                "inner join tipo_de_pago as tp on tp.pago = p.numero " +
                "where a.matricula = ? and tp.mensualidad is not null and p.alumno = ? and pe.numero = ? " +
                "ORDER BY a.matricula; ";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, matricula);
            stmt.setString(2, matricula);
            stmt.setInt(3, periodo);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    System.out.println("┌───────────────────────────────────────────────────────────────┐");
                    System.out.println("    Matricula: " + rs.getString("Matricula"));
                    System.out.println("    Alumno: " + rs.getString("Alumno"));
                    System.out.println("└───────────────────────────────────────────────────────────────┘");
                    System.out.println("┌───────────────────────────────────────────────────────────────┐");
                    System.out.println("                      MENSUALIDADES PAGADAS ");
                    System.out.println("└───────────────────────────────────────────────────────────────┘");

                    do {
                        System.out.println("┌───────────────────────────────────────────────────────────────┐");
                        System.out.println("  PERIODO ESCOLAR: " + rs.getString("Periodo"));
                        System.out.println("  Inicio: " + rs.getString("Inicio_del_Periodo_Escolar"));
                        System.out.println("  Final: " + rs.getString("Final_del_Periodo_Escolar"));
                        System.out.println("  INFORMACION ACADEMICA:");
                        System.out.println("  Grupo: " + rs.getString("Grupo"));
                        System.out.println("  Nivel Educativo: " + rs.getString("Nivel_Educativo"));
                        System.out.println("  Grado: " + rs.getString("Grado"));
                        System.out.println("  INFORMACION DEL PAGO:");
                        System.out.println("  Fecha: " + rs.getString("Fecha_del_Pago"));
                        System.out.println("  Descripción: " + rs.getString("Pago"));
                        System.out.println("└───────────────────────────────────────────────────────────────┘");
                        System.out.println();
                    } while (rs.next());
                } else {
                    System.out.println("No se encontraron registros.");
                }
            }
        }
    }

    public static void consultarTotalPagos(int periodo, String nivel_educativo) throws SQLException {
        // Consulta 10

        String sql = "SELECT " +
                "DATE_FORMAT(pe.añoInicio, '%d/%m/%Y') AS Fecha_de_Inicio_del_Periodo_Escolar, " +
                "DATE_FORMAT(pe.añoFin, '%d/%m/%Y') AS Fecha_Final_del_Periodo_Escolar, " +
                "ne.nombre AS Nivel_Escolar, " +
                "COUNT(*) AS Total_de_Pagos " +
                "FROM pago AS pa " +
                "INNER JOIN periodo AS pe ON pe.numero = pa.periodo " +
                "INNER JOIN nivel_educativo AS ne ON ne.codigo = pa.nivel_educativo " +
                "WHERE pa.periodo = ? AND pa.nivel_educativo = ? AND pa.estado = ? " +
                "GROUP BY pe.añoInicio, pe.añoFin, ne.nombre;";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, periodo);
            stmt.setString(2, nivel_educativo);
            stmt.setString(3, "confirmado");

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    System.out.println("┌───────────────────────────────────────────────────────────────┐");
                    System.out.println("                      TOTAL DE PAGOS REALIZADOS ");
                    System.out.println("└───────────────────────────────────────────────────────────────┘");

                    do {
                        System.out.println("┌───────────────────────────────────────────────────────────────┐");
                        System.out.println("  Inicio: " + rs.getString("Fecha_de_Inicio_del_Periodo_Escolar"));
                        System.out.println("  Final: " + rs.getString("Fecha_Final_del_Periodo_Escolar"));
                        System.out.println("  Nivel Educativo: " + rs.getString("Nivel_Escolar"));
                        System.out.println("  Total de Pagos: " + rs.getString("Total_de_Pagos"));
                        System.out.println("└───────────────────────────────────────────────────────────────┘");
                        System.out.println();
                    } while (rs.next());
                } else {
                    System.out.println("No se encontraron registros.");
                }
            }
        }
    }

    public static void precioUtiles(int periodo, String nivel_educativo) throws SQLException {
        // consulta 8
        String sql = "SELECT DATE_FORMAT(pe.añoInicio, '%d-%m-%y' ) as Fecha_de_Inicio_del_Periodo_Escolar, " +
                "DATE_FORMAT(pe.añoFin, '%d-%m-%y' ) as Fecha_Final_del_Periodo_Escolar, " +
                "ne.nombre as Nivel, " +
                "pm.nombre as Descripcion, " +
                "pm.precio as Costo " +
                "FROM paquete_de_material as pm " +
                "inner join paq_periodo as pp on pp.paquete_de_material = pm.codigo " +
                "inner join periodo as pe on pe.numero = pp.periodo " +
                "inner join grado as g on pm.grado = g.numero " +
                "inner join nivel_educativo as ne on ne.codigo = g.nivel_educativo " +
                "where pe.numero = ? and ne.codigo = ?; ";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, periodo);
            stmt.setString(2, nivel_educativo);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    System.out.println("┌───────────────────────────────────────────────────────────────┐");
                    System.out.println("                      PRECIOS DE LOS UTILES ESCOLARES ");
                    System.out.println("└───────────────────────────────────────────────────────────────┘");

                    do {
                        System.out.println("┌───────────────────────────────────────────────────────────────┐");
                        System.out.println(
                                "  Inicio del Periodo: " + rs.getString("Fecha_de_Inicio_del_Periodo_Escolar"));
                        System.out.println("  Final del Periodo: " + rs.getString("Fecha_Final_del_Periodo_Escolar"));
                        System.out.println("  Nivel Educativo: " + rs.getString("Nivel"));
                        System.out.println("  Descripcion: " + rs.getString("Descripcion"));
                        System.out.println("  Costo: " + rs.getString("Costo"));
                        System.out.println("└───────────────────────────────────────────────────────────────┘");
                        System.out.println();
                    } while (rs.next());
                } else {
                    System.out.println("No se encontraron registros.");
                }
            }
        }
    }

    public static void precioUniformes(int periodo, String nivel_educativo) throws SQLException {
        //consulta 9
        String sql = "SELECT DATE_FORMAT(pe.añoInicio, '%d-%m-%y' ) as Fecha_de_Inicio_del_Periodo_Escolar, " +
                "DATE_FORMAT(pe.añoFin, '%d-%m-%y' ) as Fecha_Final_del_Periodo_Escolar, " +
                "ne.nombre as Nivel, " +
                "g.nombre as Grado, " +
                "tu.descripcion as Descripcion, " +
                "tu.precio as Precio " +
                "FROM tipo_de_uniforme as tu " +
                "inner join uni_periodo as up on up.tipo_de_uniforme = tu.numero " +
                "inner join periodo as pe on pe.numero = up.periodo " +
                "inner join nivel_educativo as ne on ne.codigo = tu.nivel_educativo " +
                "inner join grado as g on g.nivel_educativo = ne.codigo " +
                "where pe.numero = ? and ne.codigo = ?";
    
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
    
            stmt.setInt(1, periodo);
            stmt.setString(2, nivel_educativo);
    
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    System.out.println("┌───────────────────────────────────────────────────────────────┐");
                    System.out.println("                      PRECIO DE LOS UNIFORMES ");
                    System.out.println("└───────────────────────────────────────────────────────────────┘");
    
                    do {
                        System.out.println("┌───────────────────────────────────────────────────────────────┐");
                        System.out.println("  Inicio del Periodo: " + rs.getString("Fecha_de_Inicio_del_Periodo_Escolar"));
                        System.out.println("  Final del Periodo: " + rs.getString("Fecha_Final_del_Periodo_Escolar"));
                        System.out.println("  Nivel Educativo: " + rs.getString("Nivel"));
                        System.out.println("  Grado: " + rs.getString("Grado"));
                        System.out.println("  Descripcion: " + rs.getString("Descripcion"));
                        System.out.println("  Costo: " + rs.getString("Precio"));
                        System.out.println("└───────────────────────────────────────────────────────────────┘");
                        System.out.println();
                    } while (rs.next());
                } else {
                    System.out.println("No se encontraron registros.");
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al consultar los precios de los uniformes: " + e.getMessage());
            throw e;
        }
    }
    

    public static void consultarCostoMantenimiento(int periodo) {
        String sql = "SELECT " +
                "DATE_FORMAT(p.añoInicio, '%d/%m/%Y') AS Fecha_de_inicio_del_periodo_escolar, " +
                "DATE_FORMAT(p.añoFin, '%d/%m/%Y') AS Fecha_final_del_periodo_escolar, " +
                "m.descripcion AS Concepto_del_mantenimiento, " +
                "m.precio AS Costo, " +
                "NULL AS Total_del_periodo " +
                "FROM " +
                "mantenimiento AS m " +
                "INNER JOIN man_ped AS mp ON mp.mantenimiento = m.codigo " +
                "INNER JOIN periodo AS p ON mp.periodo = p.numero " +
                "WHERE " +
                "p.numero = ? " +

                "UNION ALL " +

                "SELECT " +
                "NULL AS Fecha_de_inicio_del_periodo_escolar, " +
                "NULL AS Fecha_final_del_periodo_escolar, " +
                "'Total' AS Concepto_del_mantenimiento, " +
                "NULL AS Costo, " +
                "ROUND(SUM(m.precio), 2) AS Total_del_periodo " +
                "FROM " +
                "mantenimiento AS m " +
                "INNER JOIN man_ped AS mp ON mp.mantenimiento = m.codigo " +
                "INNER JOIN periodo AS p ON mp.periodo = p.numero " +
                "WHERE " +
                "p.numero = ?;";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, periodo);
            stmt.setInt(2, periodo);

            try (ResultSet rs = stmt.executeQuery()) {
                boolean hasData = false;

                while (rs.next()) {
                    if (rs.getString("Concepto_del_mantenimiento").equals("Total")) {

                        System.out.println("┌───────────────────────────────────────────────────────────────┐");
                        System.out.println("  " + rs.getString("Concepto_del_mantenimiento") + ": "
                                + rs.getString("Total_del_periodo"));
                        System.out.println("└───────────────────────────────────────────────────────────────┘");
                    } else {

                        System.out.println("┌───────────────────────────────────────────────────────────────┐");
                        System.out.println("  Inicio: " + rs.getString("Fecha_de_inicio_del_periodo_escolar"));
                        System.out.println("  Final: " + rs.getString("Fecha_final_del_periodo_escolar"));
                        System.out.println("  Concepto: " + rs.getString("Concepto_del_mantenimiento"));
                        System.out.println("  Costo: " + rs.getString("Costo"));
                        System.out.println("└───────────────────────────────────────────────────────────────┘");
                        hasData = true;
                    }
                }

                if (!hasData) {
                    System.out.println("No se encontraron registros.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
