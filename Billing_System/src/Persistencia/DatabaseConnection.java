package Persistencia;

import java.sql.*;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/billing_system";
    private static final String USER = "root";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, "");
    }
}