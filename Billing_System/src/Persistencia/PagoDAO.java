package Persistencia;

import Logica.*;
import java.sql.*;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class PagoDAO{

    public void registrarPago(Pago pago) throws SQLException {
        String sqlP = "INSERT INTO pago (referencia, fechaPago, monto, nivel_educativo, periodo, alumno, estado) VALUES (?, ?, ?, ?, ?, ?,?)";
        String sqlTP = "INSERT INTO tipo_de_pago (descripcion, pago, inscripcion, paquete_de_libros, paquete_de_uniforme, examen, mensualidad, evento, paquete_de_material) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
        try (Connection conn = DatabaseConnection.getConnection()) {
            conn.setAutoCommit(false); // Iniciar transacción
    
            try (PreparedStatement stmtP = conn.prepareStatement(sqlP);
                 PreparedStatement stmtTP = conn.prepareStatement(sqlTP)) {
                
                // Insert en la tabla pago
                stmtP.setString(1, pago.getReferencia());
                stmtP.setDate(2, Date.valueOf(pago.getFecha()));
                stmtP.setDouble(3, pago.getMonto());
                stmtP.setString(4, pago.getNivel_educativo());
                stmtP.setString(5, pago.getPeriodo());
                stmtP.setString(6, pago.getAlumno());
                stmtP.setString(7, pago.getEstado());
                stmtP.executeUpdate();
    
                // Insert en la tabla tipo_de_pago
                stmtTP.setString(1, pago.getTPdescripcion());
                stmtTP.setString(2, pago.getReferencia());
    
                // Establecer valores, permitiendo valores nulos
                setNullableString(stmtTP, 3, pago.getTPinscripcion());
                setNullableString(stmtTP, 4, pago.getTPpaquete_de_libros());
                setNullableInt(stmtTP, 5, pago.getTPpaquete_de_uniforme());
                setNullableString(stmtTP, 6, pago.getTPexamen());
                setNullableString(stmtTP, 7, pago.getTPmensualidad());
                setNullableInt(stmtTP, 8, pago.getTPevento());
                setNullableString(stmtTP, 9, pago.getTPpaquete_de_material());
    
                stmtTP.executeUpdate();
    
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

    public static void inputPago() throws SQLException {
        PagoDAO pagoDAO = new PagoDAO();
        Scanner sc = new Scanner(System.in);
    
        String fechaPago = Valid.getValidDate(sc, "Ingrese la fecha del pago");
        double monto = Valid.getValidDouble(sc, "Monto a Pagar: ");
        String nivelEducativo = Valid.getValidString(sc, "Nivel Educativo: ", 10);
        String periodo = Valid.getValidString(sc, "Periodo: ", 10);
        String alumno = Valid.getValidString(sc, "Matrícula del Alumno: ", 10);
        String tpDescripcion = Valid.getValidString(sc, "Ingrese la descripcion del evento", 50);
        String referencia = generarReferencia(); 
    
        // Mostrar menú de selección de tipo de pago
        System.out.println("Seleccione el tipo de pago:");
        System.out.println("1. Inscripción");
        System.out.println("2. Paquete de Libros");
        System.out.println("3. Paquete de Uniforme");
        System.out.println("4. Examen");
        System.out.println("5. Mensualidad");
        System.out.println("6. Evento");
        System.out.println("7. Paquete de Material");
        int tipoDePagoSeleccionado = Valid.getValidIntMenu(sc, "Seleccione una opción (1-7): ", 1, 7);
    
        // Inicializar todos los campos de tipo de pago como nulos

        String tpInscripcion = null;
        String tpPaqueteDeLibros = null;
        int tpPaqueteDeUniforme = 0;
        String tpExamen = null;
        String tpMensualidad = null;
        int tpEvento = 0;
        String tpPaqueteDeMaterial = null;
    
        // Asignar valores según el tipo de pago seleccionado
        switch (tipoDePagoSeleccionado) {
            case 1:
                tpDescripcion = "Inscripción";
                tpInscripcion = "INS_KIND1";
                break;
            case 2:
                tpDescripcion = "Paquete de Libros";
                tpPaqueteDeLibros = "PAQ_KIND1";
                break;
            case 3:
                tpDescripcion = "Paquete de Uniforme";
                tpPaqueteDeUniforme = 1; // Ajustar según sea necesario
                break;
            case 4:
                tpDescripcion = "Examen";
                tpExamen = "Examen";
                break;
            case 5:
                tpDescripcion = "Mensualidad";
                tpMensualidad = "Mensualidad";
                break;
            case 6:
                tpDescripcion = "Evento";
                tpEvento = 1; // Ajustar según sea necesario
                break;
            case 7:
                tpDescripcion = "Paquete de Material";
                tpPaqueteDeMaterial = "Paquete de Material";
                break;
            default:
                System.out.println("Opción no válida.");
                return;
        }
    
        Pago pago = new Pago(referencia, fechaPago, nivelEducativo, periodo, alumno, monto, tpPaqueteDeMaterial, tpEvento, tpPaqueteDeMaterial, tpPaqueteDeMaterial, tpPaqueteDeMaterial, tpEvento, tpPaqueteDeMaterial, tpPaqueteDeMaterial, tpEvento, tpPaqueteDeMaterial);
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
                    rs.getString("Estado")
                );

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
                "    p.estado as Estado" + 
                "FROM pago as p " + 
                "INNER JOIN tipo_de_pago as tp ON tp.pago = p.referencia " + 
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
                    rs.getString("Estado")
                );

                pagos.add(pago);

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
            }
        }
    } catch (SQLException e) {
        System.err.println("Error al consultar el pago: " + e.getMessage());
        throw e;
    }
 // Devuelve la lista de pagos encontrados
}
public static void pagarInscripcion(String matricula, int grado) throws SQLException {

}
public static void pagarUniforme(String matricula, int numPaq) {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'pagarUniforme'"); 
}
public static void consultarInscripcionesPagadas(String matricula) throws SQLException {
    //Consulta 4
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
                System.out.println("                      INSCRIPCIONES PAGADAS " );
                System.out.println("└───────────────────────────────────────────────────────────────┘");

                do {    
                    System.out.println("┌───────────────────────────────────────────────────────────────┐");
                    System.out.println("  PERIODO ESCOLAR: "+ rs.getString("Periodo"));
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
}