package Persistencia;

import Logica.*;
import java.sql.*;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.time.LocalDate;
import java.time.Period;

public class AlumnoDAO {

    public String registrarAlumno(Alumno alumno) throws SQLException {
        String sql = "INSERT INTO alumno (matricula, nombrePila, primerApellido, segApellido, edad, fechaNac, " +
                "dirCalle, dirNumero, dirColonia, category, password) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, alumno.getMatricula());
            stmt.setString(2, alumno.getNombrePila());
            stmt.setString(3, alumno.getPrimerApellido());
            stmt.setString(4, alumno.getSegApellido());
            stmt.setInt(5, alumno.getEdad());
            stmt.setDate(6, Date.valueOf(alumno.getFechaNac()));
            stmt.setString(7, alumno.getDirCalle());
            stmt.setString(8, alumno.getDirNumero());
            stmt.setString(9, alumno.getDirColonia());
            stmt.setString(10, alumno.getCategory());
            stmt.setString(11, alumno.getPassword());

            stmt.executeUpdate();
            return alumno.getMatricula();
        } catch (SQLException e) {
            System.err.println("Error al registrar el alumno: " + e.getMessage());
            throw e;
        }
    }

    public static void matricularAlumno() throws SQLException {
        AlumnoDAO alumnoDAO = new AlumnoDAO();
        Scanner sc = new Scanner(System.in);

        System.out.println("╔══════════════════════════════════════════════════════════════╗");
        System.out.println("║                    REGISTRANDO NUEVO ALUMNO                  ║");
        System.out.println("╚══════════════════════════════════════════════════════════════╝");

        String nombrePila = Valid.getValidString(sc, "Nombre del Alumno: ", 15);
        String primerApellido = Valid.getValidString(sc, "Apellido Paterno: ", 15);
        String segApellido = Valid.getValidOptionalString(sc, "Apellido Materno: ", 15);
        String fechaNac = Valid.getValidDate(sc, "Seleccione la fecha de nacimiento (YYYY-MM-DD): ");
        int edad = calcularEdad(fechaNac);
        String dirCalle = Valid.getValidString(sc, "Calle: ", 30);
        String dirNumero = Valid.getValidString(sc, "Número: ", 30);
        String dirColonia = Valid.getValidString(sc, "Colonia: ", 30);
        String matricula = generarMatricula();
        String category = "user";
        String password = matricula;

        Alumno alumno = new Alumno(matricula, nombrePila, primerApellido, segApellido, edad, fechaNac, dirCalle,
                dirNumero, dirColonia,
                category, password);
        try {
            alumnoDAO.registrarAlumno(alumno);
            TutorDAO.crearTutor(matricula);
            System.out.println("╔══════════════════════════════════════════════╗");
            System.out.println("║        DESEA AGREGAR UN SEGUNDO TUTOR?       ║");
            System.out.println("╠══════════════════════════════════════════════╣");
            System.out.println("║ [1]- AGREGAR                                 ║");
            System.out.println("║ [2]- OMITIR                                  ║");
            System.out.println("╚══════════════════════════════════════════════╝");
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 1, 2);
            switch (respuesta) {
                case 1:
                    TutorDAO.crearTutor(matricula);
                    System.out.println("╔════════════════════════════════════════════════════════════════╗");
                    System.out.println("║ ALUMNO REGISTRADO EXITOSAMENTE SU MATRICULA ES: " + matricula + "         ║");
                    System.out.println("╚════════════════════════════════════════════════════════════════╝");
                    break;
                case 2:
                    System.out.println("╔════════════════════════════════════════════════════════════════╗");
                    System.out.println("║ ALUMNO REGISTRADO EXITOSAMENTE SU MATRICULA ES: " + matricula + "         ║");
                    System.out.println("╚════════════════════════════════════════════════════════════════╝");
                    return;
                default:
                    System.out.println("╔═════════════════════════════════════════════════════════╗");
                    System.out.println("║ Entrada inválida. Por favor, ingrese una opcion valida. ║");
                    System.out.println("╚═════════════════════════════════════════════════════════╝");
                    break;

            }
        } catch (SQLException e) {
            System.err.println("╔════════════════════════════════════════════════════════════════╗");
            System.err.println("║                    ERROR AL REGISTRAR EL ALUMNO                ║");
            System.err.println("╚════════════════════════════════════════════════════════════════╝");
        }

    }

    public static void eliminarAlumno(String matricula) {
        try (Connection conn = DatabaseConnection.getConnection()) {
            conn.setAutoCommit(false); // Iniciar la transacción

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
                            return;
                        } else {
                            // Eliminar la relación en tutor_alumno
                            String deleteRelacionSql = "DELETE FROM tutor_alumno WHERE alumno = ?";
                            try (PreparedStatement deleteRelacionStmt = conn.prepareStatement(deleteRelacionSql)) {
                                deleteRelacionStmt.setString(1, matricula);
                                deleteRelacionStmt.executeUpdate();
                            }

                            // Eliminar registros en grado_alumno
                            String deleteGradoSql = "DELETE FROM grado_alumno WHERE alumno = ?";
                            try (PreparedStatement deleteGradoStmt = conn.prepareStatement(deleteGradoSql)) {
                                deleteGradoStmt.setString(1, matricula);
                                deleteGradoStmt.executeUpdate();
                            }

                            // Eliminar registros en grupo_alumno
                            String deleteGrupoSql = "DELETE FROM grupo_alumno WHERE alumno = ?";
                            try (PreparedStatement deleteGrupoStmt = conn.prepareStatement(deleteGrupoSql)) {
                                deleteGrupoStmt.setString(1, matricula);
                                deleteGrupoStmt.executeUpdate();
                            }

                            // Eliminar el registro en alumno
                            String deleteSql = "DELETE FROM alumno WHERE matricula = ?";
                            try (PreparedStatement deleteStmt = conn.prepareStatement(deleteSql)) {
                                deleteStmt.setString(1, matricula);
                                int rowsAffected = deleteStmt.executeUpdate();
                                if (rowsAffected > 0) {
                                    conn.commit(); // Confirmar la transacción
                                    System.out.println("╔══════════════════════════════════╗");
                                    System.out.println("║ Registro eliminado exitosamente. ║");
                                    System.out.println("╚══════════════════════════════════╝");
                                } else {
                                    conn.rollback(); // Revertir la transacción
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
            try (Connection conn = DatabaseConnection.getConnection()) {
                conn.rollback(); // Revertir la transacción en caso de error
            } catch (SQLException ex) {
                System.err.println("Error al revertir la transacción: " + ex.getMessage());
            }
        }
    }

    public static void actualizarAlumno(Scanner sc, String matricula) throws SQLException {

        String nombreAlumno = AlumnoDAO.obtenerNombrePorMatricula(matricula);
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
            System.out.println("    MODIFICANDO A: " + nombreAlumno);
            System.out.println("└──────────────────────────────────────────────┘");
            System.out.println("╔══════════════════════════════════════════════╗");
            System.out.println("║  [1]- Asignar grupo al alumno                ║");
            System.out.println("║  [2]- Restablecer contraseña del alumno      ║");
            System.out.println("║  [3]- Dar de baja el alumno                  ║");
            System.out.println("║  [0]- Salir                                  ║");
            System.out.println("╚══════════════════════════════════════════════╝");
            int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 0, 4);

            switch (respuesta) {
                case 0:
                    actualizarAlumno = false;
                    break;
                case 1:
                    asignarGrupo(sc, matricula);
                    break;
                case 2:
                    restablecerPassword(sc, matricula);
                    break;
                case 3:
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
                            menuAdmin.gestionarAlumnos(sc);
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

    private static void asignarGrupo(Scanner sc, String matricula) throws SQLException {
        int grupo;
        int grado;
        System.out.println("╔═══════════════════════╗");
        System.out.println("║    NIVEL EDUCATIVO    ║");
        System.out.println("╠═══════════════════════╣");
        System.out.println("║ [1]- KINDER           ║");
        System.out.println("║ [2]- PRIMARIA         ║");
        System.out.println("║ [3]- SECUNDARIA       ║");
        System.out.println("╚═══════════════════════╝");

        int respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 1, 3);

        switch (respuesta) {
            case 1:
                System.out.println("╔═══════════════════════╗");
                System.out.println("║     GRADO KINDER      ║");
                System.out.println("╠═══════════════════════╣");
                System.out.println("║ [1]- Primero          ║");
                System.out.println("║ [2]- Segundo          ║");
                System.out.println("║ [3]- Tercero          ║");
                System.out.println("╚═══════════════════════╝");

                respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 1, 3);

                switch (respuesta) {
                    case 1:
                        grado = 1;
                        grupo = 28;
                        registrarGradoGrupo(matricula, grado, grupo);
                        break;
                    case 2:
                        grupo = 31;
                        grado = 2;
                        registrarGradoGrupo(matricula, grado, grupo);
                        break;
                    case 3:
                        grupo = 34;
                        grado = 3;
                        registrarGradoGrupo(matricula, grado, grupo);
                        break;
                }
                break;
            case 2:
                System.out.println("╔═════════════════════════╗");
                System.out.println("║     GRADO PRIMARIA      ║");
                System.out.println("╠═════════════════════════╣");
                System.out.println("║ [1]- Primero            ║");
                System.out.println("║ [2]- Segundo            ║");
                System.out.println("║ [3]- Tercero            ║");
                System.out.println("║ [4]- Cuarto             ║");
                System.out.println("║ [5]- Quinto             ║");
                System.out.println("║ [6]- Sexto              ║");
                System.out.println("╚═════════════════════════╝");
                respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 1, 6);
                switch (respuesta) {
                    case 1:
                        grado = 4;
                        grupo = 92;
                        registrarGradoGrupo(matricula, grado, grupo);
                        break;
                    case 2:
                        grado = 5;
                        grupo = 94;
                        registrarGradoGrupo(matricula, grado, grupo);
                        break;
                    case 3:
                        grado = 6;
                        grupo = 97;
                        registrarGradoGrupo(matricula, grado, grupo);
                        break;
                    case 4:
                        grado = 7;
                        grupo = 100;
                        registrarGradoGrupo(matricula, grado, grupo);
                        break;
                    case 5:
                        grado = 8;
                        grupo = 103;
                        registrarGradoGrupo(matricula, grado, grupo);
                        break;
                    case 6:
                        grupo = 106;
                        grado = 9;
                        registrarGradoGrupo(matricula, grado, grupo);
                        break;
                    default:
                        break;
                }
                break;
            case 3:
                System.out.println("╔════════════════════════╗");
                System.out.println("║    GRADO SECUNDARIA    ║");
                System.out.println("╠════════════════════════╣");
                System.out.println("║ [1]- Primero           ║");
                System.out.println("║ [2]- Segundo           ║");
                System.out.println("║ [3]- Tercero           ║");
                System.out.println("╚════════════════════════╝");
                respuesta = Valid.getValidIntMenu(sc, "Ingrese una opcion: ", 1, 3);

                switch (respuesta) {
                    case 1:
                        grado = 10;
                        grupo = 136;
                        registrarGradoGrupo(matricula, grado, grupo);

                        break;

                    case 2:
                        grado = 11;
                        grupo = 139;
                        registrarGradoGrupo(matricula, grado, grupo);
                        break;
                    case 3:
                        grado = 12;
                        grupo = 142;
                        registrarGradoGrupo(matricula, grado, grupo);
                        break;
                    default:
                        break;
                }
                break;
        }

    }

    public static void consultarTodosAlumnos() throws SQLException {
        String sql = "SELECT " +
                "a.matricula as Matricula, " +
                "CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) as Alumno, " +
                "a.edad as Edad, " +
                "DATE_FORMAT(a.fechaNac, '%d-%m-%y') as Fecha_Nacimiento, " +
                "CONCAT(a.dirCalle, ' ', a.dirNumero, ' ', a.dirColonia) as Direccion, " +
                "CONCAT(t.primerApellido, ' ', t.segApellido, ' ', t.nombrePila) as Tutor, " +
                "t.numTel as Numero_de_Telefono " +
                "FROM alumno as a " +
                "LEFT JOIN tutor_alumno as ta ON ta.alumno = a.matricula " +
                "LEFT JOIN tutor as t ON t.numero = ta.tutor " +
                "WHERE a.category = 'user' " +
                "ORDER BY a.matricula, t.primerApellido";
    
        String countSql = "SELECT COUNT(*) as TotalAlumnos FROM alumno WHERE category = 'user'";
    
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery();
             PreparedStatement countStmt = conn.prepareStatement(countSql);
             ResultSet countRs = countStmt.executeQuery()) {
    
            String currentMatricula = "";
            StringBuilder output = new StringBuilder();
    
            while (rs.next()) {
                String matricula = rs.getString("Matricula");
    
                if (!matricula.equals(currentMatricula)) {
                    if (!currentMatricula.isEmpty()) {
                        output.append("╚═════════════════════════════════════════════════════════════════════════════════════════════════════════════╝\n");
                    }
    
                    currentMatricula = matricula;
                    String nombreCompleto = rs.getString("Alumno");
                    int edad = rs.getInt("Edad");
                    String fechaNac = rs.getString("Fecha_Nacimiento");
                    String direccionCompleta = rs.getString("Direccion");
    
                    output.append("╔═════════════════════════════════════════════════════════════════════════════════════════════════════════════╗\n");
                    output.append(String.format("║ %-10s │ %-30s │ %3d │ %-12s │ %-40s ║\n", 
                                                   matricula, nombreCompleto, edad, fechaNac, direccionCompleta));
                }
    
                String tutor = rs.getString("Tutor");
                String numTel = rs.getString("Numero_de_Telefono");
    
                if (tutor != null && !tutor.trim().isEmpty()) {
                    output.append(String.format("║ %-10s │ %-30s │ %-61s ║\n", "", "Tutor",tutor, numTel));
                }
            }
    
            if (!currentMatricula.isEmpty()) {
                output.append("╚═════════════════════════════════════════════════════════════════════════════════════════════════════════════╝\n");
            }
    
            if (output.length() == 0) {
                System.out.println("No se encontró información de alumnos.");
            } else {
                System.out.print(output.toString());
    
                if (countRs.next()) {
                    int totalAlumnos = countRs.getInt("TotalAlumnos");
                    System.out.println("\nTotal de alumnos registrados: " + totalAlumnos);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al consultar la información: " + e.getMessage());
            throw e;
        }
    }
    public static String obtenerNombrePorMatricula(String matricula) throws SQLException {
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

    public static void consultarInfoAlumno(String matriculaInfo, int Periodo) throws SQLException {
        // Consulta 1
        String sql = "SELECT pe.nombre as Periodo_Escolar, " +
                "DATE_FORMAT(pe.añoInicio, '%d-%m-%y' ) as Fecha_de_Inicio, " +
                "DATE_FORMAT(pe.añoFin, '%d-%m-%y' ) as Fecha_Final, " +
                "a.matricula as Matricula, " +
                "CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) as Alumno, " +
                "gr.nombre as Grado, " +
                "ne.nombre as Nivel_Escolar, " +
                "CONCAT(t.primerApellido, ' ', t.segApellido, ' ', t.nombrePila) as Tutor, " +
                "t.numTel as Numero_de_Telefono, " +
                "CONCAT(a.dirCalle, ' ', a.dirNumero, ' ', a.dirColonia) as Direccion " +
                "FROM alumno as a " +
                "INNER JOIN tutor_alumno as ta on ta.alumno = a.matricula " +
                "INNER JOIN tutor as t on t.numero = ta.tutor " +
                "INNER JOIN grupo_alumno as gra on gra.alumno = a.matricula " +
                "INNER JOIN grupo as g on g.numero = gra.grupo " +
                "INNER JOIN periodo as pe ON pe.numero = g.periodo " +
                "INNER JOIN grado as gr on gr.numero = g.grado " +
                "INNER JOIN nivel_educativo as ne on ne.codigo = g.nivel_educativo " +
                "WHERE a.matricula = ? and g.periodo = ?";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, matriculaInfo);
            stmt.setInt(2, Periodo);
            try (ResultSet rs = stmt.executeQuery()) {
                String matricula = null;
                String nombreCompleto = null;
                String fechaInicio = null;
                String fechaFin = null;
                String periodoEscolar = null;
                String grado = null;
                String nivelEscolar = null;
                String direccionCompleta = null;
                List<String> tutores = new ArrayList<>();
                List<String> numerosDeTelefono = new ArrayList<>();

                while (rs.next()) {
                    if (matricula == null) {
                        matricula = rs.getString("Matricula");
                        nombreCompleto = rs.getString("Alumno");
                        fechaInicio = rs.getString("Fecha_de_Inicio");
                        fechaFin = rs.getString("Fecha_Final");
                        periodoEscolar = rs.getString("Periodo_Escolar");
                        grado = rs.getString("Grado");
                        nivelEscolar = rs.getString("Nivel_Escolar");
                        direccionCompleta = rs.getString("Direccion");
                    }
                    String nombreTutorCompleto = rs.getString("Tutor");
                    String numTel = rs.getString("Numero_de_Telefono");
                    tutores.add(nombreTutorCompleto);
                    numerosDeTelefono.add(numTel);
                }

                if (matricula != null) {
                    System.out.println("╔══════════════════════════════════════════════╗");
                    System.out.println("║               Informacion alumno             ║");
                    System.out.println("╚══════════════════════════════════════════════╝");
                    System.out.println("┌──────────────────────────────────────────────┐");
                    System.out.println("    Nombre alumno: " + nombreCompleto);
                    System.out.println("    Matricula: " + matricula);
                    System.out.println("    Periodo Escolar: " + periodoEscolar);
                    System.out.println("    Fecha de Inicio: " + fechaInicio);
                    System.out.println("    Fecha Final: " + fechaFin);
                    System.out.println("    Grado: " + grado);
                    System.out.println("    Nivel Escolar: " + nivelEscolar);
                    System.out.println("    Direccion: " + direccionCompleta);

                    for (int i = 0; i < tutores.size(); i++) {
                        System.out.println("    Tutor " + (i + 1) + ": " + tutores.get(i));
                        System.out.println("    Numero de telefono: " + numerosDeTelefono.get(i));
                    }
                    System.out.println("└──────────────────────────────────────────────┘");
                } else {
                    System.out.println("No se encontró información para la matrícula proporcionada.");
                }

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

    public String verificarPass(String matricula, String password) throws SQLException {
        String sql = "SELECT category FROM alumno WHERE matricula = ? AND password = ?";
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, matricula);
            stmt.setString(2, password);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("category");
                } else {
                    return null;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al verificar las credenciales: " + e.getMessage());
            throw e;
        }
    }

    public static String generarMatricula() throws SQLException {
        Random random = new Random();
        String matricula;
        boolean isUnique;

        try (Connection conn = DatabaseConnection.getConnection()) {
            do {
                int randomInt = random.nextInt(240000, 249999);
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

    public boolean existeMatricula(String matricula) throws SQLException {
        String sql = "SELECT 1 FROM alumno WHERE matricula = ?";
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, matricula);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            System.err.println("Error al verificar la matrícula: " + e.getMessage());
            throw e;
        }
    }

    public static void consultarGrupoAlumno(String matricula) {
        String sql = "SELECT a.matricula as Matricula, " +
                "CONCAT(a.primerApellido, ' ', a.segApellido, ' ', a.nombrePila) as Alumno, " +
                "DATE_FORMAT(pe.añoInicio, '%d-%m-%y') as Inicio_del_Periodo_Escolar, " +
                "DATE_FORMAT(pe.añoFin, '%d-%m-%y') as Final_del_Periodo_Escolar, " +
                "gr.nombre as Grado, " +
                "g.nombre as Grupo " +
                "FROM alumno as a " +
                "INNER JOIN grupo_alumno as ga on ga.alumno = a.matricula " +
                "INNER JOIN grupo as g on g.numero = ga.grupo " +
                "INNER JOIN periodo as pe on pe.numero = g.periodo " +
                "INNER JOIN grado as gr on gr.numero = g.grado " +
                "WHERE a.matricula = ? " +
                "ORDER BY pe.añoInicio";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, matricula);

            try (ResultSet rs = stmt.executeQuery()) {
                boolean firstRow = true;

                while (rs.next()) {
                    if (firstRow) {
                        // Imprime la matrícula y el nombre del alumno solo una vez
                        System.out.println();
                        System.out.println("Matrícula: " + rs.getString("Matricula"));
                        System.out.println("Alumno: " + rs.getString("Alumno"));
                        System.out.println("Historial Académico:");
                        System.out.println("┌───────────────────────────────────────────────────────────────────────────┐");
                        System.out.printf("| %-18s | %-17s | %-21s | %-8s |%n",
                                "Inicio del Periodo", "Final del Periodo", "Grado", "Grupo");
                        System.out.println("├───────────────────────────────────────────────────────────────────────────┤");
                        firstRow = false;
                    }

                    System.out.printf("| %-18s | %-17s | %-21s | %-8s |%n",
                            rs.getString("Inicio_del_Periodo_Escolar"),
                            rs.getString("Final_del_Periodo_Escolar"),
                            rs.getString("Grado"),
                            rs.getString("Grupo"));
                }

                if (!firstRow) {
                    System.out.println("└───────────────────────────────────────────────────────────────────────────┘");
                } else {
                    // Si no hay registros
                    System.out.println("No se encontraron registros para la matrícula: " + matricula);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void restablecerPassword(Scanner sc, String matricula) {

        String sql = "UPDATE alumno SET password = ? WHERE matricula = ?";
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, matricula);
            stmt.setString(2, matricula);
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("La contraseña se ha cambiado exitosamente.");
            } else {
                System.out.println("No se encontró ningún alumno con esa matrícula.");
            }

        } catch (SQLException e) {
            System.out.println("Error al cambiar la contraseña: " + e.getMessage());
        }

    }

    public static void cambiarPassword(Scanner sc, String matricula) {
        AlumnoDAO alumnoDAO = new AlumnoDAO();

        String currentPassword = Valid.getValidString(sc, "Ingrese su contraseña actual: ", 30);
        try {
            // Verify the current password
            String storedPassword = alumnoDAO.obtenerPassword(matricula); // Assume this method retrieves the current
                                                                          // password from DB
            if (!storedPassword.equals(currentPassword)) {
                System.out.println("La contraseña actual es incorrecta.");
                return;
            }

            // Input new password
            String newPassword = Valid.getValidString(sc, "Ingrese la nueva contraseña: ", 30);
            String confirmPassword = Valid.getValidString(sc, "Confirme la nueva contraseña: ", 30);

            // Check if new passwords match
            if (!newPassword.equals(confirmPassword)) {
                System.out.println("Las contraseñas no coinciden. Inténtelo de nuevo.");
                return;
            }

            // Update the password in the database
            String sql = "UPDATE alumno SET password = ? WHERE matricula = ?";
            try (Connection conn = DatabaseConnection.getConnection();
                    PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setString(1, newPassword);
                stmt.setString(2, matricula);
                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
                    System.out.println("La contraseña se ha cambiado exitosamente.");
                } else {
                    System.out.println("No se encontró ningún alumno con esa matrícula.");
                }

            } catch (SQLException e) {
                System.out.println("Error al cambiar la contraseña: " + e.getMessage());
            }

        } catch (SQLException e) {
            System.out.println("Error al verificar la contraseña actual: " + e.getMessage());
        }
    }

    public String obtenerPassword(String matricula) throws SQLException {
        String sql = "SELECT password FROM alumno WHERE matricula = ?";
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, matricula);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("password");
                } else {
                    return null;
                }
            }
        }
    }

    public static void registrarGradoGrupo(String matricula, int grado, int grupo) throws SQLException {
        String sqlGrado = "INSERT INTO grado_alumno (alumno, grado) VALUES (?, ?)";
        String sqlGrupo = "INSERT INTO grupo_alumno (alumno, grupo) VALUES (?, ?)";
        String sqlNombreGrado = "SELECT nombre FROM grado WHERE numero = ?";
        String sqlNombreGrupo = "SELECT nombre FROM grupo WHERE numero = ?";

        try (Connection conn = DatabaseConnection.getConnection()) {
            try (PreparedStatement stmtGrado = conn.prepareStatement(sqlGrado);
                    PreparedStatement stmtGrupo = conn.prepareStatement(sqlGrupo);
                    PreparedStatement stmtNombreGrado = conn.prepareStatement(sqlNombreGrado);
                    PreparedStatement stmtNombreGrupo = conn.prepareStatement(sqlNombreGrupo)) {

                // Asignar grado
                stmtGrado.setString(1, matricula);
                stmtGrado.setInt(2, grado);
                stmtGrado.executeUpdate();

                // Asignar grupo
                stmtGrupo.setString(1, matricula);
                stmtGrupo.setInt(2, grupo);
                stmtGrupo.executeUpdate();

                // Obtener el nombre del grado
                stmtNombreGrado.setInt(1, grado);
                String nombreGrado = "";
                try (ResultSet rsGrado = stmtNombreGrado.executeQuery()) {
                    if (rsGrado.next()) {
                        nombreGrado = rsGrado.getString("nombre");
                    }
                }

                // Obtener el nombre del grupo
                stmtNombreGrupo.setInt(1, grupo);
                String nombreGrupo = "";
                try (ResultSet rsGrupo = stmtNombreGrupo.executeQuery()) {
                    if (rsGrupo.next()) {
                        nombreGrupo = rsGrupo.getString("nombre");
                    }
                }

                // Mensaje de confirmación
                System.out.println("El alumno con matrícula " + matricula + " ha sido registrado en el grado "
                        + nombreGrado + " y en el grupo " + nombreGrupo + ".");

            } catch (SQLException e) {
                System.err.println("Error al asignar grado y grupo: " + e.getMessage());
                throw e;
            }
        } catch (SQLException e) {
            System.err.println("Error en la conexión a la base de datos: " + e.getMessage());
            throw e;
        }
    }

    public static int obtenerGrado(String matricula) throws SQLException {
        String sql = "SELECT grad.numero as Grado " +
                "FROM alumno as a " +
                "INNER JOIN grupo_alumno as ga on ga.alumno = a.matricula " +
                "INNER JOIN grupo as g on ga.grupo = g.numero " +
                "INNER JOIN grado as grad on g.grado = grad.numero " +
                "INNER JOIN periodo as p on periodo = p.numero " +
                "WHERE a.matricula = ? and periodo = ?";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, matricula);
            stmt.setInt(2, 4);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("Grado");
                } else {
                    System.out.println("No se encontró el alumno en el periodo actual.");
                    return -1; // Indicador de que no se encontró el grado
                }
            }
        }
    }

    public static String obtenerNivelEducativo(String matricula) throws SQLException {
        String sql = "SELECT ne.codigo as Nivel " +
                "FROM alumno as a " +
                "INNER JOIN grupo_alumno as ga on ga.alumno = a.matricula " +
                "INNER JOIN grupo as g on ga.grupo = g.numero " +
                "INNER JOIN grado as grad on g.grado = grad.numero " +
                "INNER JOIN nivel_educativo as ne on ne.codigo = grad.nivel_educativo " +
                "INNER JOIN periodo as p on periodo = p.numero " +
                "WHERE a.matricula = ? and periodo = ?";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, matricula);
            stmt.setInt(2, 4);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("Nivel");
                } else {
                    System.out.println("No se encontró el alumno en el periodo actual.");
                    return null; // Indicador de que no se encontró el nivel educativo
                }
            }
        }
    }

}