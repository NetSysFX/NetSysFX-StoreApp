<%
  String cuento = (String) session.getAttribute("cuentoGenerado");
%>

<div class="container py-5">
  <h2 class="text-center text-success mb-4">Tu cuento personalizado</h2>

  <div class="row justify-content-center">
    <div class="col-md-8 col-lg-6">
      <div class="card shadow border border-success">
        <div class="card-body">
          <p class="lead"><%= cuento %></p>
        </div>
      </div>

      <div class="text-center mt-4">
        <a href="index.jsp?pagina=disenaTuCuento" class="btn btn-outline-success">
          Crear otro cuento <i class="bi bi-arrow-repeat ms-1"></i>
        </a>
      </div>
    </div>
  </div>
</div>
