<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="modelo.Solicitud, modelo.ProductoSolicitado, datos.CotizacionDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
  Solicitud ultimaSolicitud = null;
  List<ProductoSolicitado> productos = new ArrayList<>();
  Map<String, Integer> precios = Map.of(
    "Laptop", 2800000,
    "Mouse", 50000,
    "Teclado", 120000
  );
  int total = 0;

  try {
    ultimaSolicitud = CotizacionDAO.obtenerUltimaSolicitud();
    if (ultimaSolicitud != null) {
      productos = CotizacionDAO.obtenerProductosPorSolicitud(ultimaSolicitud.getId());
    }
  } catch (Exception e) {
    out.println("<div class='alert alert-danger'>Error al cargar el resumen: " + e.getMessage() + "</div>");
  }
%>

<div class="container my-5">
  <h2 class="text-success mb-4">Resumen de Cotización</h2>

  <% if (ultimaSolicitud != null) { %>
    <div class="card shadow-sm">
      <div class="card-body">
        <h5 class="card-title">Información del Cliente</h5>
        <p><strong>Nombre:</strong> <%= ultimaSolicitud.getNombre() %></p>
        <p><strong>Ciudad:</strong> <%= ultimaSolicitud.getCiudad() %></p>
        <p><strong>Dirección:</strong> <%= ultimaSolicitud.getDireccion() %></p>
        <p><strong>Celular:</strong> <%= ultimaSolicitud.getCelular() %></p>
      </div>
    </div>

    <h4 class="mt-5 mb-3">Productos Cotizados</h4>
    <table class="table table-bordered table-striped shadow-sm">
      <thead class="table-info">
        <tr>
          <th>Producto</th>
          <th>Cantidad</th>
          <th>Precio Unitario</th>
          <th>Subtotal</th>
        </tr>
      </thead>
      <tbody>
        <% for (ProductoSolicitado p : productos) {
            String producto = p.getProducto();
            int cantidad = p.getCantidad();
            int precio = precios.getOrDefault(producto, 0);
            int subtotal = cantidad * precio;
            total += subtotal;
        %>
          <tr>
            <td><%= producto %></td>
            <td><%= cantidad %></td>
            <td>$<%= String.format("%,d", precio) %></td>
            <td>$<%= String.format("%,d", subtotal) %></td>
          </tr>
        <% } %>
      </tbody>
      <tfoot class="table-light">
        <tr>
          <th colspan="3" class="text-end">Total</th>
          <th>$<%= String.format("%,d", total) %></th>
        </tr>
      </tfoot>
    </table>
  <% } else { %>
    <div class="alert alert-warning">No se encontró ninguna solicitud reciente.</div>
  <% } %>

  <a href="index.jsp" class="btn btn-primary mt-4">Volver al inicio</a>
</div>
