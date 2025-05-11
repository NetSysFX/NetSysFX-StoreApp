<div class="container py-5">
    <h2 class="text-center fw-bold text-primary mb-4">Solicitud de Cotización</h2>

    <form action="CotizacionServlet" method="post" class="mx-auto" style="max-width: 600px;">

        <div class="mb-3">
            <label for="nombre" class="form-label">Nombre completo</label>
            <input type="text" class="form-control" id="nombre" name="nombre" required>
        </div>

        <div class="mb-3">
            <label for="producto" class="form-label">Producto deseado</label>
            <input type="text" class="form-control" id="producto" name="producto" required>
        </div>

        <div class="mb-3">
            <label for="cantidad" class="form-label">Cantidad</label>
            <input type="number" class="form-control" id="cantidad" name="cantidad" min="1" required>
        </div>

        <div class="mb-3">
            <label for="comentarios" class="form-label">Comentarios</label>
            <textarea class="form-control" id="comentarios" name="comentarios" rows="3"></textarea>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-info text-white">
                Enviar Cotización <i class="bi bi-send ms-2"></i>
            </button>
        </div>
    </form>
</div>
