package datos;

import java.sql.*;

public class ConexionBD {
    private static final String URL = "jdbc:mysql://localhost:3306/netsysfx?useSSL=false";
    private static final String USER = "root";
    private static final String PASSWORD = "admin";

    public static Connection obtenerConexion() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
