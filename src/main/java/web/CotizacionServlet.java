package web;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class CotizacionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Obtener los datos del formulario
        String nombre = request.getParameter("nombre");
        String producto = request.getParameter("producto");
        String cantidad = request.getParameter("cantidad");
        String comentarios = request.getParameter("comentarios");

        // 2. Guardarlos como atributos para mostrarlos en la respuesta
        request.setAttribute("nombre", nombre);
        request.setAttribute("producto", producto);
        request.setAttribute("cantidad", cantidad);
        request.setAttribute("comentarios", comentarios);

        // 3. Redirigir a una JSP que muestre la cotización
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp?pagina=resultadoCotizacion");
        dispatcher.forward(request, response);

    }
}
