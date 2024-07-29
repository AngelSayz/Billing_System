package Persistencia;

import Logica.*;
import java.sql.*;
import java.util.Scanner;

import Interfaz.DateDisplay;

import java.util.Random;
import java.time.LocalDate;
import java.time.Period;

public class AlumnoDAO {

    public void registrarAlumno(Alumno alumno) throws SQLException {
        String sql = "INSERT INTO alumno (matricula, nombrePila, primerApellido, segApellido, edad, fechaNac, " +
                "nombreTutor, primerApellTutor, segApellTutor, dirCalle, dirNumero, dirColonia, numTel, category) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, alumno.getMatricula());
            stmt.setString(2, alumno.getNombrePila());
            stmt.setString(3, alumno.getPrimerApellido());
            stmt.setString(4, alumno.getSegApellido());
            stmt.setInt(5, alumno.getEdad());
            stmt.setDate(6, Date.valueOf(alumno.getFechaNac()));
            stmt.setString(7, alumno.getNombreTutor());
            stmt.setString(8, alumno.getPrimerApellTutor());
            stmt.setString(9, alumno.getSegApellTutor());
            stmt.setString(10, alumno.getDirCalle());
            stmt.setString(11, alumno.getDirNumero());
            stmt.setString(12, alumno.getDirColonia());
            stmt.setString(13, alumno.getNumTel());
            stmt.setString(14, alumno.getCategory());
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error al registrar el alumno: " + e.getMessage());
            throw e;
        }
    }

    public static void crearAlumno() throws SQLException {
        AlumnoDAO alumnoDAO = new AlumnoDAO();
        Scanner sc = new Scanner(System.in);

        System.out.println("╔══════════════════════════════════════════════════════════════╗");
        System.out.println("║                    REGISTRANDO NUEVO ALUMNO                  ║");
        System.out.println("╚══════════════════════════════════════════════════════════════╝");

        String nombrePila = Valid.getValidString(sc, "Nombre del Alumno: ", 15);
        String primerApellido = Valid.getValidString(sc, "Apellido Paterno: ", 15);
        String segApellido = Valid.getValidOptionalString(sc, "Apellido Materno: ", 15);
        System.err.println("╔═══════════════════════════════════════════════════════════════════════╗");
        System.err.println("║ Por favor, seleccione la fecha de nacimiento en la ventana emergente. ║");
        System.err.println("╚═══════════════════════════════════════════════════════════════════════╝");
        String fechaNac = DateDisplay.getValidDate("Seleccione la fecha de nacimiento");
        if (fechaNac == null) {
            System.out.println("╔════════════════════════════════════════════════════════╗");
            System.out.println("║ Operación cancelada. No se ha ingresado ninguna fecha. ║");
            System.out.println("╚════════════════════════════════════════════════════════╝");
            return;
        }
        int edad = calcularEdad(fechaNac);
        String nombreTutor = Valid.getValidString(sc, "Nombre del Tutor: ", 15);
        String primerApellTutor = Valid.getValidString(sc, "Apellido Paterno del Tutor: ", 15);
        String segApellTutor = Valid.getValidOptionalString(sc, "Apellido Materno del Tutor: ", 15);
        String numTel = Valid.getValidString(sc, "Número de Teléfono del tutor: ", 30);
        String dirCalle = Valid.getValidString(sc, "Calle: ", 30);
        String dirNumero = Valid.getValidString(sc, "Número: ", 30);
        String dirColonia = Valid.getValidString(sc, "Colonia: ", 30);
        String matricula = generarMatricula();
        String category = "user";

        Alumno alumno = new Alumno(matricula, nombrePila, primerApellido, segApellido, edad, fechaNac,
                nombreTutor, primerApellTutor, segApellTutor, dirCalle, dirNumero,
                dirColonia, numTel, category);

        try {
            alumnoDAO.registrarAlumno(alumno);
            System.out.println("╔════════════════════════════════════════════════════════════════╗");
            System.out.println("║ ALUMNO REGISTRADO EXITOSAMENTE SU MATRICULA ES: " + matricula + "         ║");
            System.out.println("╚════════════════════════════════════════════════════════════════╝");
        } catch (SQLException e) {
            System.err.println("╔════════════════════════════════════════════════════════════════╗");
            System.err.println("║                    ERROR AL REGISTRAR EL ALUMNO                ║");
            System.err.println("╚════════════════════════════════════════════════════════════════╝");
        }
    }

    public static String generarMatricula() throws SQLException {
        Random random = new Random();
        String matricula;
        boolean isUnique;

        try (Connection conn = DatabaseConnection.getConnection()) {
            do {
                int randomInt = random.nextInt(1, 999999);
                matricula = String.format("%06d", randomInt); // Formatea el número a 6 digitos

                // Comprobacion matricula
                String query = "SELECT COUNT(*) FROM alumno WHERE matricula = ?";
                try (PreparedStatement statement = conn.prepareStatement(query)) {
                    statement.setString(1, matricula);
                    try (ResultSet resultSet = statement.executeQuery()) {
                        resultSet.next();
                        isUnique = resultSet.getInt(1) == 0;
                    }
                }
            } while (!isUnique);
        }

        return matricula;
    }

    public String verificarMatricula(String matricula) throws SQLException {
        String sql = "SELECT category FROM alumno WHERE matricula = ?";
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, matricula);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("category");
                } else {
                    return null;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al verificar la matrícula: " + e.getMessage());
            throw e;
        }
    }

    public static void eliminarAlumno(String matricula) {
        try (Connection conn = DatabaseConnection.getConnection()) {
            String checkCategoriaSql = "SELECT category FROM alumno WHERE matricula = ?";
            try (PreparedStatement checkStmt = conn.prepareStatement(checkCategoriaSql)) {
                checkStmt.setString(1, matricula);
                try (ResultSet rs = checkStmt.executeQuery()) {
                    if (rs.next()) {
                        String category = rs.getString("category");
                        if ("admin".equals(category)) {
                            System.out.println("╔═══════════════════════════════════════════════════════════╗");
                            System.out.println("║ No se puede eliminar un usuario con la categoría 'admin'. ║");
                            System.out.println("╚═══════════════════════════════════════════════════════════╝");
                        } else {
                            String deleteSql = "DELETE FROM alumno WHERE matricula = ?";
                            try (PreparedStatement deleteStmt = conn.prepareStatement(deleteSql)) {
                                deleteStmt.setString(1, matricula);
                                int rowsAffected = deleteStmt.executeUpdate();
                                if (rowsAffected > 0) {
                                    System.out.println("╔══════════════════════════════════╗");
                                    System.out.println("║ Registro eliminado exitosamente. ║");
                                    System.out.println("╚══════════════════════════════════╝");
                                } else {
                                    System.out.println("╔════════════════════════════════════════════════════╗");
                                    System.out.println("║ No se encontró ningún registro con esa matrícula.  ║");
                                    System.out.println("╚════════════════════════════════════════════════════╝");
                                }
                            }
                        }
                    } else {
                        System.out.println("╔════════════════════════════════════════════════════╗");
                        System.out.println("║ No se encontró ningún registro con esa matrícula.  ║");
                        System.out.println("╚════════════════════════════════════════════════════╝");
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al eliminar el registro: " + e.getMessage());
        }
    }

    public static void actualizarAlumno(Scanner sc, String matricula) throws SQLException {

        AlumnoDAO alumnoDAO = new AlumnoDAO();
        String nombreAlumno = alumnoDAO.verificarMatricula(matricula);
        if (nombreAlumno == null) {
            System.out.println("╔══════════════════════════════════════════════════════════════╗");
            System.out.println("║ No se encontró ningún alumno con la matrícula proporcionada. ║");
            System.out.println("╚══════════════════════════════════════════════════════════════╝");
            return;
        }
        boolean actualizarAlumno = true;
        while (actualizarAlumno) {
            System.out.println("╔══════════════════════════════════════════════╗");
            System.out.println("║               MODIFICAR ALUMNO               ║");
            System.out.println("╚══════════════════════════════════════════════╝");
            System.out.println("┌──────────────────────────────────────────────┐");
            System.out.println("    MODIFICANDO A: " + nombreAlumno.toUpperCase());
            System.out.println("└──────────────────────────────────────────────┘");
            System.out.println("╔══════════════════════════════════════════════╗");
            System.out.println("║  [1]- Asignar nivel educativo al alumno      ║");
            System.out.println("║  [2]- Asignar un grupo al alumno             ║");
            System.out.println("║  [3]- Modificar la informacion del alumno    ║");
            System.out.println("║  [4]- Dar de baja el alumno                  ║");
            System.out.println("║  [0]- Salir                                  ║");
            System.out.println("╚══════════════════════════════════════════════╝");
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 4);

            switch (respuesta) {
                case 0:
                    actualizarAlumno = false;
                    break;
                case 1:

                    break;
                case 2:

                    break;
                case 3:
                    // IN PROCESSS
                    break;
                case 4:
                    System.out.println("╔══════════════════════════════════════════════╗");
                    System.out.println("║        DESEA DAR DE BAJA AL ALUMNO           ║");
                    System.out.println("╠══════════════════════════════════════════════╣");
                    System.out.println("║ [1]- ACEPTAR                                 ║");
                    System.out.println("║ [2]- CANCELAR                                ║");
                    System.out.println("╚══════════════════════════════════════════════╝");
                    respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 1, 2);
                    switch (respuesta) {
                        case 1:
                            eliminarAlumno(matricula);
                            menu.gestionarAlumnos(sc);
                            break;
                        case 2:
                            return;
                        default:
                            System.out.println("╔═════════════════════════════════════════════════════════╗");
                            System.out.println("║ Entrada inválida. Por favor, ingrese una opcion valida. ║");
                            System.out.println("╚═════════════════════════════════════════════════════════╝");
                            break;

                    }
                default:
                    break;
            }
        }
    }

    public static void consultarTodosAlumnos() throws SQLException {
        String sql = "SELECT matricula, CONCAT(primerApellido, ' ', segApellido, ' ', nombrePila) AS nombreCompleto, " +
                "edad, fechaNac, CONCAT(primerApellTutor, ' ', segApellTutor, ' ', nombreTutor) AS nombreTutorCompleto, "
                +
                "CONCAT(dirCalle, ' ', dirNumero, ' ', dirColonia) AS direccionCompleta, numTel " +
                "FROM alumno " +
                "WHERE category = 'user' ORDER BY primerApellido";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery()) {

            System.out.println(
                    "╔════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗");
            System.out.println(
                    "║                                                                       LISTA DE ALUMNOS                                                                             ║");
            System.out.println(
                    "╠════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣");
            System.out.printf("║ %-10s │ %-25s │ %-4s │ %-15s │ %-34s │ %-39s │ %-15s  ║\n",
                    "Matrícula", "Alumno", "Edad", "Fecha Nacimiento", "Tutor", "Dirección", "Teléfono");
            System.out.println(
                    "╠════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣");

            while (rs.next()) {
                String matricula = rs.getString("matricula");
                String nombreCompleto = rs.getString("nombreCompleto");
                int edad = rs.getInt("edad");
                Date fechaNac = rs.getDate("fechaNac");
                String nombreTutorCompleto = rs.getString("nombreTutorCompleto");
                String direccionCompleta = rs.getString("direccionCompleta");
                String numTel = rs.getString("numTel");

                System.out.printf("║ %-10s │ %-25s │ %-4d │ %-15s │ %-35s │ %-40s │ %-15s ║\n",
                        matricula, nombreCompleto, edad, fechaNac, nombreTutorCompleto, direccionCompleta, numTel);
            }

            System.out.println(
                    "╚════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝");

        } catch (SQLException e) {
            System.err.println("Error al consultar los alumnos: " + e.getMessage());
            throw e;
        }
    }

    public String obtenerNombrePorMatricula(String matricula) throws SQLException {
        String sql = "SELECT CONCAT(primerApellido, ' ', segApellido, ' ', nombrePila) AS nombreCompleto FROM alumno WHERE matricula = ?";
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, matricula);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("nombreCompleto");
                } else {
                    return null;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener el nombre del alumno: " + e.getMessage());
            throw e;
        }
    }

    public static void consultarInfoAlumno(String matriculaInfo) throws SQLException {
        String sql = "SELECT matricula, CONCAT(primerApellido, ' ', segApellido, ' ', nombrePila) AS nombreCompleto, " +
                "edad, fechaNac, CONCAT(primerApellTutor, ' ', segApellTutor, ' ', nombreTutor) AS nombreTutorCompleto, "
                +
                "CONCAT(dirCalle, ' ', dirNumero, ' ', dirColonia) AS direccionCompleta, numTel " +
                "FROM alumno " +
                "WHERE matricula = ? AND category = 'user'";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, matriculaInfo); // Set the value of the parameter
            try (ResultSet rs = stmt.executeQuery()) {

                System.out.println(
                        "╔════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗");
                System.out.println(
                        "║                                                                    INFORMACION ALUMNO                                                                              ║");
                System.out.println(
                        "╠════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣");
                System.out.printf("║ %-10s │ %-25s │ %-4s │ %-15s │ %-34s │ %-39s │ %-15s  ║\n",
                        "Matrícula", "Alumno", "Edad", "Fecha Nacimiento", "Tutor", "Dirección", "Teléfono");
                System.out.println(
                        "╠════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣");

                while (rs.next()) {
                    String matricula = rs.getString("matricula");
                    String nombreCompleto = rs.getString("nombreCompleto");
                    int edad = rs.getInt("edad");
                    Date fechaNac = rs.getDate("fechaNac");
                    String nombreTutorCompleto = rs.getString("nombreTutorCompleto");
                    String direccionCompleta = rs.getString("direccionCompleta");
                    String numTel = rs.getString("numTel");

                    System.out.printf("║ %-10s │ %-25s │ %-4d │ %-15s │ %-35s │ %-40s │ %-15s ║\n",
                            matricula, nombreCompleto, edad, fechaNac, nombreTutorCompleto, direccionCompleta, numTel);
                }

                System.out.println(
                        "╚════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝");

            } catch (SQLException e) {
                System.err.println("Error al consultar la informacion: " + e.getMessage());
                throw e;
            }
        }
    }

    public static int calcularEdad(String fechaNac) {
        LocalDate fechaNacimiento = LocalDate.parse(fechaNac);
        LocalDate fechaActual = LocalDate.now();
        return Period.between(fechaNacimiento, fechaActual).getYears();
    }
}
