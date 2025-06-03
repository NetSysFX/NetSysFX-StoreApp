package web;

import datos.CotizacionDAO;
import modelo.Solicitud;
import modelo.ProductoSolicitado;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class CotizacionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Crear objeto solicitud
            Solicitud solicitud = new Solicitud();
            solicitud.setNombre(request.getParameter("nombre"));
            solicitud.setCiudad(request.getParameter("ciudad"));
            solicitud.setDireccion(request.getParameter("direccion"));
            solicitud.setCelular(request.getParameter("celular"));

            // Guardar solicitud
            int solicitudId = CotizacionDAO.guardarSolicitud(solicitud);

            // Obtener productos
            String[] productos = request.getParameterValues("producto");
            if (productos != null) {
                for (String producto : productos) {
                    String cantidadStr = request.getParameter("cantidad_" + producto);
                    if (cantidadStr != null && !cantidadStr.isEmpty()) {
                        ProductoSolicitado p = new ProductoSolicitado();
                        p.setSolicitudId(solicitudId);
                        p.setProducto(producto);
                        p.setCantidad(Integer.parseInt(cantidadStr));
                        CotizacionDAO.guardarProducto(p);
                    }
                }
            }

            response.sendRedirect("index.jsp?pagina=resumenCotizacion");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
