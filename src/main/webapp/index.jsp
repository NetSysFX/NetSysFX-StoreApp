<!doctype html>
<html >
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>NetSysFX</title>

        <!--Boostrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
        <!--Boostrap Iconos -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    </head>
    <body>

        <!--Cebecero-->
        <jsp:include page="WEB-INF/paginas/comunes/cabecero.jsp"/>

        <!--Botones de navegacion-->
        <jsp:include page="WEB-INF/paginas/comunes/botonesNavegacion.jsp"/>


        <!-- CAPTURAMOS el parámetro ?pagina=... -->
        <%
            String pagina = request.getParameter("pagina");
            if (pagina == null || pagina.isEmpty()) {
                pagina = "inicio";
            }
            String ruta = "WEB-INF/paginas/" + pagina + ".jsp";
        %>

        <jsp:include page="<%= ruta%>" />


        <!--Pie de pagina-->
        <jsp:include page="WEB-INF/paginas/comunes/piePagina.jsp"/>




        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
    </body>
</html>