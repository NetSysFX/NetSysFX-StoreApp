<!-- solicitudCotizacion.jsp -->
<div class="container my-5">
  <h2 class="mb-4 text-primary">Solicitud de Cotización</h2>

  <form action="CotizacionServlet" method="post">
    <!-- Datos personales -->
    <div class="row mb-3">
      <div class="col-md-6">
        <label for="nombre" class="form-label">Nombres y Apellidos</label>
        <input type="text" class="form-control" id="nombre" name="nombre" required>
      </div>
      <div class="col-md-6">
        <label for="ciudad" class="form-label">Ciudad</label>
        <select class="form-select" id="ciudad" name="ciudad" required>
          <option value="">Seleccione una ciudad</option>
          <option value="Medellín">Medellín</option>
          <option value="Bogotá">Bogotá</option>
          <option value="Barranquilla">Barranquilla</option>
          <option value="Pasto">Pasto</option>
         </select>
      </div>
    </div>

    <div class="row mb-3">
      <div class="col-md-6">
        <label for="direccion" class="form-label">Dirección</label>
        <input type="text" class="form-control" id="direccion" name="direccion" required>
      </div>
      <div class="col-md-6">
        <label for="celular" class="form-label">Celular</label>
        <input type="tel" class="form-control" id="celular" name="celular" required>
      </div>
    </div>

    <!-- Selección de productos -->
    <h5 class="mt-4 mb-3 text-secondary">Productos a cotizar</h5>

    <div class="form-check mb-2">
      <input class="form-check-input" type="checkbox" name="producto" value="Laptop" id="laptop">
      <label class="form-check-label" for="laptop">Laptop</label>
      <input type="number" class="form-control mt-1 w-25" name="cantidad_Laptop" placeholder="Cantidad">
    </div>

    <div class="form-check mb-2">
      <input class="form-check-input" type="checkbox" name="producto" value="Mouse" id="mouse">
      <label class="form-check-label" for="mouse">Mouse</label>
      <input type="number" class="form-control mt-1 w-25" name="cantidad_Mouse" placeholder="Cantidad">
    </div>

    <div class="form-check mb-4">
      <input class="form-check-input" type="checkbox" name="producto" value="Teclado" id="teclado">
      <label class="form-check-label" for="teclado">Teclado</label>
      <input type="number" class="form-control mt-1 w-25" name="cantidad_Teclado" placeholder="Cantidad">
    </div>

    <!-- Botones -->
    <div class="d-flex justify-content-between">
      <button type="submit" class="btn btn-success">Enviar datos</button>
      <a href="index.jsp" class="btn btn-danger">Cancelar</a>
    </div>
  </form>
</div>
