package datos;

import java.sql.*;
import java.util.*;
import modelo.Solicitud;
import modelo.ProductoSolicitado;
import datos.ConexionBD;

public class CotizacionDAO {

    public static int guardarSolicitud(Solicitud solicitud) throws Exception {
        String sql = "INSERT INTO solicitudes (nombre, ciudad, direccion, celular) VALUES (?, ?, ?, ?)";
        try (Connection conn = ConexionBD.obtenerConexion(); PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, solicitud.getNombre());
            stmt.setString(2, solicitud.getCiudad());
            stmt.setString(3, solicitud.getDireccion());
            stmt.setString(4, solicitud.getCelular());
            stmt.executeUpdate();

            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            } else {
                throw new SQLException("No se generó ID");
            }
        }
    }

    public static void guardarProducto(ProductoSolicitado p) throws Exception {
        String sql = "INSERT INTO productos_solicitados (solicitud_id, producto, cantidad) VALUES (?, ?, ?)";
        try (Connection conn = ConexionBD.obtenerConexion(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, p.getSolicitudId());
            stmt.setString(2, p.getProducto());
            stmt.setInt(3, p.getCantidad());
            stmt.executeUpdate();
        }
    }

    public static List<ProductoSolicitado> obtenerProductosPorSolicitud(int solicitudId) throws Exception {
        List<ProductoSolicitado> productos = new ArrayList<>();
        String sql = "SELECT * FROM productos_solicitados WHERE solicitud_id = ?";
        try (Connection conn = ConexionBD.obtenerConexion(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, solicitudId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ProductoSolicitado p = new ProductoSolicitado();
                p.setId(rs.getInt("id"));
                p.setSolicitudId(rs.getInt("solicitud_id"));
                p.setProducto(rs.getString("producto"));
                p.setCantidad(rs.getInt("cantidad"));
                productos.add(p);
            }
        }
        return productos;
    }

    // Obtener la última solicitud registrada
    public static Solicitud obtenerUltimaSolicitud() throws Exception {
        String sql = "SELECT * FROM solicitudes ORDER BY id DESC LIMIT 1";
        try (Connection conn = ConexionBD.obtenerConexion(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {

            if (rs.next()) {
                Solicitud s = new Solicitud();
                s.setId(rs.getInt("id"));
                s.setNombre(rs.getString("nombre"));
                s.setCiudad(rs.getString("ciudad"));
                s.setDireccion(rs.getString("direccion"));
                s.setCelular(rs.getString("celular"));
                return s;
            } else {
                throw new SQLException("No se encontró ninguna solicitud");
            }
        }
    }

// Obtener productos por la última solicitud (atajo)
    public static List<ProductoSolicitado> obtenerProductosUltimaSolicitud() throws Exception {
        Solicitud ultima = obtenerUltimaSolicitud();
        return obtenerProductosPorSolicitud(ultima.getId());
    }

}
