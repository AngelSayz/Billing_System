package Persistencia;

import java.util.Scanner;
import Logica.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.time.LocalDate;

public class PagoDAO {

    public void registrarPago(Pago pago) throws SQLException {
        String sqlP = "INSERT INTO pago (referencia, fechaPago, monto, nivel_educativo, periodo, alumno, estado) VALUES (?, ?, ?, ?, ?, ?,?)";
        String sqlTP = "INSERT INTO tipo_de_pago (descripcion, pago, inscripcion, paquete_de_uniforme, examen, mensualidad, evento, paquete_de_material) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

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
                    setNullableInt(stmtTP, 4, pago.getTPpaquete_de_uniforme());
                    setNullableString(stmtTP, 5, pago.getTPexamen());
                    setNullableString(stmtTP, 6, pago.getTPmensualidad());
                    setNullableInt(stmtTP, 7, pago.getTPevento());
                    setNullableString(stmtTP, 8, pago.getTPpaquete_de_material());

                    stmtTP.executeUpdate();
                    LocalDate fechaValido = LocalDate.now().plusDays(10);
System.out.println("╔═══════════════════════════════════════════════════════════════╗");
System.out.println("                                                       PAYTECH");
System.out.println("                                               Made by CafCATS");
System.out.println("---------------------------Contacto----------------------------");
System.out.println();
System.out.println("  Email: paytech@cafcats.com");
System.out.println("  Num. Telefonico: (664) 123-9212");
System.out.println("  Pagina Web: https://cafcats/paytech.com");
System.out.println();
System.out.println("--------------------Informacion del alumno---------------------");
System.out.println(" " + AlumnoDAO.obtenerNombrePorMatricula(pago.getAlumno()));
System.out.println(" Matricula: " + pago.getAlumno());
System.out.println(" Nivel Educativo: " + pago.getNivel_educativo());
System.out.println(" Periodo: ");
System.out.println("--------------------Informacion del pago-----------------------");
System.out.println();
System.out.println("  Num. Pago: " + pagoId);
System.out.println("  Concepto de pago: " + pago.getTPdescripcion());
System.out.println("  Fecha de pago: " + pago.getFecha());
System.out.println("  Valido hasta: " + fechaValido);
System.out.println("  Num. Referencia: " + pago.getReferencia());
System.out.println("  Institucion bancaria: Bancomer");
System.out.println("  Convenio: 001479334");
System.out.println("  Cuenta CLABE: 0129140002014793346");
System.out.println();

System.out.println("╚═══════════════════════════════════════════════════════════════╝");
System.out.println("--------Instrucciones para realizar el pago--------");
System.out.println();
System.out.println("**Proceso de pago:**");
System.out.println("  En línea:");
System.out.println("    1. Ingresa al portal de tu banco en línea.");
System.out.println("    2. Selecciona la opción para realizar pagos.");
System.out.println("    3. Introduce la cuenta CLABE proporcionada y el convenio.");
System.out.println("    4. Ingresa el monto exacto a pagar.");
System.out.println("    5. Introduce el número de referencia " + pago.getReferencia() + " en el campo correspondiente.");
System.out.println("    6. Confirma la transacción.");
System.out.println("  En sucursal bancaria:");
System.out.println("    1. Visita una sucursal de Bancomer.");
System.out.println("    2. Completa una ficha de depósito con los datos bancarios proporcionados.");
System.out.println("    3. Entrega la ficha y el monto a pagar al cajero.");
System.out.println("    4. Guarda el comprobante de pago.");
System.out.println();
System.out.println("**Tiempo de reflejo:**");
System.out.println("  - Los pagos realizados en línea se reflejan generalmente en un plazo de 24 a 48 horas.");
System.out.println("  - Los pagos realizados en sucursal bancaria pueden tardar hasta 72 horas en reflejarse.");
System.out.println();
System.out.println("**Confirmación del pago:**");
System.out.println("  - Recibirás un correo electrónico de confirmación una vez que el pago se haya registrado correctamente.");
System.out.println("  - Puedes verificar el estado de tu pago accediendo a tu cuenta en el sistema de pagos de la escuela.");
System.out.println();
System.out.println("**Asistencia y problemas:**");
System.out.println("  - Personal de la escuela: Si tienes algún problema o duda respecto al pago, puedes contactar al personal de administración de la escuela.");
System.out.println("  - Banco: Para problemas relacionados con la transferencia bancaria, puedes acudir a tu sucursal de Bancomer más cercana o llamar a su servicio de atención al cliente.");
System.out.println("  - Equipo de desarrollo: Para problemas relacionados al funcionamiento del software, favor de comunicarse al equipo");
System.out.println("    - Correo electrónico: paytech@cafcats.com");
System.out.println("    - Teléfono: (664) 123-9212");

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
    public static void actualizarPago(String referencia, String nuevoEstado) throws SQLException {
        // Verificar que el nuevo estado sea válido
        if (!nuevoEstado.equals("pendiente") && !nuevoEstado.equals("confirmado") && !nuevoEstado.equals("cancelado")) {
            throw new IllegalArgumentException("Estado no válido: " + nuevoEstado);
        }

        String sql = "UPDATE pago SET estado = ? WHERE referencia = ?";

        try (Connection connection = DatabaseConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, nuevoEstado);
            statement.setString(2, referencia);

            // Ejecutar la actualización
            int rowsUpdated = statement.executeUpdate();

            // Verificar si se actualizó alguna fila
            if (rowsUpdated > 0) {
                System.out.println(
                        "El estado del pago con referencia " + referencia + " ha sido actualizado a " + nuevoEstado);
            } else {
                System.out.println("No se encontró ningún pago con la referencia " + referencia);
            }
        } catch (SQLException e) {
            // Manejo de errores de SQL
            e.printStackTrace();
            throw new SQLException("Error al actualizar el estado del pago", e);
        }
    }

    // Eliminar datos
    public static void eliminarPago(String referencia) throws SQLException {
        String sqlTP = "DELETE FROM tipo_de_pago WHERE pago = (SELECT numero FROM pago WHERE referencia = ?)";
        String sqlP = "DELETE FROM pago WHERE referencia = ?";
    
        try (Connection conn = DatabaseConnection.getConnection()) {
            conn.setAutoCommit(false); // Desactiva el auto-commit para manejar transacciones manualmente
    
            try (PreparedStatement stmtTP = conn.prepareStatement(sqlTP);
                 PreparedStatement stmtP = conn.prepareStatement(sqlP)) {
    
                // Eliminar primero el registro en tipo_de_pago
                stmtTP.setString(1, referencia);
                stmtTP.executeUpdate();
    
                // Eliminar luego el registro en pago
                stmtP.setString(1, referencia);
                int rowsAffectedP = stmtP.executeUpdate();
    
                if (rowsAffectedP > 0) {
                    conn.commit(); // Si ambas eliminaciones fueron exitosas, se confirma la transacción
                    System.out.println("Pago eliminado exitosamente.");
                } else {
                    conn.rollback(); // Si no se eliminó el registro en pago, se revierte la transacción
                    System.out.println("No se encontró ningún pago con esa referencia.");
                }
            } catch (SQLException e) {
                conn.rollback(); // En caso de error, se revierte la transacción
                System.err.println("Error al eliminar el pago: " + e.getMessage());
            } finally {
                conn.setAutoCommit(true); // Reactiva el auto-commit
            }
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
        Scanner sc = new Scanner(System.in);
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
                sc.close();
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
        System.out.println("------------------------INFORMACION PAGO------------------------");
        System.out.println("Matricula: " + alumno);
        System.out.println("Alumno: " + AlumnoDAO.obtenerNombrePorMatricula(alumno));
        System.out.println("Concepto: " + tpDescripcion);
        System.out.println("Monto a pagar: " + monto);
        String respuesta = Valid.getValidString(sc, "Esta seguro de que desea continuar con el pago? (SI/NO)", 2);
        if (respuesta.equals("SI")) {

            try {
                pagoDAO.registrarPago(pago);
                System.out.println("Pago registrado exitosamente, su referencia es: " + referencia);

            } catch (SQLException e) {
                System.err.println("Error al registrar el pago: " + e.getMessage());
            }
            return referencia;
        } else {
            return null;
        }
    }

    public static String pagarUniforme(String matricula, int paqUniforme, String nivelE) throws SQLException {
        PagoDAO pagoDAO = new PagoDAO();
        Scanner sc = new Scanner(System.in);
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
                sc.close();
                return null;
        }

        // Crear el objeto Pago
        Pago pago = new Pago(referencia, fechaPago, nivel_educativo, periodo, alumno, monto, tpPaqueteDeMaterial,
                tpEvento, tpPaqueteDeMaterial, tpPaqueteDeMaterial, tpEvento, tpPaqueteDeMaterial,
                tpPaqueteDeMaterial, tpEvento, tpPaqueteDeMaterial);

        // Asignar detalles del pago
        pago.setTPdescripcion(tpDescripcion);
        pago.setTPinscripcion(tpInscripcion);
        pago.setTPpaquete_de_uniforme(tpPaqueteDeUniforme);
        pago.setTPexamen(tpExamen);
        pago.setTPmensualidad(tpMensualidad);
        pago.setTPevento(tpEvento);
        pago.setTPpaquete_de_material(tpPaqueteDeMaterial);
        pago.setEstado("pendiente");
        System.out.println("------------------------INFORMACION PAGO------------------------");
        System.out.println("Matricula: " + alumno);
        System.out.println("Alumno: " + AlumnoDAO.obtenerNombrePorMatricula(alumno));
        System.out.println("Concepto: " + tpDescripcion);
        System.out.println("Monto a pagar: " + monto);
        String respuesta = Valid.getValidString(sc, "Esta seguro de que desea continuar con el pago? (SI/NO)", 2);
        if (respuesta.equals("SI")) {
            // Registrar el pago
            try {
                pagoDAO.registrarPago(pago);
                System.out.println("Pago registrado exitosamente, su referencia es: " + referencia);
            } catch (SQLException e) {
                System.err.println("Error al registrar el pago: " + e.getMessage());
            }
            return referencia;
        } else {
            return null;
        }
    }

    public static void consultarInscripcionesPagadas(String matricula) throws SQLException {
        // Consulta 4
        String sql = "SELECT a.matricula as Matricula, " +
                "CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) as Alumno, " +
                "DATE_FORMAT(pe.añoInicio, '%d-%m-%y' ) as Inicio_del_Periodo_Escolar, " +
                "DATE_FORMAT(pe.añoFin, '%d-%m-%y' ) as Final_del_Periodo_Escolar, " +
                "pe.nombre as Periodo, " +
                "g.nombre as Grupo, " +
                "ne.nombre as Nivel_Educativo, " +
                "gr.nombre as Grado, " +
                "p.fechaPago as Fecha_del_Pago, " +
                "tp.descripcion as Pago " +
                "FROM alumno as a " +
                "INNER JOIN grupo_alumno as ga on ga.alumno = a.matricula " +
                "INNER JOIN grupo as g on g.numero = ga.grupo " +
                "INNER JOIN periodo as pe on pe.numero = g.periodo " +
                "inner join grado as gr on g.grado = gr.numero " +
                "inner join pago as p on p.periodo = pe.numero " +
                "inner join nivel_educativo as ne on ne.codigo = g.nivel_educativo " +
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
                    System.out.println("                      INSCRIPCIONES PAGADAS ");
                    System.out.println("└───────────────────────────────────────────────────────────────┘");
                    System.out.println("┌───────────────────────────────────────────────────────────────┐");
                    System.out.println("    Matricula: " + rs.getString("Matricula"));
                    System.out.println("    Alumno: " + rs.getString("Alumno"));
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
        String sql = "SELECT a.matricula as Matricula, " +
                     "CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) as Alumno, " +
                     "DATE_FORMAT(pe.añoInicio, '%d-%m-%y' ) as Inicio_del_Periodo_Escolar, " +
                     "DATE_FORMAT(pe.añoFin, '%d-%m-%y' ) as Final_del_Periodo_Escolar, " +
                     "pe.nombre as Periodo, " +
                     "g.nombre as Grupo, " +
                     "g.nivel_educativo as Nivel_Educativo, " +
                     "gr.nombre as Grado, " +
                     "DATE_FORMAT(p.fechaPago, '%d/%m/%Y') AS Fecha_del_Pago, " +
                     "tp.descripcion as Pago " +
                     "FROM alumno as a " +
                     "INNER JOIN grupo_alumno as ga on ga.alumno = a.matricula " +
                     "INNER JOIN grupo as g on g.numero = ga.grupo " +
                     "INNER JOIN periodo as pe on pe.numero = g.periodo " +
                     "INNER JOIN grado as gr on g.grado = gr.numero " +
                     "INNER JOIN pago as p on p.periodo = pe.numero " +
                     "INNER JOIN tipo_de_pago as tp on tp.pago = p.numero " +
                     "WHERE a.matricula = ? AND tp.mensualidad IS NOT NULL AND p.alumno = ? AND pe.numero = ? " +
                     "ORDER BY a.matricula;";
    
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
    
            stmt.setString(1, matricula);
            stmt.setString(2, matricula);
            stmt.setInt(3, periodo);
    
            try (ResultSet rs = stmt.executeQuery()) {
                boolean firstRow = true;
    
                if (rs.next()) {
                    System.out.println("┌───────────────────────────────────────────────────────────────┐");
                    System.out.println("    Matricula: " + rs.getString("Matricula"));
                    System.out.println("    Alumno: " + rs.getString("Alumno"));
                    System.out.println("└───────────────────────────────────────────────────────────────┘");
    
                    if (firstRow) {
                        System.out.println("┌───────────────────────────────────────────────────────────────┐");
                        System.out.println("  PERIODO ESCOLAR: " + rs.getString("Periodo"));
                        System.out.println("  Inicio: " + rs.getString("Inicio_del_Periodo_Escolar"));
                        System.out.println("  Final: " + rs.getString("Final_del_Periodo_Escolar"));
                        System.out.println("  INFORMACION ACADEMICA:");
                        System.out.println("  Grupo: " + rs.getString("Grupo"));
                        System.out.println("  Nivel Educativo: " + rs.getString("Nivel_Educativo"));
                        System.out.println("  Grado: " + rs.getString("Grado"));
                        System.out.println("└───────────────────────────────────────────────────────────────┘");
                        System.out.println();
                        firstRow = false;  // Asegura que esta información solo se imprima una vez
                    }
    
                    do {
                        System.out.println("┌───────────────────────────────────────────────────────────────┐");
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
        } catch (SQLException e) {
            System.err.println("Error al consultar las mensualidades pagadas: " + e.getMessage());
            throw e;
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
        String sql = "SELECT DATE_FORMAT(pe.añoInicio, '%d-%m-%y' ) as Fecha_de_Inicio_del_Periodo_Escolar, " +
                     "DATE_FORMAT(pe.añoFin, '%d-%m-%y' ) as Fecha_Final_del_Periodo_Escolar, " +
                     "ne.nombre as Nivel, " +
                     "pm.nombre as Descripcion, " +
                     "pm.precio as Costo " +
                     "FROM paquete_de_material as pm " +
                     "INNER JOIN paq_periodo as pp on pp.paquete_de_material = pm.codigo " +
                     "INNER JOIN periodo as pe on pe.numero = pp.periodo " +
                     "INNER JOIN grado as g on pm.grado = g.numero " +
                     "INNER JOIN nivel_educativo as ne on ne.codigo = g.nivel_educativo " +
                     "WHERE pe.numero = ? and ne.codigo = ? and pm.tipo = 'papeleria'";
    
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
    
            stmt.setInt(1, periodo);
            stmt.setString(2, nivel_educativo);
    
            try (ResultSet rs = stmt.executeQuery()) {
                boolean firstRow = true;
    
                System.out.println("─────────────────────────────────────────────────────────────────");
                System.out.println("                  PRECIOS DE LOS UTILES ESCOLARES ");
                System.out.println("─────────────────────────────────────────────────────────────────");
    
                while (rs.next()) {
                    if (firstRow) {
                        System.out.println("┌───────────────────────────────────────────────────────────────┐");
                        System.out.println("  Inicio del Periodo: " + rs.getString("Fecha_de_Inicio_del_Periodo_Escolar"));
                        System.out.println("  Final del Periodo: " + rs.getString("Fecha_Final_del_Periodo_Escolar"));
                        System.out.println("  Nivel Educativo: " + rs.getString("Nivel"));
                        System.out.println("└───────────────────────────────────────────────────────────────┘");
                        System.out.println("  Lista de útiles:");
                        System.out.println("─────────────────────────────────────────────────────────────────");
                        firstRow = false;
                    }
    
                    System.out.printf("  - Producto: %-40s Costo: $%-10s%n", 
                                      rs.getString("Descripcion"), 
                                      rs.getString("Costo"));
                }
    
                if (firstRow) {  // Esto significa que no se encontraron registros
                    System.out.println("No se encontraron registros.");
                }
            }
        }
    }
    

    public static void precioUniformes( String nivel_educativo) throws SQLException {
        // Consulta 9
        String sql = "SELECT DATE_FORMAT(pe.añoInicio, '%d-%m-%y' ) as Fecha_de_Inicio_del_Periodo_Escolar, " +
                     "DATE_FORMAT(pe.añoFin, '%d-%m-%y' ) as Fecha_Final_del_Periodo_Escolar, " +
                     "ne.nombre as Nivel, " +
                     "g.nombre as Grado, " +
                     "tu.descripcion as Descripcion, " +
                     "tu.precio as Precio " +
                     "FROM tipo_de_uniforme as tu " +
                     "INNER JOIN uni_periodo as up on up.tipo_de_uniforme = tu.numero " +
                     "INNER JOIN periodo as pe on pe.numero = up.periodo " +
                     "INNER JOIN nivel_educativo as ne on ne.codigo = tu.nivel_educativo " +
                     "INNER JOIN grado as g on g.nivel_educativo = ne.codigo " +
                     "WHERE pe.numero = ? and ne.codigo = ?";
    
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
    
            stmt.setInt(1, 4);
            stmt.setString(2, nivel_educativo);
    
            try (ResultSet rs = stmt.executeQuery()) {
                boolean firstRow = true;
    
                System.out.println("┌───────────────────────────────────────────────────────────────┐");
                System.out.println("                      PRECIO DE LOS UNIFORMES ");
                System.out.println("└───────────────────────────────────────────────────────────────┘");
    
                while (rs.next()) {
                    if (firstRow) {
                        System.out.println("┌───────────────────────────────────────────────────────────────┐");
                        System.out.println("  Inicio del Periodo: " + rs.getString("Fecha_de_Inicio_del_Periodo_Escolar"));
                        System.out.println("  Final del Periodo: " + rs.getString("Fecha_Final_del_Periodo_Escolar"));
                        System.out.println("  Nivel Educativo: " + rs.getString("Nivel"));
                        System.out.println("└───────────────────────────────────────────────────────────────┘");
                        System.out.println();
                        firstRow = false;  // Asegura que esta información solo se imprima una vez
                    }
    
                    System.out.println("┌───────────────────────────────────────────────────────────────┐");
                    System.out.println("  Grado: " + rs.getString("Grado"));
                    System.out.println("  Descripcion: " + rs.getString("Descripcion"));
                    System.out.println("  Costo: " + rs.getString("Precio"));
                    System.out.println("└───────────────────────────────────────────────────────────────┘");
                    System.out.println();
                }
    
                if (firstRow) {  // Esto significa que no se encontraron registros
                    System.out.println("No se encontraron registros.");
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al consultar los precios de los uniformes: " + e.getMessage());
            throw e;
        }
    }
    
    public static void consultarCostoMantenimiento() {
        String sql = "SELECT " +
                "p.nombre as Periodo, " +
                "DATE_FORMAT(p.añoInicio, '%d/%m/%Y') AS Fecha_de_inicio_del_periodo_escolar, " +
                "DATE_FORMAT(p.añoFin, '%d/%m/%Y') AS Fecha_final_del_periodo_escolar, " +
                "m.descripcion AS Concepto_del_mantenimiento, " +
                "m.precio AS Costo, " +
                "NULL AS Total_del_periodo " +
                "FROM " +
                "mantenimiento AS m " +
                "INNER JOIN man_ped AS mp ON mp.mantenimiento = m.codigo " +
                "INNER JOIN periodo AS p ON mp.periodo = p.numero " +
    
                "UNION ALL " +
    
                "SELECT " +
                "p.nombre as Periodo, " +
                "NULL AS Fecha_de_inicio_del_periodo_escolar, " +
                "NULL AS Fecha_final_del_periodo_escolar, " +
                "'Total' AS Concepto_del_mantenimiento, " +
                "NULL AS Costo, " +
                "ROUND(SUM(m.precio), 2) AS Total_del_periodo " +
                "FROM " +
                "mantenimiento AS m " +
                "INNER JOIN man_ped AS mp ON mp.mantenimiento = m.codigo " +
                "INNER JOIN periodo AS p ON mp.periodo = p.numero " +
                "GROUP BY p.numero";
    
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
    
            boolean hasData = false;
    
            while (rs.next()) {
                String periodo = rs.getString("Periodo");
    
                if (rs.getString("Concepto_del_mantenimiento").equals("Total")) {
                    System.out.println("┌───────────────────────────────────────────────────────────────┐");
                    System.out.println("  Total del " + periodo + ": " + rs.getString("Total_del_periodo"));
                    System.out.println("└───────────────────────────────────────────────────────────────┘");
                } else {
                    System.out.println("┌───────────────────────────────────────────────────────────────┐");
                    System.out.println("  Periodo: " + periodo);
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    

    public static String pagarMensualidad(String matricula, String mes, String nivelE) throws SQLException {
        PagoDAO pagoDAO = new PagoDAO();
        Scanner sc = new Scanner(System.in);
        String tpInscripcion = null;
        int tpPaqueteDeUniforme = 0;
        String tpExamen = null;
        String tpMensualidad = null;
        int tpEvento = 0;
        String tpPaqueteDeMaterial = null;
        LocalDate fechaActual = LocalDate.now();
        String fechaPago = fechaActual.toString();
        double monto = 200;
        int periodo = 4;
        String alumno = matricula;
        String tpDescripcion = null;
        String referencia = generarReferencia();

        // Asignar valores según el tipo de pago seleccionado
        switch (mes) {
            case "ENE":
                tpDescripcion = "Mensualidad de Enero";
                tpMensualidad = "Ene";
                break;
            case "FEB":
                tpDescripcion = "Mensualidad de Febrero";
                tpMensualidad = "Feb";
                break;
            case "MAR":
                tpDescripcion = "Mensualidad de Marzo";
                tpMensualidad = "Mar";
                break;
            case "ABR":
                tpDescripcion = "Mensualidad de Abril";
                tpMensualidad = "Abr";
                break;
            case "MAY":
                tpDescripcion = "Mensualidad de Mayo";
                tpMensualidad = "May";
                break;
            case "JUN":
                tpDescripcion = "Mensualidad de Junio";
                tpMensualidad = "Jun";
                break;
            case "JUL":
                tpDescripcion = "Mensualidad de Julio";
                tpMensualidad = "Jul";
                break;
            case "AGO":
                tpDescripcion = "Mensualidad de Agosto";
                tpMensualidad = "Ago";
                break;
            case "SEP":
                tpDescripcion = "Mensualidad de Septiembre";
                tpMensualidad = "Sep";
                break;
            case "OCT":
                tpDescripcion = "Mensualidad de Octubre";
                tpMensualidad = "Oct";
                break;
            case "NOV":
                tpDescripcion = "Mensualidad de Noviembre";
                tpMensualidad = "Nov";
                break;
            case "DIC":
                tpDescripcion = "Mensualidad de Diciembre";
                tpMensualidad = "Dic";
                break;
            default:
                System.out.println("Error en el proceso");
                sc.close();
                return null;
        }

        // Crear el objeto Pago
        Pago pago = new Pago(referencia, fechaPago, nivelE, periodo, alumno, monto, tpPaqueteDeMaterial,
        tpEvento, tpPaqueteDeMaterial, tpPaqueteDeMaterial, tpEvento, tpPaqueteDeMaterial,
        tpPaqueteDeMaterial, tpEvento, tpPaqueteDeMaterial);

// Asignar detalles del pago
pago.setTPdescripcion(tpDescripcion);
pago.setTPinscripcion(tpInscripcion);
pago.setTPpaquete_de_uniforme(tpPaqueteDeUniforme);
pago.setTPexamen(tpExamen);
pago.setTPmensualidad(tpMensualidad);
pago.setTPevento(tpEvento);
pago.setTPpaquete_de_material(tpPaqueteDeMaterial);
pago.setEstado("pendiente");

        // No se asignaron los demás detalles del pago porque no son necesarios según el
        // caso dado.

        System.out.println("------------------------INFORMACION PAGO------------------------");
        System.out.println("Matricula: " + alumno);
        System.out.println("Alumno: " + AlumnoDAO.obtenerNombrePorMatricula(alumno));
        System.out.println("Concepto: " + tpDescripcion);
        System.out.println("Monto a pagar: " + monto);
        String respuesta = Valid.getValidString(sc, "Esta seguro de que desea generar la referencia de pago? (SI/NO)",
                2);
        if (respuesta.equals("SI")) {
            // Registrar el pago
            try {
                pagoDAO.registrarPago(pago);
            } catch (SQLException e) {
                System.err.println("Error al registrar el pago: " + e.getMessage());
            }
            return referencia;
        } else {
            return null;
        }
    }
    public static String pagarExamen(String matricula, int TipoExam, String nivel_educativo) throws SQLException {
        PagoDAO pagoDAO = new PagoDAO();
        Scanner sc = new Scanner(System.in);
        String tpInscripcion = null;
        int tpPaqueteDeUniforme = 0;
        String tpExamen = null;
        String tpMensualidad = null;
        int tpEvento = 0;
        String tpPaqueteDeMaterial = null;
        LocalDate fechaActual = LocalDate.now();
        String fechaPago = fechaActual.toString();
        double monto = 0;
        int periodo = 4;
        String alumno = matricula;
        String tpDescripcion = null;
        String referencia = generarReferencia();
        // Asignar valores según el tipo de pago seleccionado
        switch (TipoExam) {
            case 1:
                monto = 50.0;
                tpExamen="EX_PAR";
                tpDescripcion = "Examen Parcial";
                break;
            case 2:
                monto = 60.0;
                tpExamen="EX_REM";
                tpDescripcion = "Examen Remedial";
                break;
            case 3:
                monto = 70.0;
                tpExamen="EX_EXT";
                tpDescripcion = "Examen Extraordinario";
                break;
            case 4:
                monto = 80.0;
                tpExamen="EX_DIAG";
                tpDescripcion = "Examen Diagnostico";
                break;
            case 5:
                monto = 90.0;
                tpExamen="EX_ING";
                tpDescripcion = "Examen Ingles";
                break;
            default:
                System.out.println("Error en el proceso");
                sc.close();
                return null;
                }

        // Crear el objeto Pago
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

        // No se asignaron los demás detalles del pago porque no son necesarios según el
        // caso dado.

        System.out.println("------------------------INFORMACION PAGO------------------------");
        System.out.println("Matricula: " + alumno);
        System.out.println("Alumno: " + AlumnoDAO.obtenerNombrePorMatricula(alumno));
        System.out.println("Concepto: " + tpDescripcion);
        System.out.println("Monto a pagar: " + monto);
        String respuesta = Valid.getValidString(sc, "Esta seguro de que desea generar la referencia de pago? (SI/NO)",
                2);
        if (respuesta.equals("SI")) {
            // Registrar el pago
            try {
                pagoDAO.registrarPago(pago);
            } catch (SQLException e) {
                System.err.println("Error al registrar el pago: " + e.getMessage());
            }
            return referencia;
        } else {
            System.out.println("Cancelando...");
            return null;
        }
    }
}

