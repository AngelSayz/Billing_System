package Persistencia;

import Logica.*;
import java.sql.*;
import java.util.Scanner;
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
                    rs.getDouble("monto"), sql, 0, sql, sql, sql, 0, sql, sql, 0, sql
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
                    rs.getDouble("monto"), sql, 0, sql, sql, sql, 0, sql, sql, 0, sql
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
public static void pagarInscripcion(String matricula, int grado) throws SQLException {

}
public static void pagarUniforme(String matricula, int numPaq) {
    // TODO Auto-generated method stub
    throw new UnsupportedOperationException("Unimplemented method 'pagarUniforme'");
}
}