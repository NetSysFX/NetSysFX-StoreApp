package web;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class CotizacionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String ciudad = request.getParameter("ciudad");
        String direccion = request.getParameter("direccion");
        String celular = request.getParameter("celular");

        String[] productos = request.getParameterValues("producto");
        String[] cantidades = request.getParameterValues("cantidad");

        // Configurar conexión
        String jdbcUrl = "jdbc:mysql://localhost:3306/netsysfx?useSSL=false&useTimezone=true&serverTimezone=UTC&allowPublicKeyRetrieval=true";
        String dbUser = "root";
        String dbPassword = "admin"; // o la contraseña que uses

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            String sql = "INSERT INTO solicitudes_cotizacion (nombre, ciudad, direccion, celular, producto, cantidad) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);

            for (int i = 0; i < productos.length; i++) {
                stmt.setString(1, nombre);
                stmt.setString(2, ciudad);
                stmt.setString(3, direccion);
                stmt.setString(4, celular);
                stmt.setString(5, productos[i]);
                stmt.setInt(6, Integer.parseInt(cantidades[i]));
                stmt.executeUpdate();
            }

            stmt.close();
            conn.close();

            // Redirigir al resumen
            response.sendRedirect("index.jsp?pagina=resumenCotizacion");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error al guardar la cotización: " + e.getMessage());
        }
    }
} 


