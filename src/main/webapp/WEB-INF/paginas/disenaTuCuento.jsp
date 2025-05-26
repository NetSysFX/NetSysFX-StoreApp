<div class="container py-5">
  <h2 class="text-center text-primary mb-4">Diseña tu cuento</h2>

  <div class="row justify-content-center">
    <div class="col-md-8 col-lg-6">
      <div class="card shadow-sm border-info">
        <div class="card-body">
          <form action="CuentoServlet" method="post">
            <div class="mb-3">
              <label class="form-label fw-bold">Nombres y Apellidos</label>
              <input type="text" name="nombre" class="form-control" required>
            </div>
            <div class="mb-3">
              <label class="form-label fw-bold">Apodo</label>
              <input type="text" name="apodo" class="form-control" required>
            </div>
            <div class="mb-3">
              <label class="form-label fw-bold">Color de Cabello</label>
              <input type="text" name="cabello" class="form-control" required>
            </div>
            <div class="mb-3">
              <label class="form-label fw-bold">Color de Ojos</label>
              <input type="text" name="ojos" class="form-control" required>
            </div>
            <div class="mb-3">
              <label class="form-label fw-bold">Edad</label>
              <input type="number" name="edad" class="form-control" required>
            </div>
            <div class="mb-3">
              <label class="form-label fw-bold">Hobby</label>
              <input type="text" name="hobby" class="form-control" required>
            </div>

            <div class="d-grid mt-4">
              <button type="submit" class="btn btn-info text-white fw-bold">
                Continuar
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
