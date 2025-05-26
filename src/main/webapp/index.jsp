<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>NetSysFX</title>

    <!--Estilos CSS -->
    <link rel="stylesheet" href="css/estilos.css">

    <!--Boostrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">

    <!--Boostrap Iconos -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">


  </head>

 
  <body class="d-flex flex-column min-vh-100">

    <!--Cebecero-->
    <jsp:include page="WEB-INF/paginas/comunes/cabecero.jsp"/>

    <!--Botones de navegación-->
    <jsp:include page="WEB-INF/paginas/comunes/botonesNavegacion.jsp"/>

    <!-- Contenido principal (esto ocupa el espacio disponible) -->
    <main class="flex-fill">
      <%
        String pagina = request.getParameter("pagina");
        if (pagina == null || pagina.isEmpty()) {
          pagina = "inicio";
        }
        String ruta = "WEB-INF/paginas/" + pagina + ".jsp";
      %>
      <jsp:include page="<%= ruta %>" />
    </main>

    <!--Pie de página pegado al fondo si el contenido es corto -->
    <jsp:include page="WEB-INF/paginas/comunes/piePagina.jsp"/>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  </body>
</html>
